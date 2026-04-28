Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3583F54DA;
	Tue, 28 Apr 2026 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360841; cv=fail; b=V9zCwS/qMEcccwUUetpmJ787b6Ka8SR6NpcjKxqiLSACINz5mLvFOUlyIE18N7P5kKehP5kUFfz+NAP9RdHsQPPcoFI/sZieLmGc7tpVBnbcds/OGxQqa+ItAmcO0yX+9yHN3/G2AgQjhkPVPb6+c1fH5hO+WJMlvrzGIP3X9KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360841; c=relaxed/simple;
	bh=HkoUONN+mJYTgG8DWgcfa+I7PwwbUkBtyF83+0y1nq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GO8MZHfHH0XNskS9q7m0ubnLXoDsPoaBVg/cUoZkSkTk2uLsTkVH6ae7Sfa7mwapna4iyEtbXQcpEwnvw3KCyIbKr3P8SCKIz2TWVJKZEGi/oR+UjDp6BKJIpMscDTVEuMhVd0RG4S4BcYx1GFLhmHW55npdq+7eZl7cBMpMFbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xDlLj0wr; arc=fail smtp.client-ip=52.101.61.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xDlLj0wr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWzFh4fU3R2Ot5xI8eaBpXaNmMuu1h36m8D+X0lrJ96hKXWgZG6m7K8vif8g7c2vm19ftQfhZdVdMuqQPDzKll+IDTmGQd4Er+m1P+gdyBRIsDk3/FILuyyNGmVDE8wSbz8pG7mxH3gYpmH1+M9MzhDY/0mmJmTTqioLcpIz++PYINy8H1TeySl5B07FyLWfe+zRdP9smuAzKj9AA6QGZohTLJYd4X0URpLtZMG2I71t70W2wemlpLgHmkxuIaf99CMV5Kx10A8b8HO1PlP+5b0klOALFa/MrwHQJ8ay13WMtENEm+KjgjuT0FKQT4ASY0dq/KxUbzTpHENkwYxn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXoc/gw9Vbd66Awu0dleGRRFkHfgTB/oNTpSX+hUnb4=;
 b=GMJnNtlPwNa1kUg7/enploc6kav6xbPxhj8bLVfIVgPSLrJmfND1MYx6r5HvhCh2uD8GNLqAB+Mq1vRRrosdtGjMNfyAxe4Th6iaKJGeejwCsUrAK1LPudR/FCl3Z74rrkLV+MvaZZdayx9i4LaWAjyxixECRhc03N37z+CkkiN8ItEEcGUHdzNsHooz2J8BV14AVcMLahL1pW/s7rAMCxSDrXanHYR4Rtyu3gdA6uRd00v09u/u4fqNyvZmadHGXc9cYok1+AGz2W3wcE7z8GuQDdWOymyp59aLDH4mnn2ONMSzMCQe+714Nx7DWaXQlRSy0vdV6ejtt/91dT+7Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXoc/gw9Vbd66Awu0dleGRRFkHfgTB/oNTpSX+hUnb4=;
 b=xDlLj0wrXXAUgAAmNUilE31XYRrXhc6fexQA5d0tAoqPHpIdNPZAajf43O71eBSsHGDzzw42cKVL1U63xshDWPOg34d+rynkaj2OJwSMpWin1UehEbCST9QVezdSxJzDHuWf6D+lDQlSlbZSfNW2G6lPwN4yo989Avj1TGQChAI=
