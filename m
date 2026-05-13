Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011050.outbound.protection.outlook.com [52.101.57.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B33D3D15;
	Wed, 13 May 2026 06:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778654188; cv=fail; b=KPDZ/3A70LTulTGvyP89WgPuX4aUlfkL+y3OTge558/iZmSNKwadRzTZRYHdQ5emk376gAx7no2xIoUFhnmf0UM0PC6+uPOT330wL4r15fHELwr8duuO9MQSStFWF96nwOA00d7Acgm28UuYe8rFfoytQgVuFvyHVjfiC4bEzG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778654188; c=relaxed/simple;
	bh=T2rfTAS4i4SVsEJ1hHDd91sA6uoYz6+0aYitS7Pmwwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZS3KGd6rOR3oD/hFjpcIuSSaBs3BRna44h4ysvk6uwYwCzanH+83+VL/oWFlKCdyi8FM5eCHti4isa8LtPCBYE1f9NgSt1WZk1tgtgkBjUNMMr0J2kQeyiVbi4WciPSoGVFtwNEGcXlu5tXbJgOMyQ4yZxgywq31dpmkt6Leqng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WkdwnS+B; arc=fail smtp.client-ip=52.101.57.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WkdwnS+B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2it10TVwx+6JwjcFC2ZJzBOprk7lRWyG7F8/BAPtmKJF6edssCZYh0iBwnWHdInt1AmAmZUtWO7a5REKaYwEy748tBFb7+HYymH+QoJ9p/MhtEDAiWC8BmiiMTGPhAavt7iQKcUKOo2aXsJU2CqEqBBHFrV0dC7hDugZ48C9qYyFNckog4gp78k07N1Abx5UZUhomZl6NiqLgOwIFAcI4Nwwz8Y9sISDjLtMPVMgaNzxjh3WzDIPEYNgLC2gvU8f142tm1MhsYkzlhKJPDSD6dLUfMjsaqtdzkb76XjBJQlvOtQun+IQqoog5o1vVFIci83NeHOPUlED1JxyY6r3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu81BoPo8ArOKCl+A3FzzM4J2k0G3XTpLmBACyq6Fu8=;
 b=q47BwPW7EbOrtoed/JzSTcpW64Nhu6sOnKLyB7eLB7sTkgvil9SLKnIUzps7do7pYKEit6RYmH6DT0rM7FPDUutv+wzBqvF4xHHXuJznqK50V5qSWznoF+pgdiJqFlDpwsZmYPaTXZn1J6gR5KpiyVUXwGHLJDSWs/QqDngt8jWC+zO/dYHpYbJenm8uccQbY0cHrsg8bUq6PnRy7iZDPdQfEb5M1agiWQieU58l3ucZHB6IJG8cN2K9I4plDs1iY6Fo8/i815N2a3aRfBHDkv4JWfCfkEMqVKr6IQtETPr0aBjF+3xmmDSwDgy7Bct2PY5+a70QSrXJ4H5yB8wsxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tu81BoPo8ArOKCl+A3FzzM4J2k0G3XTpLmBACyq6Fu8=;
 b=WkdwnS+BEGTDfTJMLcuz023aoWRqwkgpjzEGsGzGr5ZkieFteCtFnX5Da+S5mpiM/YpBtqEcCj94Sc3mPyFHVSYlVU0k5dFcyhnDgbkdo9fkL0DJtpqvJJhmhBVgePNma5ylqWwQ4xvQCtJvBiAtv3tV/CSx4sWy0uLAwljCAKk=
Received: from SA1PR03CA0009.namprd03.prod.outlook.com (2603:10b6:806:2d3::20)
 by IA0PR12MB8326.namprd12.prod.outlook.com (2603:10b6:208:40d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 06:36:21 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::39) by SA1PR03CA0009.outlook.office365.com
 (2603:10b6:806:2d3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 06:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 06:36:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 13 May
 2026 01:36:19 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 May
 2026 01:36:19 -0500
Received: from [172.31.184.125] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 01:36:17 -0500
Message-ID: <972e0f45-074b-455d-80b5-f78d6e20fb3b@amd.com>
Date: Wed, 13 May 2026 12:06:11 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary
 attributes larger than PAGE_SIZE
To: Greg KH <gregkh@linuxfoundation.org>
CC: Muralidhara M K <muralidhara.mk@amd.com>, <ilpo.jarvinen@linux.intel.com>,
	<rafael@kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-5-muralidhara.mk@amd.com>
 <2026051214-getaway-mammary-debb@gregkh>
 <47c6134b-c0ed-44af-b77e-145bfceded74@amd.com>
 <2026051354-succulent-acting-e006@gregkh>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <2026051354-succulent-acting-e006@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: kprateek.nayak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|IA0PR12MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b675e74-5b0f-48f9-3b37-08deb0b9f1b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	zMrgcTWBtyQyEQ+s14IbZ5fiYacpDuMNueUx9AaSfmHPAa/eOfT3hfWJsPqnXjbo9AlKR5V1uaPC+umu2O/q4Trg/oxZvq+phdlUC3twG6EfibSEynTlt4pAU8bOiV46kk6tybFheUeto6jw9sgn53hCgpDBe1FCFeEiG2jAcbbTWjJO43XmSe4gTjBTzaGcLzgf3qL+F0VhmJtrV1vZhLICrXllGimilL49NBwyHGt3Ybm47ifD3outbT3UcPNDDU7KUZcvxFrRuWLiSfoadC+4gxUnJZ01oH26fcWpV+pCnxYn3BONYkyXUMrgmKIbUw9f1XD2yEgkHw51jqytCZlQOpqBxOd8o0QbNFOYiHytWMHqxSi+ppHO7V+Pk3EAePH3bVCPdcawVKrmoBDZcldQK8PpnaDpK/JdS59g+IjEEkMBZt7sDYo4S2jerrwqYUu5BSH9PpgAcoWVSIvXo57W35iayqARKOcm7y9VYhinOU8yeA216SKCfKyPU1mDO0KSUxS90Tf/qZuoPTh6G5uDcigR08dnd6KRig4ZFNDntyxKitcvQ9X5WnpOvvTxTt9lC2LsSwhSgKYoEVH9AO0j8RrNICr70Urypp36KGJZOX35NsTOVWVbzj32mkBkj5JyKjlph74qc9q8ROkk/Adc+fL6pLSs4bdbcEYgCs8DbLv/ChsbV3utHHH1C1qdtEAsL1EWjjN8nSj+cyGlo4W76Unb7jai82HUmkeEOeo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HayDgGYaus25Iw2U4kXLP/02i1C35V4mUFci8BZeSWhYexd6b4eS+02hbvHw7upMczWJ26YsncboMzaihbcwLbKtaZzUbaqggEAcwiuSKizWs8DTNDlo6xHQlgZwuqZGiI+t60dA9Uiid7utdONWdogjr3WiTIOOjA9JOMwrsynOxOgl475z32Nhbm53HI03SJJ/287em/RsAtGv/kDUZBlOlbMrRjV8Oj7hlfw8IHlwravk8mly/9gkDg4fGrtEvEwObp37igaRm6sqd2qWUOBJ8oLiVVhr+bw2/+0uN+BrfpDGpjatnNdsXStI5R/XAUn2wmM0N03h5eRAE3VNlHURE1gZNNsL4SzZDkP4LqaW/L+XSMzVm8bnv4MdH127JtLwY+hrg6jGdxi7whrX3tpIbKpjD0Rulna37bge72H2KhW8V/EoTsPiBcT6xOjG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 06:36:20.2936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b675e74-5b0f-48f9-3b37-08deb0b9f1b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8326

Hello Greg,

On 5/13/2026 11:54 AM, Greg KH wrote:
>>> That's fine, userspace must be able to handle a "short" read, and will
>>> just continue on and read everything afterward, right?  You can't rely
>>> on userspace always asking for more data.
>>
>> I think this is complicated by the HSMP driver bits that requires the
>> read to issue a HSMP command to the hardware first to updates the
>> table before copying from the MMIO region.
> 
> Then you have bigger problems here :(
> 
>> If a concurrent reader arrives, they'll refresh the table for their
>> PAGE_SIZE chunk read and the prior user will see a torn value. For
>> most part it shouldn't be a problem but folks try to co-relate the
>> Temperature and Power data from the first chunk with the Throttle
>> Indicators in the second chunk and sometimes, they don't match the
>> expectations.
> 
> Again, this is a problem, perhaps do not use sysfs for this?  You can't
> control userspace, and to expect it to always work properly is not going
> to end well.  This change isn't going to fix your problems listed above
> at all.

At some point users had asked for a sysfs interface to read the metric
table but I think we've outgrown it now based on this use-case.

> 
>> The table should never have grown this big but some folks decided it
>> was a good idea and we can't fix it for a while and have hit the
>> PAGE_SIZE limit now.
> 
> Just delete it and use a different interface to the kernel instead
> please.  If you need atomic read/writes, use an ioctl.  Don't try to fix
> sysfs into something that it was not designed for at all.
> 
>> If there is a better alternate, we are all ears, and more than happy
>> to try out an alternative suggestion for the described problem.
> 
> A misc device sounds like the properly solution.

Thank you for that suggestion! That should work for HSMP. We'll check
with the HSMP users and (try) convince them to move away from the
sysfs based interface from the next platform.

> 
>>>> Introduce a new opt-in flag SYSFS_HUGE_BIN_FILE (040000) that drivers
>>>> can OR into their bin_attribute mode.  When set, sysfs selects a new
>>>> kernfs_ops (sysfs_bin_kfops_huge_file_ro) whose .seq_show callback
>>>> pipes the bin_attribute ->read() result through seq_file, allowing
>>>> reads of arbitrary size in one shot.  Existing binary attributes
>>>> without the flag continue using the legacy capped path.
>>>
>>> If this is such a big issue, why not just do it always for binary files?
>>> What is the benefit of keeping two different code paths just for this
>>> "new" flag?
>>
>> We can do that! For bin attributes that specify .size or a size
>> function, we can use a flexible buffer and for the ones that don't, we
>> can enforce a PAGE_SIZE cap like today.
>>
>> Would that be okay?
> 
> Overall, yes, but again, I don't think this is going to fix your
> problem.

Ack! Thank you again for the suggestion. Hopefully everyone if happy
with the misc device based interface and we don't need these changes
in sysfs.

Let me know if you would like the bin attr bits moved to seq_file
based reads similar to sysfs_file_kfops* and I can find some cycles
to do it irrespective of the HSMP bits :-)

-- 
Thanks and Regards,
Prateek

