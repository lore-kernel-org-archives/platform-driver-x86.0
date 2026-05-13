Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011017.outbound.protection.outlook.com [40.93.194.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7E8352C2B;
	Wed, 13 May 2026 04:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778645648; cv=fail; b=A77keVVbqu8gxTHWa8L9/9haIfVmnY8947yN6sycs1K7EQVivSMJg1YA0noZ44Lq0kkZzG02n9JBpqw5sGJ1h2nUGia3vDi8PrBV2gsVIsUSds5nBS+SHyNW0fi0/03Bv7RJpkQjUdPZhg4KermsyXfld3ZauABLkLayxU1wU24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778645648; c=relaxed/simple;
	bh=0bdiZ6M0HmzkSaZO37xIR9CQjslJLmd2O8gsCMLUyPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AAM8vuuYqoN5FsZkyhe2snwattlDeMGwZ1Ih0Ku/SL4XesAMHHP2lru6dnFQ+MMM36nfllrIFrjIz1E04Sa1XXUPQ700wiMkDkpYL6tv4X/VfD2CMAdPtdbgBQT2L5a4ZgnfOrNRgQHyGIoyz+cjy1kVBGdfIziIYRqgWbZBSfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XLxzY7il; arc=fail smtp.client-ip=40.93.194.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XLxzY7il"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqU/lxjdk6D7Bc2ubDZXdkcBDhHaVR1uKr3/iqmXfhcP4hyFBnhSOJGNCOYBWNn0zKdS24zo37Ixos6t/njXscZLyq9sbo08fCs4wFd4mk6h4wIsKQwsmh5eDx5MOYZu0mVlYjccPNmYXYDGT25i7HA8Z3bLa1eatT4tX76/Ul2khK8bN16hCqfwqr/wgwESneGbpEkKoh5JCB3Jl1/g68AQZjGVWtozkHuXMEcguy5zWzE0qo6Icevn1XktWTh6lcomLFwVq8QSZ7doPtLXq7y5Ujj0hS3lmzuw0YAQ9BGYYGbIwa2e+XxRJrGtvq7+LzLoSHQkTEWCYEDGF/Q8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Km//4UGE0m4o8tVvyzN7A0qWsBGsJD+ReZLJ2DSp24c=;
 b=fU2siCvwgZEqKR8xfdFATAKzC6AeVRmwJif5EdsL7KI1slx1hexPyaMoxdiPP3ojAbd1j/BPiLiq5k+s4Aj7goX8JcwSHsrCZVDLfal8tCmmJ66N7KG7fyY1HHaJu1dUwTc0xLJvfPLbgmNM2ysa8V/WKbmKmuA+rwS3EUjKqjfpkz5/yDlUK7bzja4oIC4ZHVqWWjt5YkcSuDdkxi5SncRL+ruhOaY2uYcMRvpSJMr7TsN49WSB/9U3TIDdl6Reuq2OFPNbwDuG8Ab77JTdnbYMNANaJOHvHCWg4gvGR67wjGhG/HU2MbItVgDF3QqIUDxc89dc3HCEZ59vpSbSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Km//4UGE0m4o8tVvyzN7A0qWsBGsJD+ReZLJ2DSp24c=;
 b=XLxzY7ilQLmcByeyGKbh1a98kHZYOSd386DhnDitsWF99Nse0c4TojTMyrwaEEBxh5dkbBuuVm84UHGFrMM00Z/6c/an691no5zDfGmkGrUFwX7kyoee2r4mPZ0phrv7WAngeCm3VFeMq8dFDoXriuM/dvBs+/FtRSm7eO9rY00=
Received: from BL1PR13CA0115.namprd13.prod.outlook.com (2603:10b6:208:2b9::30)
 by BY5PR12MB4114.namprd12.prod.outlook.com (2603:10b6:a03:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 04:14:01 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::a9) by BL1PR13CA0115.outlook.office365.com
 (2603:10b6:208:2b9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 04:14:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 04:14:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 23:14:00 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 21:14:00 -0700
Received: from [172.31.184.125] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 23:13:58 -0500
Message-ID: <47c6134b-c0ed-44af-b77e-145bfceded74@amd.com>
Date: Wed, 13 May 2026 09:43:57 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary
 attributes larger than PAGE_SIZE
To: Greg KH <gregkh@linuxfoundation.org>, Muralidhara M K
	<muralidhara.mk@amd.com>
CC: <ilpo.jarvinen@linux.intel.com>, <rafael@kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<driver-core@lists.linux.dev>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-5-muralidhara.mk@amd.com>
 <2026051214-getaway-mammary-debb@gregkh>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <2026051214-getaway-mammary-debb@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|BY5PR12MB4114:EE_
X-MS-Office365-Filtering-Correlation-Id: 108cab2e-9501-4246-0328-08deb0a60ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YRilh3ofRvuGy2qJXFKDdDdHWdlp58Iq3XRg5CV0qee/lL0pbda411zq3IJQNgWdnTjkrV1PSh2EWD2u5l/hYYktcSxKaDLVEZF2m40xjJKtuAClTeX0RVuyJHG0qRfRPuCDu5x93DeeQfOh2S/SirYi0zU/HcoeEvEKrGjC3gbtnlQcwe7J5dHSWCaNo/CufHRKeVvias0rjXalNW/n42mO4thDwGYuHrDgoBqCRe4p+gMFAobY3UFF9B4TxKyNXkGGmwZbQqJz/NinfixKdhexHSBO6DsqEUZ3qbHVnGI3SOR9HtsFiXwzVzTwmWVC4VYdQ/cNsl+WJD+iPu8H/Y4RXyIlKpKB8s/a2OqofImivHy7QrSHU7QFL5kK81/rp5LkCqVb4UuI1NeENDOqlKNVV8+brZ1asN0zEfewBm4fF0e/VCKljgWVE0/261WZTYLn8NVmv+m8CUjFdgdLKt9trpW5/xD+NkZ+Y9VgLr7OT5kEFiReo2HeAL+I+GMe7xi2vsfOrx98MeGgBf9jCCeBCEPn6pUI45GoSQ2OteVGnvnxM0VF6Hi1FAGPy6tVHC/mwvDX9euYD366WWg2cy/HlBC6vOcPRh8a0JE+fFOGFNEhyn66Jjj0pFO4PnknXz3iTODbIZmg3gSAmzgD+yZ3NHzsMbsa6aBtObm7FCZy0Xs5YN8i+6dWNSpaa1vsfYsU/0p52q6h/T3jEaHd5rtKFqRjxxVXc9u9ow2/bCc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qdjlGg1yy3JfOAUDeYEwlW8vlvD7LkY1b2nj3Mqj+A3ZFgqURmhyA7MTDP3x9hXpwJp4Dz9+BCe148hi1d0Pr9SX32Eh2dLuP9t0T3XVjQo6R7jaaAy3KiwJy7dKne5NgHn3Ujj76WohGKnxMIzWSItiVdnr3g/CvUPxNYsnskiT20z6dqz7xUuSnQgRlT/R8WyfX0whTaSuTskfYdSB4Mr2KsP8OnxyutHWaeBw5RfD1FdMc+5R+SfBoMSsGkjUAB7jpB6n5JXnch26FEynzqGdLYfvILUwknOYAAX6NYZyiQl966gudiJjFhe2fhdMVFRmx+Tk5amp+ogtUd5gFmg/1quOfeJk5d6+ytvssAgvtNJQBcubs3ObUafVi/W30PSo3vNUan+6aNqqqkpO+SZE08LQSeYBotlXtD4PtO8v4NQpIRIu+GCSnSRgHXdM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 04:14:01.2072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 108cab2e-9501-4246-0328-08deb0a60ffc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4114

Hello Greg,

On 5/12/2026 5:31 PM, Greg KH wrote:
> On Mon, Apr 27, 2026 at 09:21:26PM +0530, Muralidhara M K wrote:
>> Historically, sysfs read buffers were allocated with get_zeroed_page(),
>> limiting reads to PAGE_SIZE.  Commit 13c589d5b0ac ("sysfs: use seq_file
>> when reading regular files") transitioned regular (text) attribute reads
>> to seq_file, which can dynamically grow buffers beyond PAGE_SIZE.
>> However, the PAGE_SIZE limit was intentionally preserved for
>> compatibility.  When binary attribute handling was later unified into
>> the same codebase, the non-seq_file read path (kernfs_file_read_iter)
>> retained this PAGE_SIZE cap for binary files as well.
>>
>> Drivers that expose binary attributes larger than PAGE_SIZE — such as
>> the AMD HSMP metric table (~13 KB) — cannot deliver the full content
>> in a single read() call through the existing path.
> 
> That's fine, userspace must be able to handle a "short" read, and will
> just continue on and read everything afterward, right?  You can't rely
> on userspace always asking for more data.

I think this is complicated by the HSMP driver bits that requires the
read to issue a HSMP command to the hardware first to updates the
table before copying from the MMIO region.

If a concurrent reader arrives, they'll refresh the table for their
PAGE_SIZE chunk read and the prior user will see a torn value. For
most part it shouldn't be a problem but folks try to co-relate the
Temperature and Power data from the first chunk with the Throttle
Indicators in the second chunk and sometimes, they don't match the
expectations.

The table should never have grown this big but some folks decided it
was a good idea and we can't fix it for a while and have hit the
PAGE_SIZE limit now.

If there is a better alternate, we are all ears, and more than happy
to try out an alternative suggestion for the described problem.

> 
>> Introduce a new opt-in flag SYSFS_HUGE_BIN_FILE (040000) that drivers
>> can OR into their bin_attribute mode.  When set, sysfs selects a new
>> kernfs_ops (sysfs_bin_kfops_huge_file_ro) whose .seq_show callback
>> pipes the bin_attribute ->read() result through seq_file, allowing
>> reads of arbitrary size in one shot.  Existing binary attributes
>> without the flag continue using the legacy capped path.
> 
> If this is such a big issue, why not just do it always for binary files?
> What is the benefit of keeping two different code paths just for this
> "new" flag?

We can do that! For bin attributes that specify .size or a size
function, we can use a flexible buffer and for the ones that don't, we
can enforce a PAGE_SIZE cap like today.

Would that be okay?

-- 
Thanks and Regards,
Prateek

