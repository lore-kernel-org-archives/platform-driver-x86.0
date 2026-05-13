Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49638B7CD;
	Wed, 13 May 2026 03:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778644774; cv=fail; b=qvLDA56v5U81sh+Ae++S4m4xgYoSHeAMEdIdRM9E6WvuoTq39Myxu0iN8ZBGZA0CVCovv0xIwnVwfbuX4Osg0cMmoaeV5AZxHRbywb1auRzMO4Ph4j+ARY2WjhgG8TiFnTOhMW7btK1YxUr29Z+EukSG+/+NuEqW8rgjTnQ4unw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778644774; c=relaxed/simple;
	bh=ZVi7sQzW1yoBCbE/X0nK691cHWuwALScvtHbZ8mqs94=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I00B/LIiYdu1nWdNS1WBS3CkiywvViRfQfvFH0jdOgQRA9Jv0NtgyGEVCt4OLEdv4Cj01syyQ7um7UTW8CLyfG5PeZE0N1hZ1OeEeUM26OXIgNmxKYHrkP8crW1I3pg9JcGnFnNbXEVIP0Xe/DtTqvwd8IUrM9ftfkA0G0pdvV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wF1AhWt5; arc=fail smtp.client-ip=52.101.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wF1AhWt5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EC9NGwkkvIJacu6p8TY27WWeJEEfNLc83n28oYI1gA9UeHU3AM6c/O3VYJ9tFskA9ZQ8aCLLpnLUzYXo7x4YrGqPfYxlCRQk475XAYwlhAKT1SPJYeg9y1S8BW1Mx7R90Uuh1oChOxShTRW8rOHBEX/Pom/jdoJ07jZ2xc52bJvtkyiwIyrTfDZZgCJtREStstAufRd30IKHOuUADAGLBLXY2XdMlbywcBuzHDBPp7bG3z1td/H02isuGtezGXokJKhmjcvGBx+gzdXQzIPlUrSNLOETzndZi/V+dDkZbxu6Vb/DeI/vZ9bgSGw84LhFvouGyxu/tmiHQnDt7IIllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEQ2lz5ARttZKFdARWnzDC1xkBtVrOfh9x+8HuJr/Y0=;
 b=qStiYyo5fXvOboOrRgOQnS4MY8xCRYG1+8kfVcKBEXTrtfsbpgFLTzSeqXTVL+WxCqxZ3MHv1lf6pFx9KWfgtQF+10HA9RSuhtF6CmK9vOdUeBfwrLhHNCOC5oVaN6AKTlZQUhHOxV95tEhffJpVOcxdmjjRpn35UkVlz9wB1Y9CAZevL1DdWg1qZltl2xnPLz7cYlHqLndFyiRFU+oeDIria9xmTqi8tcPqzljbQNvRA64dpG0aAhJMPv9gheW2kSPj0dJzdldzQFd+/j5oh3NnWQpkmMv+J4Gu9X7qXWq0PpvkQ83H6/I5kQn62QlThfhrQyhYK3lLXWoVlmKWYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEQ2lz5ARttZKFdARWnzDC1xkBtVrOfh9x+8HuJr/Y0=;
 b=wF1AhWt5saT8msjkc7LZ8lt0IBxlwgSz0mOC3hHaPCyDmkQZE/7pW83HaWOgHWxZHiYwI+nMLRai+0gxafW0bqCy4FHabscYDKZ3vaea7VcCm70Yqs+vDoWOrcB56BDp9XsO5YyjcQzmqhgY+2zfsfQdZ9jZOrj5tLCPN3hfNn0=
