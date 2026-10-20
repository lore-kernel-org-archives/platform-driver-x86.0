Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792517290;
	b=MzlA7SEavJlhML7YBnwP6z3ZJQH0m3ErVGzQab0RjO1DM0DuA+d/fZ4w1a0AfY9hojf3
	 qfsUVFEU2yOuTOJ+myWipVajfnrm+9+bW81+pWEB+yTzm9THWrNxD3ZnAflqpJaLmvIR/
	 Ki2piwSS5+zHkgTEsY5GyVFsyLnC54yIMirUoRYsjlT9ryWLl4YJHlbn0wgSn5ALfv4R7
	 ULdo4WAZhtXS186tYKBe+26jt/ogrj4TmJYMMtAN4W4vtWidbWRMlaVHlFE7en7XIesbx
	 nz7bWysvjPnpT4pf/DI/EOX//vccy+dSlnBNwlxAsIgi95XOBB8DZAHgA5TJZajpX/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517290;
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
	bh=uQMMKZDRFP/MAzWxy6EKktWyy+fBCKa/JQHOrdB8+UU=;
	b=I7rmyw+l+k57HB0Z6h7qdag03vojcdMV3i2wnl7/KYN5V2c5wbkIVZwGtVLQ5tnUtWfi
	 VPxdg0aos1VGGf9F65iaOby7DT2PTmRIrtgRdBWShlFk01eZnGDgdJIut+7pAn8MlhfV1
	 tNhQ4ACMC3NKpzB8nceJ//wn731UN+0dmskY62Eq6H44VaO5RrXi9+knXtCcuiciGP8z4
	 ImTEQ2EBRNchnlx3Ec343Or3fNmplXqmsa1t991/tJdG++Z29kffCwDq2frR1+mD5zN6I
	 OVIIWcdDY0D9a+q8SJIQSzqal7KeZTnT3GRTLm6mKVrHALRLwhlCbMrCXS6Tn1U77jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BSCaNQga;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.21
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C645E606A31F
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 17:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C645E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BSCaNQga
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLTRKn05Dc35pKKOTm4wHVqTUgD5hD/IRlcsgnWSIHU4e0KY9Smb11KVVNTAcY5FG2jQX2t9i1eAgU9B4Pdx1FWtsgQhi+SzzbJglvZCXAtc7kUn1APgsUca5Wh6RYMYV5Q8xlzgTgyZsF37B7tFfAGfM5m1nyF9n0F6b4qhw/JjcbiDSO9edKctdqrTC9S/Gs+811gUs8qEJPsFHEzzPGYXvUCQY24PNdktd19o3n3MjtF5fOLCSXVy+K+0bbwcuIWXk8fhKTS1lmLkYvTeQMkYU2F6/bsTvKgRrdKf/fgp7tTuCci0cg/Ezs/VX2sJdK0koF54FWaWruYJpXmIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQMMKZDRFP/MAzWxy6EKktWyy+fBCKa/JQHOrdB8+UU=;
 b=O72/Xyu15Io7H+6CQo9gE7HdMk1Lq1e920EiMhK43r/zdkRDXkSTBxRdnwsUau1RrE0ZJe1PBH/AC0nKbRpKO61G4A5Rc2B11nL+V0sBs0USA41owSYD8GkLp472EOZdmI08+3Vf3U8CfOI2iXLKnEfB+9ZU+IbHaxZRQaXyVb88HL/JNUA8MjiHUifw+0AZ2z0PHe0Z+4l0s55rm6uftF4jGLvMzAcozVVew27NHMbkl+smowVhBoviBaVq4hbzPv+vGneUjgCXIXZgykMAa2DGHunr9fXExvv6hj38JcnK+mqOnk1MmlrUhv63X9Kqsb7WuN9nF92mrZIIji9A8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQMMKZDRFP/MAzWxy6EKktWyy+fBCKa/JQHOrdB8+UU=;
 b=BSCaNQga7ApFeM/I1J+6n6WODkK+rV1+mqTXgMHaiZ7o0JD+viTTmseyNzRUUcg7Fw9sJU/053kGHhssx55pA4Y82IIFDE7SW090N91+MMtpXWL0yATngg5DYEaHjN0yjR4CUJjW5yviosLDNouXjliN/hUUP+DA8PKTK02TusbVXHbfW3dMUwZqpzoy57WqA9HczzV4+w2ibCSMyobrarmn934OqbY/xlqoDJni4W1JDoJ6zakorClxRf/yoBGMV/stlZbxAmJW2woO8eoNJ98n8LNk5npaid36EcJuDpPjNmYiZaXobCY1Qynkvf9akeCMJGYwho5AnbpnyN8XwA==