Received: from SJ0P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::33)
 by DS0PR12MB7559.namprd12.prod.outlook.com (2603:10b6:8:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 07:20:30 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::f3) by SJ0P220CA0022.outlook.office365.com
 (2603:10b6:a03:41b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 07:20:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 07:20:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 28 Apr
 2026 02:20:29 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Apr
 2026 02:20:29 -0500
Received: from [10.136.41.76] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 02:20:27 -0500
Message-ID: <25c4f234-fa6f-4372-9865-41f824452f31@amd.com>
Date: Tue, 28 Apr 2026 12:50:26 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary
 attributes larger than PAGE_SIZE
To: Muralidhara M K <muralidhara.mk@amd.com>, <ilpo.jarvinen@linux.intel.com>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>, Danilo Krummrich
	<dakr@kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<driver-core@lists.linux.dev>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-5-muralidhara.mk@amd.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260427155129.545327-5-muralidhara.mk@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: kprateek.nayak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|DS0PR12MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 43786323-16f4-4c21-9a62-08dea4f6a0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|17002099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	w599GtVhJZEqrtHIYPI267+9yxUQOsty5UirkiVJO37iu/EAnUvpKaTZSlzPt3/qjQufWUhWeyehfocmKRyn0TkjyRWRV0j0ObgrR6jVMTWPk5faMr2lHJbxLYrcZeS5CVCfKBDXyI0UzXCE1COM5708YCua4bSGP9qChhj+sryILONSdfd5ad8dxQhpO3ycOT+kv5LW8vCRDCgDPuuzeFjL/UshHSbBHn1CVApnk8Y59hhoVuL/uG92K4S6Yy+ye3Tb/us/25hf2ffZSmYDA88iv0nXIn8bv4RrGhU3BnkVDxcB3Hggcydgc8jSWyd20QtLV/YyU7IXetymeqpjBE/DEt7beQ2YDoDJ+F0HLApJ3ex85DaS1wpN2zOGxjw28AFvWtERBZHude6cVPwaE/IpOtQrB1UeAKAh7ADf48rkhGndDlBe6MiVLS+1SBb135r54JSAufhI1HOrEUT+3BN+IE0GcWxVJ4sjSAkVkne4uMF72WfqgEloClECjBp+4B+cL2KIUD8ALvDTYU590pNssaIZCNItC2xvQ6XO8oQ8kFlC+XlcuZrtuqNqFZstoqpwv4hphoUTilPPpjjSsqMDa2kYrecaa0JV1yIi/b/UbEm1XFvPuhZmZYT/9qPzjowIShWrGhtZXAbxoIATH2RO9aH3+PZZk6bjIAGh9n6U/h8XWo+noxDQW/MZwvbCM6sjGOTlfYAxWKnBgsEPYpmR6I9b/BJHR7+qJSys064Yh41dPL1L3gM8UEtFAOPg9ngVxc6bi4ObSD3yUFtxkw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(17002099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ADTSG2/OdLpUhM1ftdB3xS7LNbJgJOCeSotmuzcAXcOL56WF97fHb0r3Eij0qfv86nFLSzvVGMmRiYFBH1kLVO0CDYk+9mRfdiBbVUIGxDVw4scaQsQWkMJ1vzrosQ7cf6pyWbxU5Zs5SQ1AGz409G1WQfZak17vRYjcXHPBQIUEMksAFw6lwX2FTfmqZ1QU9C+x9gYjcBmGDfP79F9FkbRHU4uMpZQKlYaopwYM6eAsOwSQZLtae2CoEcY6zhxZ5KaCq2ACl0UZhFT9O6Gjg/GhZIOr/go7Nvw9MuXut3nBBVmypxpVEHSAlfmsbj0/Eq0ezA9z7YmdD19hjX2GgE+2GWvjGU78j6d21GS/AzEDiUVYQql++HZv6Hn2iOcsARbacS9A65v8XKY5VFxgeqjNFxdkUs5t0FKk9WhpIAhXg/HKkrhYxSBY9M3Oxt/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 07:20:30.0678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43786323-16f4-4c21-9a62-08dea4f6a0ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7559

(+ Danilo for the sysfs bits)

Hello folks,

Please treat this patch as an RFC.

On 4/27/2026 9:21 PM, Muralidhara M K wrote:
> Historically, sysfs read buffers were allocated with get_zeroed_page(),
> limiting reads to PAGE_SIZE.  Commit 13c589d5b0ac ("sysfs: use seq_file
> when reading regular files") transitioned regular (text) attribute reads
> to seq_file, which can dynamically grow buffers beyond PAGE_SIZE.
> However, the PAGE_SIZE limit was intentionally preserved for
> compatibility.  When binary attribute handling was later unified into
> the same codebase, the non-seq_file read path (kernfs_file_read_iter)
> retained this PAGE_SIZE cap for binary files as well.
> 
> Drivers that expose binary attributes larger than PAGE_SIZE — such as
> the AMD HSMP metric table (~13 KB) — cannot deliver the full content
> in a single read() call through the existing path.

I have to add that neither of us are familiar with filesystems so our
assumptions might be a way off since we are out of our depths - we only
brought up what we could dig from the commit logs and by looking at the
implementation.

It looks like HSMP users want a sysfs way to read the *entire* metric
table in one go which has proved to be slightly harder to deliver with
the PAGE_SIZE limits in presence on concurrent readers.

Please forgive if this is not correct and if we have failed to uncover
a better approach for the same. We are all ears. (This should have been
ideally marked as an RFC; sorry for the oversight!)

> 
> Introduce a new opt-in flag SYSFS_HUGE_BIN_FILE (040000) that drivers
> can OR into their bin_attribute mode.  When set, sysfs selects a new
> kernfs_ops (sysfs_bin_kfops_huge_file_ro) whose .seq_show callback
> pipes the bin_attribute ->read() result through seq_file, allowing
> reads of arbitrary size in one shot.  Existing binary attributes
> without the flag continue using the legacy capped path.
> 
> Co-developed-by: Nayak K Prateek <kprateek.nayak@amd.com>
> Signed-off-by: Nayak K Prateek <kprateek.nayak@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
> Changes v1->v2: New patch
> 
>  fs/sysfs/file.c       | 45 +++++++++++++++++++++++++++++++++++++++++++
>  fs/sysfs/group.c      |  8 ++++----
>  include/linux/sysfs.h |  1 +
>  3 files changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 5709cede1d75..be42c3c1e056 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -38,6 +38,45 @@ static const struct sysfs_ops *sysfs_file_ops(struct kernfs_node *kn)
>  	return kobj->ktype ? kobj->ktype->sysfs_ops : NULL;
>  }
>  
> +/*
> + * Reads on huge sysfs bin files are handled through seq_file, which
> + * takes care of hairy details like buffering and seeking.  The
> + * following function pipes the bin_attribute ->read() result through
> + * seq_file so that reads larger than PAGE_SIZE work in one shot.
> + */
> +static int sysfs_kf_huge_file_seq_show(struct seq_file *sf, void *v)
> +{
> +	struct kernfs_open_file *of = sf->private;
> +	const struct bin_attribute *battr = of->kn->priv;
> +	struct kobject *kobj = sysfs_file_kobj(of->kn);
> +	loff_t size = file_inode(of->file)->i_size;
> +	ssize_t count;
> +	char *buf;
> +
> +	if (!battr->read)
> +		return -EIO;
> +
> +	if (!size)
> +		return -EIO;
> +
> +	/* acquire buffer and ensure that it's >= size */
> +	count = seq_get_buf(sf, &buf);
> +	if (count < size) {
> +		seq_commit(sf, -1);
> +		return 0;
> +	}
> +
> +	memset(buf, 0, size);
> +
> +	count = battr->read(of->file, kobj, battr, buf, 0, size);
> +	if (count < 0)
> +		return count;
> +
> +	WARN_ON(count > size);
> +	seq_commit(sf, min_t(ssize_t, count, size));
> +	return 0;
> +}
> +
>  /*
>   * Reads on sysfs are handled through seq_file, which takes care of hairy
>   * details like buffering and seeking.  The following function pipes
> @@ -249,6 +288,10 @@ static const struct kernfs_ops sysfs_prealloc_kfops_rw = {
>  	.prealloc	= true,
>  };
>  
> +static const struct kernfs_ops sysfs_bin_kfops_huge_file_ro = {
> +	.seq_show	= sysfs_kf_huge_file_seq_show,
> +};
> +
>  static const struct kernfs_ops sysfs_bin_kfops_ro = {
>  	.read		= sysfs_kf_bin_read,
>  };
> @@ -333,6 +376,8 @@ int sysfs_add_bin_file_mode_ns(struct kernfs_node *parent,
>  		ops = &sysfs_bin_kfops_mmap;
>  	else if (battr->read && battr->write)
>  		ops = &sysfs_bin_kfops_rw;
> +	else if (battr->read && (mode & SYSFS_HUGE_BIN_FILE))
> +		ops = &sysfs_bin_kfops_huge_file_ro;
>  	else if (battr->read)
>  		ops = &sysfs_bin_kfops_ro;
>  	else if (battr->write)
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index b3edae0578c0..2d0b01c00a97 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -74,11 +74,11 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
>  					continue;
>  			}
>  
> -			WARN(mode & ~(SYSFS_PREALLOC | 0664),
> +			WARN(mode & ~(SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664),
>  			     "Attribute %s: Invalid permissions 0%o\n",
>  			     (*attr)->name, mode);
>  
> -			mode &= SYSFS_PREALLOC | 0664;
> +			mode &= SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664;

nit.

Since we would like the flags to only apply to bin files, we probably
don't need this hunk that allows for adding SYSFS_PREALLOC to plain
files.

>  			error = sysfs_add_file_mode_ns(parent, *attr, mode, uid,
>  						       gid, NULL);
>  			if (unlikely(error))
> @@ -107,11 +107,11 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
>  			if (grp->bin_size)
>  				size = grp->bin_size(kobj, *bin_attr, i);
>  
> -			WARN(mode & ~(SYSFS_PREALLOC | 0664),
> +			WARN(mode & ~(SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664),
>  			     "Attribute %s: Invalid permissions 0%o\n",
>  			     (*bin_attr)->attr.name, mode);
>  
> -			mode &= SYSFS_PREALLOC | 0664;
> +			mode &= SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664;
>  			error = sysfs_add_bin_file_mode_ns(parent, *bin_attr,
>  							   mode, size, uid, gid,
>  							   NULL);
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index b1a3a1e6ad09..78f6c6252cf9 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -124,6 +124,7 @@ struct attribute_group {
>  
>  #define SYSFS_PREALLOC		010000
>  #define SYSFS_GROUP_INVISIBLE	020000
> +#define SYSFS_HUGE_BIN_FILE		040000
>  
>  /*
>   * DEFINE_SYSFS_GROUP_VISIBLE(name):

-- 
Thanks and Regards,
Prateek

