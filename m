Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709298;
	b=uahTRH2EWSpZKRde3KNKFAekpjLUN3MLsVAGPTSXFUq1rq7/d+VAqUdF/wwMz9gmo6jq
	 reiVFn9j26ryh2ToV21sHhALdDxiomsBdMANFskCmSTPdA8Qb7lWnmF8QZ7kv8M9xbNnV
	 jz2VAwWXFdGWKxak8G6RB13clLeD6q326Oi2TrkScJocjdDFRVnKLNr6/LmMS/fL9G1kz
	 4javnbKh5xjPQ2MGQmBfOi+3WSbdGuw9zNVMauDABbxH/UNytccnpS8Hc8GXLw89rwnkM
	 vzP7psVOTPHg6ehSEOn/cnbbNZdCwPCjukLHFKnUFr9E1d0EWHQKVirhuN6p8HjL8kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709298;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lRoXdVT1hAjLHQms6l2sncWXqR1OaFUfpYkZdmTJ2/Y=;
	b=3uPymUvFUqpPoufsGiU1m6YnJjcvKgw/nOT475Aw06Yfgyv08+JhlFOkN1ydPCzxeU2F
	 11nwM5kJPTQ3kHScMSDWZBjrXhs4zm4FugZXD2WaLC4VaGGaV23PULHyUE9yq0hod7VBe
	 H9NkcOPieKFhbTW6uF1FTGpCtsskdwRMSmEDs4mEy7y9Sm8JSRL9dFIulaCw7AIX8fEKp
	 gzIik8aErtibxDSBQuNswXALMVxqtUtpBzICR30TyPrXQ817rlTj4uP3ebTNblNkteG/F
	 P8OLQV9oGOOJws8cRFv6BnJ4pPn77dbMZkEHmkk+PQl51GhhrzswXwzZuq/4DHoAgWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rj0AXuVi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.61
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13560606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 16:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13560606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rj0AXuVi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlBXOXsnO3BopSFHIasmDLBbJDcR7U+/y8gf1Ake2DKeCVFoUfkdnk8FVswqmZ7ObMGzUa4VbuAXSuL9v8s5WQElbTZx1VI8+EOnSvmUBemtBahZurc2qsCr8OzWPbMLvalgaw2mAisDRF/zxQuijPWK3xycgLPJXa2a/NZUVj9tgLJyzaa/p78zDpOJ0dg3QGlNAlq4ZFFEjlR254+l+kLtwgWV9lceV9Ed+fblZQ6+1rbiGi7sh9bo5fKFvjjKxLfHlMcBWKadnQ38TLFWE/aTGsmA0/jz9QD8kaYRHWOSDWy2wRh33s+JwpTrz5gfiTrTkcCdHutDxTJdN9bx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRoXdVT1hAjLHQms6l2sncWXqR1OaFUfpYkZdmTJ2/Y=;
 b=QFDAY3MDmo3cLwj/jO9q3sa5TqNmY0fgr0KeRdTi0MvPU7rFZL3GGMGQ9IBfRLTj30oA6eLkf1PSXOkwYngyn6uk/JCTVdOHXnvlPS38lHQaU/Lv78WYAd6dtbQgscUmm5VgTp76w/VFnniqDkkYlipr9cD1SCIfp7lATueA79HgAHmp6M1u7547BRvQsLzvy825mKQnEhegD6QRh5a+c1CzNcXYwMarYBcQOrvuuG9aXzuFL4JhsOBBjzgT4W5iyKcATz1VZuE5tLayaMPeqD6l7QXxNQV+7ZuVcCd9Q5LeA6oXK0QLKksZmr/FPAxpsIBHpbBTThd0DkdV11Wg5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRoXdVT1hAjLHQms6l2sncWXqR1OaFUfpYkZdmTJ2/Y=;
 b=rj0AXuViM7rOpK/uqxC9XZaC9UvEYE8pZl2glRWvS2w2UazTzZnEt8F7YDKHUqKdaob58sSdCbfuxCzP41HKje7Mg7vSK/sp690ECS48bxESFFZLzMUNFatPqxZPErIASHM5WjH7OUWbvdEa2QuPu183JYBXwv8SZRZK59PD0I7wEsQJUEdCmBfHQrn4b13pqFuDi2689HMOz1gI/wlUNfEeuMrDzMfo5jjzAPJuGn9bqdcr82R3D7qAqwRxNjt0cRszRcOp0hVQRXCU+JizW0vVe2QenYWa/l4r9H4awDFCBu13JaxfVxQsoL7+kwEV+KyQG7G/Av4mhizS3iJZXA==