Received: from SA1P222CA0088.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::15)
 by DM4PR12MB6663.namprd12.prod.outlook.com (2603:10b6:8:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 03:59:26 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:806:35e:cafe::54) by SA1P222CA0088.outlook.office365.com
 (2603:10b6:806:35e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 03:59:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 03:59:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 22:59:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 22:59:23 -0500
Received: from [172.31.184.125] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 22:59:20 -0500
Message-ID: <f1d24d38-0d26-4aa1-abdd-b663fb7d8feb@amd.com>
Date: Wed, 13 May 2026 09:29:19 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary
 attributes larger than PAGE_SIZE
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Muralidhara M K <muralidhara.mk@amd.com>, Danilo Krummrich <dakr@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, <platform-driver-x86@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-5-muralidhara.mk@amd.com>
 <c288b106-b8fb-bd4c-fd47-062cd03cd337@linux.intel.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <c288b106-b8fb-bd4c-fd47-062cd03cd337@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|DM4PR12MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 896a7826-f502-43ec-b3da-08deb0a405fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|11063799003|56012099003|22082099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	sMB5l4SCDZsA5vUSy8WJMiZKWGBXQm8erqOHq0ROLislQIcXxo99SBgF0f07gGEyq32B9gLBhOxpYvbdL5HHIDCvGiWdt7ZSo74IiRNYy+xukc81LGytvZz3YKVkDokr5cWLKRHOQX2vtgTKulHeLLb5B9GEmB4ejooix9hjCVI6J+aq/vEn+aSjC3lz6gXqS4EQ5my0bm1FtTpXf0ZoR/jEa8Gi6wQUCe6n5XEPtJQ9YeObCpUr3krNyHO7EPVAsyX95C+Y8uIhG/wuEDdeIO2XhQfljy2UgpuNat4ueS6IAZtNtDAkKp7Z0DHLGR/JagaLoGjjMU1N9Ia4b1kUS9cdCv8Jtq/lswCmUCc5Q3A2eHfzPFgS1eEu2TxthDTkFBFGB8bcw7LmHDaviXwyByXEtCl08h5+W/1rOWUPOVvaFLeDoxCqLWF1bvXhzhgb/E1wegwRiYWcpTePgHgUnsUqqgVKXUYbV34nREEjH0WR73J66hXOhDl6Uiw7mhbKUioqGmipgh3YzsR2migjpumQ+8pt24Co6CVrfJisTUT2FUe3nBqPKXCbc9SwThTIbC1CKqZyMDubPd3yfYDqKtGvyp8BybGicuXOe453Nv2imcG5u7Qj4iDTVmbRTR+qg9WbvYBGSknLdGSlzG9jDWa1L4T4MEkeWsmsBA2woQuwQmvE28Ogy28SWdKsXkwokCsTL2RwmEeljj9QsCx94cZVfOmWpda5NhggAsKrbro=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(11063799003)(56012099003)(22082099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ga6c0Psgnii9BeECyVMwgXOksHlQ7TUXQkhuxuUEm4HbYkn2fnY0d4WG4wRo7YroHDFZQ5FwcN5Nyiu0Afs6yFk9011KakbLGQ7UlWuwnwOnkA59eUYWgPQYuwg5M1yfUZkbCjedysuZBqdq8kok8HW2QZYF00hH1RiJ3yoDl+1JfcKhJivjd+jwDdhnrVkURiJV+R6ddM4fyRzkjVQ9Sc6Ia1QZqwWLkyVv+0C0bySMqgFHCYUzYQ0I7933iMaNgv20Pcs8/si4lu740xR7qd2JA2zuGQn8AhAWKvBjikltS8QtUA5uF5BpZXvO4Z/9CBxDC9uhz2IgwJY3zbsOLlgt+EqPw9xLYxW/lhIUle4DMNEN2OcinLI+NcM6ySiDegIQMoNvkpNW+WAlM+ebsYcKJ0VGutNoWjSgzGwj/va8MERx2Uwri+9+mYAG3KLL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 03:59:25.4152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 896a7826-f502-43ec-b3da-08deb0a405fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6663

Hello Ilpo,

On 5/12/2026 5:14 PM, Ilpo Järvinen wrote:
>> Historically, sysfs read buffers were allocated with get_zeroed_page(),
>> limiting reads to PAGE_SIZE.  Commit 13c589d5b0ac ("sysfs: use seq_file
>> when reading regular files") transitioned regular (text) attribute reads
>> to seq_file, which can dynamically grow buffers beyond PAGE_SIZE.
> 
> 
>> However, the PAGE_SIZE limit was intentionally preserved for
>> compatibility. When binary attribute handling was later unified into
>> the same codebase, the non-seq_file read path (kernfs_file_read_iter)
>> retained this PAGE_SIZE cap for binary files as well.
> 
> I tried to investigate these claims but with the lack of references,
> I didn't get very far. At least the thread where 13c589d5b0ac came from 
> didn't seem to clearly say the things claimed here (assuming I managed 
> to find all its emails from the archives).

For most part I looked at the code that existed at the time of
13c589d5b0ac and now.

Prior to that commit fill_read_buffer() was the read function which used
get_zeroed_page() for buffering. This is also the reason we have these
defensive bits in the current sysfs_kf_seq_show():

    if (count >= (ssize_t)PAGE_SIZE) {
        ...
        /* Try to struggle along */
        count = PAGE_SIZE - 1;
    }

Also see commit 815d2d50da41 ("driver core: debug for bad
dev_attr_show() return value.") which added that printk() for debugging
the violator of PAGE_SIZE constraints back in the days.

Once sysfs had a seq_file path, the seq_file side handled buffering and
it would do so by calling ->read() in a loop while increasing the
seq_iter buffer size by a scale of 2 each time the content wouldn't fit
in the given buffer.

This is also the reason we have a:

    count = seq_get_buf(sf, &buf);
    if (count < PAGE_SIZE) {
        seq_commit(sf, -1);
        return 0;
    }

which ensures we have a buffer worth PAGE_SIZE before calling the read
function, else, we spoof a overflow and let seq_file bits give us a
bigger buffer when we try to read.

* All snippets are from sysfs_kf_seq_show() in fs/sysfs/file.c

> 
>> Drivers that expose binary attributes larger than PAGE_SIZE — such as
>> the AMD HSMP metric table (~13 KB) — cannot deliver the full content
>> in a single read() call through the existing path.
>>
>> Introduce a new opt-in flag SYSFS_HUGE_BIN_FILE (040000)
> 
>> that drivers can OR into their bin_attribute mode.
> 
> Simplify to:
> 
> for bin_attribute mode.
> 
> ?

Ack!

> 
>> When set, sysfs selects a new
>> kernfs_ops (sysfs_bin_kfops_huge_file_ro) whose .seq_show callback
>> pipes the bin_attribute ->read() result through seq_file, allowing
>> reads of arbitrary size in one shot.  Existing binary attributes
>> without the flag continue using the legacy capped path.
> 
> I suggest you avoid using "legacy" as a term for anything that is in use 
> in any way or still exists. I've seen people to jump on that particular 
> word enough times, it can sidetrack discussions.

Sorry about that! We'll just refer to it as the default / current
behavior henceforth.

Thanks a ton for taking a look at the series! Much appreciated.

-- 
Thanks and Regards,
Prateek