Received: from MN0PR05CA0016.namprd05.prod.outlook.com (2603:10b6:208:52c::15)
 by IA0PR12MB7555.namprd12.prod.outlook.com (2603:10b6:208:43d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 17:28:04 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::51) by MN0PR05CA0016.outlook.office365.com
 (2603:10b6:208:52c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Tue,
 20 Oct 2026 17:28:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 17:28:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 20 Oct
 2026 10:27:41 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 10:27:39 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>,
	Felix Radensky <fradensky@nvidia.com>, <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH platform-next v2 0/3] platform/mellanox: Add nvsw core and SPC6 host driver
Date: Tue, 20 Oct 2026 20:27:23 +0300
Message-ID: <20261020172723.4160326-1-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <274bb540-5f61-d343-173b-a2f46f7ea69a@linux.intel.com>
References: <20261018101156.699575-1-fradensky@nvidia.com> <274bb540-5f61-d343-173b-a2f46f7ea69a@linux.intel.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|IA0PR12MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 5956dcf1-57b5-4f17-0df4-08df2ecf7f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|56012099006|4143699003|11063799006|5023799004|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Mj3YgbORZ/k3llS38/yW/hnWzg5p0ng6Sx8zyQCDlAEXtrnwKpkTOw2+1Nvz4WAngp8ZYadllgB6pUoZnS24R1NnS3DVO7hp7sLpLLJpGYv7yEV8Xc9VZ9oMA/xao2zfAUMgTiQ3nK9zpnEwkPFCJWwmyIjQBXD5ilD5JXFqVEr8OtpDuH3s6WodfPB8OUijNy7RC083Tvp7Esq+NKlxrwI/IO6XhhcdMtSZZqYay34K9ssFjN1lcS1I9pMmjJKuSTuNoR+SMvfB8asX/tBdExeTnp53PYs8i0zsbri5da1l6MLhFA+FX7xmHauGVJ1roHmHnyddtfSkhVDAsHn77n3KkmQkybUvalpoL0ZQ0XhGkrtvo65Sp0NoqocC3KDAnNwbVA0kI+yX2eUhmmN30mPiMVKI3rkN0bD+pfcd9zolRkWK7Rae3F88heE8aSRcqj4StICXBYi4wPnwmaQpKCoF7beuwlKMErAVfP7oqLB08SLTJ+tLUr0KUFGAZhK8+XXDdKi+f5EqctTATWJSc4Du45NdSDUkxOmbbIqnRd9Wj7zvBj2/hdzmsNQJuZpFY2tbFyFN8ISSA6quis9S+tv4YNVfdULtldL6euZ+JguDA+jp6JF5tS+6NNRcaLcpPyd0Df/nm9e6YRIdcVyPtIwy4U2e2vm+PYG0FvxFDutDVyrUsjxIJ0dJyGLSJC17l/R3Jx4tjzTThDNul/7+VA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(4143699003)(11063799006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ceSa2L/n5ddk8F7KLZbE3E6rTvNXg/MXMdNIvzejAHyD02xjSBLBzf9UfoAI7rPQGGhboTLQ/+sRGJ5l4KSBA125OHbj59lD3ekK/TtxEeu3+HTf8zQDPJMrdsvfEkZVkuccGl5PnglNJqpEHV6A/7iS8t1q8P6oZOjSTb/VB+QLrNHYSiYrzqbPXW2bN9KFF0XTQt/JeWzJR0+kkZx5yqj9yS/CLp/QPmad9ww+WyufnaavVhFq/kBR+tZ8RUmgG5u3eFDtsBZaweEV5O50WcJyadd/5BXn7RnfTbEkvpzpwYRo3nbthAF50nRmn/2qkxhV8Nt7/3GVArs8fnLnXcD80nvJnASqqQUwnGLTT36ptQS8vxjifwVvUgqaK6FAHZOnct+TEcYmph0Qoe0H/r2VbONvvf6SG7eu9aK3HzxViqIdNE3GTnvwoCBR95Rp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 17:28:04.0631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5956dcf1-57b5-4f17-0df4-08df2ecf7f85
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7555

On Mon, 19 Oct 2026, Ilpo Järvinen wrote:

> Also please check what sashiko.dev has to say about these patches.
>
> Note that sashiko is an AI review tool so please apply healthy bit of
> critisism to any of its findings.

Done. The criticism turned out to be necessary, though not in the way
I expected: none of the seven findings was a false positive, but three
of them pointed at fixes that would have introduced bugs. I checked
each finding against the CPLD register map rather than against the
code alone, which is what caught those three.

Also, on your comment in patch 1: the label is gone and
nvsw_core_init() now returns directly when
nvsw_core_mux_topology_init() fails.

Three it got right, fixed as suggested
======================================

- pdb1_pwr_status..pdb4_pwr_status were exposed 0644 over
  NVSW_REG_PS_DC_OK_OFFSET, which is not listed in
  nvsw_writeable_reg(), so every write returned -EIO. They are 0444
  now and the ABI documentation says read only.

- The air cooled pwr_cycle had mode 0244 rather than 0200, denying
  read access to root while granting it to everyone else on a write
  only attribute. The liquid cooled table already had 0200.

- Patch 3's commit message claimed the air cooled systems expose power
  supply alarm indications, but no attribute is described over the
  alarm registers. I dropped the claim rather than adding attributes,
  as we have no plans to expose the alarm registers from this driver.

One where it correctly refused to guess
=======================================

It flagged NVSW_REG_FAN_OFFSET as being used with two contradictory
polarities: my ABI text says bit value 1 means the drawer is present,
while mlxreg_fan_read() treats a set bit as "FAN is not connected". It
presented both directions without picking one, which was right, since
nothing in the patch settles it. The CPLD map does: the bits are
FAN1_PRSNT_N..FAN5_PRSNT_N, "'0' - Present, '1' - Not Present". So
mlxreg-fan is correct and my ABI text was wrong, fixed in the
documentation with no code change. It also noted in passing that
psu_status might have the same problem "if active-low", and it does,
while psu_ac_status and psu_dc_status sharing that description block
are active high. The polarity is now stated per attribute.

Incidentally, mlxreg-fan.c has a comment claiming the presence bit is
one when the FAN is connected, which its own code contradicts five
lines later. That is probably where my wrong ABI text came from -
happy to send a trivial patch for it if you want.

Two where the problem is real but a proposed fix was not
========================================================

asic2_health..asic4_health were broken: the masks sit at bits [3:2],
[5:4] and [7:6] but all three carried .bit = 1, so ror32() shifted by
zero and they returned 0/8/12 and so on instead of the documented 0, 2
and 3. It offered two remedies - set .bit to 3, 5 and 7, or move .reg
to NVSW_REG_ASIC{2,3,4}_HEALTH_OFFSET - and the second would have been
worse than the bug, since all four health fields are packed into
0x2550 and 0x2553 is the ASIC thermal status register. v3 sets .bit to
3, 5 and 7.

The fan drawer LEDs are accurate against mainline: mlxreg_led_config()
gates on (regval & data->bit) and never looks at data->slot, so with
.bit = 0 all ten are skipped. But giving them a .bit would be wrong,
because the capability register holds the number of fan drawers rather
than a bitmask, so masking a count of 5 would register drawers 1 and 3
and skip the rest. mlxreg-fan already handles both conventions; only
leds-mlxreg does not, so the fix belongs there and we will submit it
separately. The LED table is unchanged in v3.

The one where the fix was to delete the code
============================================

It reported that nvsw_core_reg_def was unsorted, so regcache_init()
logged "Driver needs fixing: Unsorted reg_defaults", and that its
entries never reach the hardware anyway. Both are true:
nvsw_volatile_reg() covers every register the driver declares, so
regcache_default_sync() skips all of them.

The obvious fix is the one mlx-platform, nvsw-sn2201 and mlxreg-lc all
use, looping over reg_defaults with regmap_write(). Checking the two
registers first showed that would have been a mistake. Neither is
relevant on SPC6: 0x2537 is not a PWM control register on this
hardware, the name being inherited from mlx-platform, and writing the
0x00 default would assert two active low signals that reset
de-asserted; 0x2543 is the low aggregate interrupt mask, which
mlxreg-hotplug programs from its own .mask_low when a board describes
a hotplug device, and no SPC6 system does.

So v3 deletes the array rather than sorting it, along with the cache
configuration that then has nothing left to hold. One side effect
worth flagging, since it undoes part of what you asked for in v1:
linux/bits.h is no longer included in nvsw-core.c, as the GENMASK in
that array was its only user there.

SPC6 does need one register default, but neither of those two: the
CPLD can override the fan PWM and drive the fans at full speed on a
fan fault, and mlx-platform clears the enable bit for that override on
every system it supports. On SPC6 the bit has moved to a different
register, so the write is done from the board driver in patch 3,
through the set_reg_default callback the core already provides.

The finding was real, both halves of it. But the fix it implied would
have turned dead code into a bug.

What the tool was worth
=======================

One finding it did not make, which it led me to: following the same
reasoning as the pdb*_pwr_status finding, I checked all 85 registers
in nvsw_writeable_reg() against the register map and found one more
mismatch, NVSW_REG_FU_CAP_OFFSET. Dropped in v3.

So: every finding described something real, which is better than I
expected, but three pointed at remedies that would have been wrong,
and each of those would have looked plausible in review. Worth
running, but not worth applying without checking what the registers
actually are.

Thanks for the pointer, and for the review.

-- 
Felix