Received: from DS7PR03CA0048.namprd03.prod.outlook.com (2603:10b6:5:3b5::23)
 by IA1PR12MB6115.namprd12.prod.outlook.com (2603:10b6:208:3e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 16:08:12 +0000
Received: from DM3PEPF000265BA.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::37) by DS7PR03CA0048.outlook.office365.com
 (2603:10b6:5:3b5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 16:08:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM3PEPF000265BA.mail.protection.outlook.com (10.167.23.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 16:08:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 08:07:54 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 08:07:52 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>,
	Felix Radensky <fradensky@nvidia.com>, <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] platform/mellanox: nvsw-host-spc6: Add driver for Nvidia SPC6 switches
Date: Thu, 26 Nov 2026 18:07:07 +0200
Message-ID: <20261126160707.846923-1-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e754de42-575a-dff3-8eb6-0e90ae857629@linux.intel.com>
References: <20261125184633.2825486-1-fradensky@nvidia.com> <20261125184633.2825486-3-fradensky@nvidia.com> <e754de42-575a-dff3-8eb6-0e90ae857629@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BA:EE_|IA1PR12MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 644aa75f-5d97-42a1-0ae3-08df4bd777e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|261028144727099003|10067099003|4143699003|261022113327099003|11063799006|56012099006|261022075727099003|261021123027099003|261021121427099003|261021130227099003|261021133027099003|261021135927099003|261102123227099003|261009223027099003|261026130827099003|261022105027099003|261022115727099003|261026135527099003|261026140227099003|261026121527099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	HTUPtEJE8Y8hq6ptY+UFYcj9hlufKNze40XXVoV7JUu+XFEDLtf6NmjeslZl8VOexjV4t7dWzJwOI5UgXQ95VYwTYjNbEJb5ivo58WDWBenjdZLkVJoXO4ciJ5mJYEcw3Ni1o2Ud3YY3sOtT7iJNUuV/N5PWVVXn0JINhh1N3h+YkKn8XA+wXYGmFmjDg/TU6K9jodm+cl8Xdr3nqPkyP9//qKcG0ujWHD59tlj4YQRUHO4Eh6l2mA608b14z5SpFJP/8IyCzKc77jj55cU09Ryr2xjJYOltKZEzZccvnCFzhFEUJmV9Ay/rZmQ5UJAjMR66hqtXaQIzUF5ux8MAG3/5+EXan0EmxW0lWHyIPdOxXKQEtxpjTodc6eUdRNkhCVAOZX9zguTdZhGsMdQCQL7vPKF53ijUOaoakeJNk1Br2x2kEMwu0oKRIkgYq2GsTYb/mO2lE6hXpFer6jE2dYSaJvyfOgpWzhW7hancWmGEaWdYfaYi7bN9xshng2OVv6UD0wxS2nbg+ZE5XwI4/tIFSna1Xr+ppkggLwR96vGCvHPixMLNyor+GQpXuFJI+8mIC4hXd8KR54gQT/bOyV2rNGfvtwaoC6vBnKjEFXuQ0n1mPDohQSuAAK+cDtgO8kITxu07mA5yVICd/AugoU1pinzp4b8QYDeJAKlLyt3i3GICVmieP3uwI9EHZmpuGYnawuIQW1d7/MbTi07Jww==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(261028144727099003)(10067099003)(4143699003)(261022113327099003)(11063799006)(56012099006)(261022075727099003)(261021123027099003)(261021121427099003)(261021130227099003)(261021133027099003)(261021135927099003)(261102123227099003)(261009223027099003)(261026130827099003)(261022105027099003)(261022115727099003)(261026135527099003)(261026140227099003)(261026121527099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bKy1LXixAwQ8OjIB/rZX35Y48zjR9384sFlaLBswdcTWaMOrG5q7ZVLRqDpfxkvXsyuZRC1nKINgR0+AV0EUmOpVBXNgkfmV8V6hdAJ+7opLaVLydyVd3IWnoug5mpop/uT/b8h6ThJdD1nyC995Kn+B298ehf4+Z+BnrVGbjBwNvo+C/42bLvN6etKAFGSscb8IsjIBwgV7cOwKYX49lVOcr8uiB4Bup1G5fmmp/Yg8JTtcPK1rn0ano5mcFg8Ds0FpYSseb4UyYQFvU6istshzXD/ivW3Xm/H0uNO1qmNpf65cX9ccVXoDxTepMYyDdxWvnwJsr+K9DS57uhVwuewlbm2smHjqhsP0ulTduSBBIKtYvnyyzkVTCT/9pegtbIEvgp2zIc5ufKTFxB0Gvn8a0USWeOnqeCb6RsBqKS+kqGWofXVCO3xsSwiIEyAB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:08:10.9823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 644aa75f-5d97-42a1-0ae3-08df4bd777e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6115

Hi Ilpo,

On Wed, 25 Nov 2026, Ilpo Järvinen wrote:
>> +	memcpy(nvsw_host_spc6_lc_4asic_regs_io_data, nvsw_host_spc6_lc_regs_io_data,
>> +	       sizeof(nvsw_host_spc6_lc_regs_io_data));
>> +	memcpy(&nvsw_host_spc6_lc_4asic_regs_io_data[ARRAY_SIZE(nvsw_host_spc6_lc_regs_io_data)],
>> +	       nvsw_host_spc6_lc_4asic_only_regs_io_data,
>> +	       sizeof(nvsw_host_spc6_lc_4asic_only_regs_io_data));
>
> I'm trying to understand why you need to make this copy? Can't the other
> case just use smaller .counter?
>
> You may have to use multi-line define(s) to get the array size of the
> first part without providing it as literal.

Thanks. v5 is ready but I haven't posted it yet, as I'd like to
explain one change first. The memcpy is gone in v5. I did try the
smaller .counter approach first, but in the end I'd like to keep two
separate static tables for the liquid cooled systems.

The shared variant put the 33 four ASIC only entries in a multi-line
macro at the end of the table, with their count taken from
ARRAY_SIZE() of a compound literal built from the same macro, and the
single ASIC description used the smaller counter. It worked, but
checkpatch reports the macro as an error ("Macros with complex values
should be enclosed in parentheses"), which a list of initializers
cannot satisfy.

More importantly, the tables no longer differ only by a tail. While
reworking v5 we aligned the ASIC attributes with the existing ABI:

- the single ASIC systems keep asic_reset and asic_health, the names
  mlx-platform and nvsw-sn2201 already use for the same bits, plus
  asic1_reset and asic1_health on the same bits;
- the four ASIC system has no asic_reset, since the same bit resets
  all four ASICs there. It has asic_reset_all instead, plus
  asic1_reset to asic4_reset and asic1_health to asic4_health.

So each system now has entries of its own at the start of the table
as well as at the end. A shared array would need system specific
entries at both ends, a pointer offset for one description and a
reduced counter for the other, on top of the macro. I had that
version working (with .data = table + 1) and found it much harder to
read than two plain tables.

With separate tables each one lists exactly what its system exposes,
both counts are a plain ARRAY_SIZE(), and there is no copy at init.
The cost is that the shared entries appear in both tables, which is
also what mlx-platform does with its per system tables. A comment on
each table asks to keep the shared entries in sync.

For what it's worth, even sharing the liquid cooled tables would not
remove most of the duplication. The single ASIC liquid cooled table
has 46 entries and the air cooled one added in patch 3 has 55, and 41
of them are identical between the two; 38 are identical across all
three tables. Avoiding that would mean moving the common block of all
three tables into a macro, which I think would make the driver harder
to follow, not easier.

Your const comment is addressed in the pending v5 as well: the mux
data and all the platform data structures are const, and nvsw-core
no longer writes into them. The mlxreg_core_data entry tables and the
mux channel table stay writable only because the mlxreg and mlxcpld
platform data structures point to them through non-const pointers.

If you still prefer the shared table, I'll switch back to it before
posting v5.

Thanks,
Felix
