Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795632470;
	b=0e9jr+tXuvzzfVjQkG4tb4qGMTfCk+lWrWBVX+WJc7pxgKAC7Hf4aXwMer5lyznw+DCt
	 +a2QYJw5wuKRu/9NjmI6BSYgSj/uvah87apgix3L9n2by8bl5wylqwhwCvmcbCmo8j8Cl
	 Iz8TVqkHmL3sFDTO37Eaqd/ph/NT1xr4t/u/t5ykD1ftgBkp8OJ/eaqiNsQTaG1QLndfA
	 tzf79n4W0MkgRzYyi30n7h5JMnjJ7M9laWuIezDU/CEfIOaUJIUVXfi+gm4+LQBg/aZF7
	 jFqaTnt250vYPn8pSDDkByE9En0AKudjOQDB4S1M7cK3ssj9OPxFvKE/qfSyV24B47Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632470;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=b99/l8J3PUdEy5wHhtCxcjMlbMq5DiGThQiSTss5VrQ=;
	b=AMuHhx0L/Rr9VmxEZWwBvic1uUeIpIStiNURey1C+fZlcY7RYz6gQzNarLQFU1vs9Zxh
	 +9uAsopa58AIPIc4Km8XGFKQ/Mjb8zeMN0BBAFPZBumqt1tjJfWgZDpE526vsYOABxoj/
	 h18cnaw5+daxkj2y+F5h3kuKxVe4eT/D+weg8TPGEE7YkbMVL7abjRaRO+CBMEjFaCV/3
	 unKEFJKlIt9oN9Zo/NeIl+BUaelKOpItb8C1dN0Bgx2tARvFIZFpahKcqBDkhDY0q0P7N
	 /TGtJIH4fj6CePIztA64xykXn56sW5xFflZCdSIeWEQlFKIJ5rdUzP6CMZOGKjOgsKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TS3gbh60;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBE9606A323
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 18:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBE9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TS3gbh60
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLN2eORbg8OpUB4exzlZzu1yIkVYoxwllAUa2oE5eNKzXntgjWyuFRVC2KFcPtejX7bGllTxInJeJQ9Gf6WDDjeWOHEXNhxURL+6ZmAR4RCJernk4I9Fw2ss0ad4/MNuRjSyomDwIJVjHIzZR3UW/YA+XdFKSrEjHr15rXEyod89CxE8WsN/gqXComOAgBpSOOUzWBYtJumFW3KkOHQJ2+QOTadngCvQYw1nZ+4AHxvU4yK9413K5iH37WI3wShAOC+imt60zi+FKn3O83y/SxdXDPMgNlZDjGIm+UzGXGoV5Feb03VOVvBkv1CRPNTQ9si7fvIl24eFbsnuvD5NOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b99/l8J3PUdEy5wHhtCxcjMlbMq5DiGThQiSTss5VrQ=;
 b=ws0oTzDl11iLA5JJlHdfUJOsDjdEfyyVetN9wq/dDiop0mPAdcZcTPtS0ocd5aNosVK3xeiMtg4qmTFUkPbVvjuYfmEyjY9jvT01vHlJPslQsXiJ8ZZbDlxq5+XVhk/Tg/M2hVliumS3+vSTZu/xjRqS9e84ItHHYMYPZlD8wN9TXLR3EtsdmwlWsBDbSq0BDVoWe6/vtNdCigfDmIk/xrvNiz/Mz//6pSm/9Yp97RazTJCLONcYvXoIswVyEw9idk0Mbc6M3nPZ2yPAPD0rQSczW51txCItMBLNFptTDf9BfD5+1iWFeP/leigk3IJ1Rmzr79WQ6KmTQbOJBUhdDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b99/l8J3PUdEy5wHhtCxcjMlbMq5DiGThQiSTss5VrQ=;
 b=TS3gbh603cGtLQot/8xLxYz0XBLhfmRbncdC0QUT6tD26MQav8bUpLJMXBhLY/17CuwiPOUrILLZVSD8BQ1gd0hcNlG9eCb92KTR9bj6YI8SWJI/v3ahtIDT8APKvTkUfo98Xv00EMc1SPObdhPZjwUAhupll0qlwco1W0iR3byfgelCJbHW3u99d9l6JNVGHXAAuEnFAphtUEmUt6PtiExPzp96eAAGYU35F9UUB8VeJsTH11DBZNIOlWTHYKTDN5r/FZJy9GER9HG/12f+u5sWgjFv+kGLy00koiiyiCiu9p/KC0w/xtPfKQVdnSsSc2X3pd5MDLkzJICLxBD7vA==
Received: from SJ0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:a03:33a::30)
 by MW4PR12MB7357.namprd12.prod.outlook.com (2603:10b6:303:219::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 18:47:30 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::4b) by SJ0PR03CA0025.outlook.office365.com
 (2603:10b6:a03:33a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Wed,
 25 Nov 2026 18:47:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 18:47:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:46:58 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:46:55 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
CC: Felix Radensky <fradensky@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH v4 1/3] platform/mellanox: nvsw-core: Add core driver for Nvidia switches
Date: Wed, 25 Nov 2026 20:46:31 +0200
Message-ID: <20261125184633.2825486-2-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125184633.2825486-1-fradensky@nvidia.com>
References: <20261125184633.2825486-1-fradensky@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|MW4PR12MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 515f47b1-1686-4090-121f-08df4b248ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|6133799003|261009223027099003|22082099003|18002099003|5023799004|56012099006|11063799006|10067099003|261102124527099003|261102130727099003|261022075727099003|261102123227099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	jY+wZ7seHgcuVvZ6zoe6jfTaP7A5gD4avpx7gFLjWnmA2Bl1qRZtpbmx7tFtC8jKmBy8A593kgUBGGznsEHx1T1UjAUmyFVl8C3Hc3J4MBs8UaSkeWm6aJrz2BLAjCxlYyKExAV0MISV4Dn7kNcpl5C2vBIxCpG1ICDDZM67YHcBaGC5DF+i9cGrXyug9Ot5bIqNPsT8BaxJjvBsfsPNyjlPBojY8g+DPZN4+HC/ubz2G177Pp1c8zO7oGPRTLV2cJroV08AfvKslCvrM6YCGSHcUlRa24C8uXfFRac9CyULVedyPy/S1oWMNG6aIjBUZRg6dI5u2iPbDmvJRvDcxZNkzQZhAn2Tpw49ktujPI6D3nO2aGGUycR2eouzurpzsMT6IwZ3wqsYcNkm9fHf8lwa/OGsIwm02bohexGdYnibZZVsp9UEq4xJEhcTothzHZ9qkRCWqDrTvVq0fJS+wichMsDjr1uBdGGJ71tbFzBUf6wlZNCnEQNqOT4hTQiaTcNH5imd9RSV8EPUaARpl7eyzs/iZ9ub10J4Oo0hYucOKScbd59kFreKR8wX7lU8a//DFcxj/HHHwpZw1n+vYI7nwks84ReQPZZm965ezMuRoz254uBueQ9YTMPHaatdsjdAtPVGobEI+hSaJXdmZigg+HxEaDt9sFHhu7SvPIEmaC/Q0Q+hzCAsKnNMo1GrFBQoYjZtFurj2foQMwsPVQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(6133799003)(261009223027099003)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(10067099003)(261102124527099003)(261102130727099003)(261022075727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sXDES0Z4PYs+9x6lkPkLBQiV6Nu1bwRKxIpU4t1xqGCwapblpdWt5uuH0FPruBBlaPpahNl68Mc4Um9vwAyYI740JhgApJ8gAX07RivBgLMXxyE86gQDcaAuksB1EfMpjPdeJkWrv9zflaROp21MqHcMj2SaXU+D0nTm8bjKyiO3ZCRC3jZWa+Yv61Gpj6fxfeesaWWwKgABY/CEWyHMA/jGpHh99D8XiN7qQC8Qbbf/jQHlCJqXRlzAISM3HTWbd8AlHvmbCIcsgFG+OpZ8zsqeMMJ+36Ez8UWU5XNJ9+GaH3jKk0hj7ki3cb/mHl76dP+wqs30CI3MULfZPnSNFJIbA0uygSzq4tqoXwU+ysN6wZjdLcVYegY4roEdmHpYRHaeUAW44+K1R7+dwZOhaYvTD8wzbh/SH+3g45YQ6YCPPz4wyeL084KB+TTJ42yZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:47:29.6950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 515f47b1-1686-4090-121f-08df4b248ee1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7357

The Nvidia switch systems expose system control and monitoring through
CPLD/FPGA devices. The register layout and the set of mlxreg-* devices
built on top of it are common across switch generations, while the
description of which devices exist on a given board is not.

Add nvsw-core, which implements the shared part: creation of the
register map for the I2C attached CPLD/FPGA, and the registration of
the mlxreg-io, mlxreg-hotplug, mlxreg-fan, leds-mlxreg and mlx-wdt
platform devices from a board supplied description.

The register map gives access to the registers the board drivers
describe. For the status registers that can carry hotplug items, it
also covers their event and mask registers, along with the top and low
aggregation registers and their masks, since mlxreg-hotplug programs
all of them when it probes.

What remains board specific is supplied through optional callbacks,
which the core runs at fixed points. set_reg_default writes register
defaults once, right after the register map is created and before any
device is registered, and restore_reg_default undoes them once the
devices are removed, or when initialisation fails after the defaults
were written. mux_init and mux_exit create and remove the I2C
mux topology, before the mlxreg-* devices are registered and after
they are removed, since the mux layout differs between boards.

Board drivers provide a struct nvsw_core describing their hardware and
call nvsw_core_init() and nvsw_core_exit(). Both symbols are exported
in the NVSW namespace, so consumers must import the NVSW namespace
explicitly with MODULE_IMPORT_NS(), which modpost and the module loader
enforce.

The core is selected by the board drivers rather than being directly
selectable, since it is not useful on its own.

Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---

Notes:
    v3->v4
    Issues reported by a local sashiko review:
    - Correct the commit message, which said the core implements the I2C
      mux topology. It only runs the board's mux_init and mux_exit
      callbacks; the topology itself is created by the board driver. The
      message now describes the callbacks and when each one runs, and the
      struct nvsw_core kernel-doc says the same.
    - Stop calling set_reg_default from nvsw_core_exit(). Running it at
      teardown wrote the probe-time defaults again rather than restoring
      anything, and mlx-platform applies its defaults only at probe. The
      callback now runs once, from nvsw_core_init(), so board callbacks
      need not be safe to run twice.
    - Add a restore_reg_default callback, paired with set_reg_default the
      way mux_exit is paired with mux_init. The core runs it from
      nvsw_core_exit() after the devices and the mux topology are gone,
      and from the nvsw_core_init() error paths once set_reg_default has
      succeeded, so a board can undo a default that is only safe while
      its devices are bound. Patch 3 is its first user.
    - Drop nvsw_volatile_reg(). The register map has had no cache since
      v3, so regmap treats every register as volatile and the table was
      never consulted. It also listed exactly the registers of
      nvsw_readable_reg(), so adding a cache back would not have kept a
      single register in it. With no cache regmap reads every register
      from the hardware either way, so behaviour is unchanged.
    - Drop the definitions in nvsw.h that no driver in the series uses.
      CURRENT_TEMP_RO and SWITCH_IC_QTY were defined but missing from
      nvsw_readable_reg(), so an attribute over either would have failed
      to read. Patch 3 no longer makes them accessible, so the defines go
      rather than the register map growing. NVSW_REG_MIN, NVSW_NR_NONE and
      37 bit masks, mostly interrupt and aggregation masks, are dropped
      along with them, so the header holds only what nvsw-core and
      nvsw-host-spc6 use.
    - Drop the ASIC2, ASIC3 and ASIC4 health, event and mask register
      definitions, and their entries in nvsw_readable_reg() and
      nvsw_writeable_reg(). Nothing used them, and on SPC6 they are not
      what their names say: 0x2553 to 0x2555 hold the ASIC thermal warning
      and shutdown signals, and 0x2582 and 0x2585 are combined ASIC3 and
      ASIC4 status registers on the four ASIC systems and VR alert
      registers on the air cooled ones. The health fields of all four
      ASICs are packed, two bits each, into NVSW_REG_ASIC1_HEALTH_OFFSET,
      which a comment above the ASIC health masks now says.
    - Correct the commit message, which said that exporting
      nvsw_core_init() and nvsw_core_exit() in the NVSW namespace keeps
      them out of the global symbol table. They are still global exported
      symbols; the namespace only makes modpost and the module loader
      require MODULE_IMPORT_NS("NVSW") in each module that uses them,
      which is what the message now says.
    - Make NVSW_CORE depend on I2C. It selects REGMAP_I2C, which depends
      on I2C, and the core calls devm_regmap_init_i2c() and uses struct
      i2c_client itself. It was only safe because the one driver
      selecting it, nvsw-host-spc6, already depends on I2C.
    Additional fixes added by Felix:
    - Drop the 69 register definitions that no driver in the series
      uses, and their 110 entries in nvsw_readable_reg() and
      nvsw_writeable_reg(). They cover the power good, board, health, VR
      alert, EROT, power button and FRU interrupt groups, the CPLD debug
      LEDs, UART baud, safe BIOS, PWM control, configuration and
      capability registers, the comex aggregation registers, MUX0 and
      MUX2, TACHO11 and TACHO12, and GP4_RO. The register map now holds
      only what the SPC6 driver accesses, and what mlxreg-hotplug needs
      for its status registers. The CPLD part number high bytes and the
      watchdog TLEFT registers stay although no table names them, as
      mlxreg-io reads them as the second byte of the part number
      attributes and mlx-wdt accesses them as the high byte of the type 3
      timeout and time left.
    Issues reported by a local sashiko review, against the above:
    - Keep the registers mlxreg-hotplug programs at probe. The first
      version of the cleanup dropped them too, so mlxreg-hotplug would
      have failed its first write, to the aggregation mask, on any board
      setting hotplug_data. The top and low aggregation registers and
      their masks (0x253a, 0x253b, 0x2540, 0x2541) stay, together with
      the event and mask registers of the status registers in the map:
      ASIC1 health (0x2551, 0x2552), PS_DC_OK (0x2569), fan (0x258a) and
      leakage (0x25b0, 0x25b1). The commit message says what the map
      covers.
    Other:
    - Rebase onto the current platform-drivers-x86 for-next.
    
    v2->v3
    Comments pointed out by Ilpo:
    - Return directly from nvsw_core_init() when
      nvsw_core_mux_topology_init() fails, instead of jumping to a label
      that only does a return.
    Issues reported by the sashiko.dev review:
    - Drop nvsw_core_reg_def. The review pointed out that it was unsorted
      and that its entries never reached the hardware. Neither register
      is relevant on SPC6, so the array is removed rather than fixed,
      which leaves .cache_type, .reg_defaults, .num_reg_defaults and the
      regcache_mark_dirty()/regcache_sync() pair with nothing to do.
    - As a consequence linux/bits.h is no longer included here. The
      GENMASK in the dropped array was its only user in this file.
    Additional fixes added by Felix:
    - Drop NVSW_REG_FU_CAP_OFFSET from nvsw_writeable_reg(). The register
      is read only in hardware, and the only attribute described over it,
      jtag_cap, is 0444, so nothing could reach the write path. Found by
      checking every register in nvsw_writeable_reg() against the CPLD
      register map; it is the only mismatch.
    - Rename the remaining nvsw_core_platform_init_fail label to
      err_mux_topology_exit, matching the err_* labels used elsewhere in
      the file.
    
    v1->v2
    Comments pointed out by Ilpo:
    - Add the direct includes for the macros this file uses instead of
      relying on them arriving transitively: linux/array_size.h,
      linux/bits.h, linux/dev_printk.h, linux/err.h, linux/export.h and
      linux/types.h.
    - Return platform_device_register_resndata() and
      devm_regmap_init_i2c() into a local, so a struct nvsw_core field is
      only ever assigned a valid pointer and never an ERR_PTR.
    - Drop the NULL assignments from the error paths and from
      nvsw_core_platform_exit(), and make the rollback in
      nvsw_core_platform_init() positional.
    Additional fixes added by Felix:
    - Sort the include block.

 drivers/platform/mellanox/Kconfig     |  10 +
 drivers/platform/mellanox/Makefile    |   1 +
 drivers/platform/mellanox/nvsw-core.c | 375 ++++++++++++++++++++++++++
 drivers/platform/mellanox/nvsw.h      | 187 +++++++++++++
 4 files changed, 573 insertions(+)
 create mode 100644 drivers/platform/mellanox/nvsw-core.c
 create mode 100644 drivers/platform/mellanox/nvsw.h

diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index e3afbe62c7f6..34deba4670c2 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -105,6 +105,16 @@ config MLXBF_PMC
 	  to performance monitoring counters within various blocks in the
 	  Mellanox BlueField SoC via a sysfs interface.
 
+config NVSW_CORE
+	tristate
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Shared register map setup and platform device creation for the Nvidia
+	  switch CPLD/FPGA drivers. This symbol has no prompt of its own and is
+	  selected by the drivers that need it, which are built as separate
+	  modules against it.
+
 config NVSW_SN2201
 	tristate "Nvidia SN2201 platform driver support"
 	depends on HWMON && I2C
diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
index e86723b44c2e..22e40759dd49 100644
--- a/drivers/platform/mellanox/Makefile
+++ b/drivers/platform/mellanox/Makefile
@@ -11,4 +11,5 @@ obj-$(CONFIG_MLXREG_DPU)	+= mlxreg-dpu.o
 obj-$(CONFIG_MLXREG_HOTPLUG)	+= mlxreg-hotplug.o
 obj-$(CONFIG_MLXREG_IO) += mlxreg-io.o
 obj-$(CONFIG_MLXREG_LC) += mlxreg-lc.o
+obj-$(CONFIG_NVSW_CORE) += nvsw-core.o
 obj-$(CONFIG_NVSW_SN2201) += nvsw-sn2201.o
diff --git a/drivers/platform/mellanox/nvsw-core.c b/drivers/platform/mellanox/nvsw-core.c
new file mode 100644
index 000000000000..82b2d856292b
--- /dev/null
+++ b/drivers/platform/mellanox/nvsw-core.c
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Nvidia switch platform driver
+ *
+ * Copyright (C) 2025-2026 Nvidia Technologies Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_data/mlxreg.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include "nvsw.h"
+
+static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case NVSW_REG_FIELD_UPGRADE:
+	case NVSW_REG_GP0_OFFSET:
+	case NVSW_REG_GP1_OFFSET:
+	case NVSW_REG_GP7_OFFSET:
+	case NVSW_REG_RESET_GP2_OFFSET:
+	case NVSW_REG_GP4_OFFSET:
+	case NVSW_REG_AGGR_MASK_OFFSET:
+	case NVSW_REG_AGGRLO_MASK_OFFSET:
+	case NVSW_REG_ASIC1_EVENT_OFFSET:
+	case NVSW_REG_ASIC1_MASK_OFFSET:
+	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED5_OFFSET:
+	case NVSW_REG_LED6_OFFSET:
+	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
+	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
+	case NVSW_REG_FAN_EVENT_OFFSET:
+	case NVSW_REG_FAN_MASK_OFFSET:
+	case NVSW_REG_LEAK_EVENT_OFFSET:
+	case NVSW_REG_LEAK_MASK_OFFSET:
+	case NVSW_REG_SPI_CHNL_SELECT:
+	case NVSW_REG_WD2_TMR_OFFSET:
+	case NVSW_REG_WD2_TLEFT_OFFSET:
+	case NVSW_REG_WD2_ACT_OFFSET:
+	case NVSW_REG_WD3_TMR_OFFSET:
+	case NVSW_REG_WD3_TLEFT_OFFSET:
+	case NVSW_REG_WD3_ACT_OFFSET:
+	case NVSW_REG_PWM1_OFFSET:
+	case NVSW_REG_MUX1_OFFSET:
+		return true;
+	}
+	return false;
+}
+
+static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case NVSW_REG_CPLD1_VER_OFFSET:
+	case NVSW_REG_CPLD1_PN_OFFSET:
+	case NVSW_REG_CPLD1_PN1_OFFSET:
+	case NVSW_REG_CPLD2_VER_OFFSET:
+	case NVSW_REG_CPLD2_PN_OFFSET:
+	case NVSW_REG_CPLD2_PN1_OFFSET:
+	case NVSW_REG_CPLD3_VER_OFFSET:
+	case NVSW_REG_CPLD3_PN_OFFSET:
+	case NVSW_REG_CPLD3_PN1_OFFSET:
+	case NVSW_REG_CPLD4_VER_OFFSET:
+	case NVSW_REG_CPLD4_PN_OFFSET:
+	case NVSW_REG_CPLD4_PN1_OFFSET:
+	case NVSW_REG_CPLD7_VER_OFFSET:
+	case NVSW_REG_CPLD6_VER_OFFSET:
+	case NVSW_REG_CPLD6_PN_OFFSET:
+	case NVSW_REG_CPLD6_PN1_OFFSET:
+	case NVSW_REG_CPLD9_VER_OFFSET:
+	case NVSW_REG_CPLD10_PN_OFFSET:
+	case NVSW_REG_CPLD10_PN1_OFFSET:
+	case NVSW_REG_FIELD_UPGRADE:
+	case NVSW_REG_RESET_CAUSE_OFFSET:
+	case NVSW_REG_RESET_CAUSE1_OFFSET:
+	case NVSW_REG_RESET_CAUSE2_OFFSET:
+	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED5_OFFSET:
+	case NVSW_REG_LED6_OFFSET:
+	case NVSW_REG_CPLD7_PN_OFFSET:
+	case NVSW_REG_CPLD7_PN1_OFFSET:
+	case NVSW_REG_RESET_GP2_OFFSET:
+	case NVSW_REG_GP0_RO_OFFSET:
+	case NVSW_REG_GP0_OFFSET:
+	case NVSW_REG_GP1_OFFSET:
+	case NVSW_REG_GP7_OFFSET:
+	case NVSW_REG_GP4_OFFSET:
+	case NVSW_REG_AGGR_OFFSET:
+	case NVSW_REG_AGGR_MASK_OFFSET:
+	case NVSW_REG_FU_CAP_OFFSET:
+	case NVSW_REG_AGGRLO_OFFSET:
+	case NVSW_REG_AGGRLO_MASK_OFFSET:
+	case NVSW_REG_ASIC1_HEALTH_OFFSET:
+	case NVSW_REG_ASIC1_EVENT_OFFSET:
+	case NVSW_REG_ASIC1_MASK_OFFSET:
+	case NVSW_REG_PS_DC_OK_OFFSET:
+	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
+	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
+	case NVSW_REG_CPLD8_PN_OFFSET:
+	case NVSW_REG_CPLD8_PN1_OFFSET:
+	case NVSW_REG_CPLD8_VER_OFFSET:
+	case NVSW_REG_FAN_OFFSET:
+	case NVSW_REG_FAN_EVENT_OFFSET:
+	case NVSW_REG_FAN_MASK_OFFSET:
+	case NVSW_REG_CPLD5_VER_OFFSET:
+	case NVSW_REG_CPLD5_PN_OFFSET:
+	case NVSW_REG_CPLD5_PN1_OFFSET:
+	case NVSW_REG_LEAK_OFFSET:
+	case NVSW_REG_LEAK_EVENT_OFFSET:
+	case NVSW_REG_LEAK_MASK_OFFSET:
+	case NVSW_REG_CPLD1_MVER_OFFSET:
+	case NVSW_REG_CPLD2_MVER_OFFSET:
+	case NVSW_REG_CPLD3_MVER_OFFSET:
+	case NVSW_REG_CPLD4_MVER_OFFSET:
+	case NVSW_REG_PWM1_OFFSET:
+	case NVSW_REG_TACHO1_OFFSET:
+	case NVSW_REG_TACHO2_OFFSET:
+	case NVSW_REG_TACHO3_OFFSET:
+	case NVSW_REG_TACHO4_OFFSET:
+	case NVSW_REG_TACHO5_OFFSET:
+	case NVSW_REG_TACHO6_OFFSET:
+	case NVSW_REG_TACHO7_OFFSET:
+	case NVSW_REG_TACHO8_OFFSET:
+	case NVSW_REG_TACHO9_OFFSET:
+	case NVSW_REG_TACHO10_OFFSET:
+	case NVSW_REG_FAN_CAP1_OFFSET:
+	case NVSW_REG_FAN_DRW_CAP_OFFSET:
+	case NVSW_REG_TACHO_SPEED_OFFSET:
+	case NVSW_REG_SPI_CHNL_SELECT:
+	case NVSW_REG_CPLD5_MVER_OFFSET:
+	case NVSW_REG_CPLD9_PN_OFFSET:
+	case NVSW_REG_CPLD9_PN1_OFFSET:
+	case NVSW_REG_CPLD10_VER_OFFSET:
+	case NVSW_REG_WD2_TMR_OFFSET:
+	case NVSW_REG_WD2_TLEFT_OFFSET:
+	case NVSW_REG_WD2_ACT_OFFSET:
+	case NVSW_REG_WD3_TMR_OFFSET:
+	case NVSW_REG_WD3_TLEFT_OFFSET:
+	case NVSW_REG_WD3_ACT_OFFSET:
+	case NVSW_REG_CPLD7_MVER_OFFSET:
+	case NVSW_REG_CPLD8_MVER_OFFSET:
+	case NVSW_REG_CPLD9_MVER_OFFSET:
+	case NVSW_REG_CPLD10_MVER_OFFSET:
+	case NVSW_REG_CPLD6_MVER_OFFSET:
+	case NVSW_REG_MUX1_OFFSET:
+		return true;
+	}
+	return false;
+}
+
+/* Configuration for the register map of a device with 2 bytes address space. */
+static const struct regmap_config nvsw_regmap_i2c_conf = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = NVSW_REG_MAX,
+	.writeable_reg = nvsw_writeable_reg,
+	.readable_reg = nvsw_readable_reg,
+};
+
+static int nvsw_core_platform_init(struct nvsw_core *nvsw_core)
+{
+	struct platform_device *pdev;
+	int i, err;
+
+	/* Add registers io access driver. */
+	if (nvsw_core->regio_data) {
+		nvsw_core->regio_data->regmap = nvsw_core->regmap;
+		pdev = platform_device_register_resndata(nvsw_core->dev, "mlxreg-io",
+							 PLATFORM_DEVID_NONE, NULL, 0,
+							 nvsw_core->regio_data,
+							 sizeof(*nvsw_core->regio_data));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to register mlxreg-io driver\n");
+			return PTR_ERR(pdev);
+		}
+		nvsw_core->regio = pdev;
+	}
+
+	/* Add FAN driver. */
+	if (nvsw_core->fan_data) {
+		nvsw_core->fan_data->regmap = nvsw_core->regmap;
+		pdev = platform_device_register_resndata(nvsw_core->dev, "mlxreg-fan",
+							 PLATFORM_DEVID_NONE, NULL, 0,
+							 nvsw_core->fan_data,
+							 sizeof(*nvsw_core->fan_data));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to register mlxreg-fan driver\n");
+			err = PTR_ERR(pdev);
+			goto err_unregister_regio;
+		}
+		nvsw_core->fan = pdev;
+	}
+
+	/* Add LED driver. */
+	if (nvsw_core->led_data) {
+		nvsw_core->led_data->regmap = nvsw_core->regmap;
+		pdev = platform_device_register_resndata(nvsw_core->dev, "leds-mlxreg",
+							 PLATFORM_DEVID_NONE, NULL, 0,
+							 nvsw_core->led_data,
+							 sizeof(*nvsw_core->led_data));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to register leds-mlxreg driver\n");
+			err = PTR_ERR(pdev);
+			goto err_unregister_fan;
+		}
+		nvsw_core->led = pdev;
+	}
+
+	/* Add hotplug driver. Hotplug events are reported through the interrupt
+	 * of the I2C device the register map is attached to.
+	 */
+	if (nvsw_core->hotplug_data) {
+		if (!nvsw_core->client || !nvsw_core->client->irq) {
+			dev_err(nvsw_core->dev,
+				"Hotplug requires an I2C device with an interrupt\n");
+			err = -EINVAL;
+			goto err_unregister_led;
+		}
+		nvsw_core->hotplug_data->irq = nvsw_core->client->irq;
+		nvsw_core->hotplug_data->regmap = nvsw_core->regmap;
+		pdev = platform_device_register_resndata(nvsw_core->dev, "mlxreg-hotplug",
+							 PLATFORM_DEVID_NONE, NULL, 0,
+							 nvsw_core->hotplug_data,
+							 sizeof(*nvsw_core->hotplug_data));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to register mlxreg-hotplug driver\n");
+			err = PTR_ERR(pdev);
+			goto err_unregister_led;
+		}
+		nvsw_core->hotplug = pdev;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(nvsw_core->wd_data); i++) {
+		if (!nvsw_core->wd_data[i])
+			continue;
+
+		nvsw_core->wd_data[i]->regmap = nvsw_core->regmap;
+		pdev = platform_device_register_resndata(nvsw_core->dev, "mlx-wdt", i,
+							 NULL, 0, nvsw_core->wd_data[i],
+							 sizeof(*nvsw_core->wd_data[i]));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to register mlx-wdt driver\n");
+			err = PTR_ERR(pdev);
+			goto err_unregister_wd;
+		}
+		nvsw_core->wd[i] = pdev;
+	}
+
+	return 0;
+
+	/* The devices below are optional, so the pointers of those a board
+	 * does not describe stay NULL, which platform_device_unregister()
+	 * accepts.
+	 */
+err_unregister_wd:
+	while (i--)
+		platform_device_unregister(nvsw_core->wd[i]);
+	platform_device_unregister(nvsw_core->hotplug);
+err_unregister_led:
+	platform_device_unregister(nvsw_core->led);
+err_unregister_fan:
+	platform_device_unregister(nvsw_core->fan);
+err_unregister_regio:
+	platform_device_unregister(nvsw_core->regio);
+
+	return err;
+}
+
+static void nvsw_core_platform_exit(struct nvsw_core *nvsw_core)
+{
+	int i;
+
+	for (i = ARRAY_SIZE(nvsw_core->wd) - 1; i >= 0; i--)
+		platform_device_unregister(nvsw_core->wd[i]);
+	platform_device_unregister(nvsw_core->hotplug);
+	platform_device_unregister(nvsw_core->led);
+	platform_device_unregister(nvsw_core->fan);
+	platform_device_unregister(nvsw_core->regio);
+}
+
+static int nvsw_core_mux_topology_init(struct nvsw_core *nvsw_core)
+{
+	if (!nvsw_core->mux_init)
+		return 0;
+
+	return nvsw_core->mux_init(nvsw_core);
+}
+
+static void nvsw_core_mux_topology_exit(struct nvsw_core *nvsw_core)
+{
+	if (nvsw_core->mux_exit)
+		nvsw_core->mux_exit(nvsw_core);
+}
+
+static int nvsw_core_regmap_init(struct nvsw_core *nvsw_core)
+{
+	struct regmap *regmap;
+	int err;
+
+	if (!nvsw_core->client)
+		return -EINVAL;
+
+	regmap = devm_regmap_init_i2c(nvsw_core->client, &nvsw_regmap_i2c_conf);
+	if (IS_ERR(regmap)) {
+		dev_err(nvsw_core->dev, "Failed to create regmap\n");
+		return PTR_ERR(regmap);
+	}
+	nvsw_core->regmap = regmap;
+
+	/* Set registers default values. */
+	if (nvsw_core->set_reg_default) {
+		err = nvsw_core->set_reg_default(nvsw_core->regmap);
+		if (err) {
+			dev_err(nvsw_core->dev, "Failed to set default regmap\n");
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static void nvsw_core_restore_reg_default(struct nvsw_core *nvsw_core)
+{
+	if (!nvsw_core->restore_reg_default)
+		return;
+
+	if (nvsw_core->restore_reg_default(nvsw_core->regmap))
+		dev_warn(nvsw_core->dev, "Failed to restore default regmap\n");
+}
+
+int nvsw_core_init(struct nvsw_core *nvsw_core)
+{
+	int err;
+
+	err = nvsw_core_regmap_init(nvsw_core);
+	if (err)
+		return err;
+
+	err = nvsw_core_mux_topology_init(nvsw_core);
+	if (err)
+		goto err_restore_reg_default;
+
+	err = nvsw_core_platform_init(nvsw_core);
+	if (err)
+		goto err_mux_topology_exit;
+
+	return 0;
+
+err_mux_topology_exit:
+	nvsw_core_mux_topology_exit(nvsw_core);
+err_restore_reg_default:
+	nvsw_core_restore_reg_default(nvsw_core);
+
+	return err;
+}
+EXPORT_SYMBOL_NS_GPL(nvsw_core_init, "NVSW");
+
+void nvsw_core_exit(struct nvsw_core *nvsw_core)
+{
+	nvsw_core_platform_exit(nvsw_core);
+	nvsw_core_mux_topology_exit(nvsw_core);
+	nvsw_core_restore_reg_default(nvsw_core);
+}
+EXPORT_SYMBOL_NS_GPL(nvsw_core_exit, "NVSW");
+
+MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
+MODULE_DESCRIPTION("Nvidia platform core driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/platform/mellanox/nvsw.h b/drivers/platform/mellanox/nvsw.h
new file mode 100644
index 000000000000..65746e4b539b
--- /dev/null
+++ b/drivers/platform/mellanox/nvsw.h
@@ -0,0 +1,187 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+ *
+ * Nvidia switch platform driver
+ *
+ * Copyright (C) 2025-2026 Nvidia Technologies Ltd.
+ */
+
+#ifndef __NVSW_H__
+#define __NVSW_H__
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+struct device;
+struct i2c_client;
+struct mlxreg_core_hotplug_platform_data;
+struct mlxreg_core_platform_data;
+struct platform_device;
+struct regmap;
+
+/* I2C bus IO offsets */
+#define NVSW_REG_CPLD1_VER_OFFSET	0x2500
+#define NVSW_REG_CPLD2_VER_OFFSET	0x2501
+#define NVSW_REG_CPLD3_VER_OFFSET	0x2502
+#define NVSW_REG_CPLD4_VER_OFFSET	0x2503
+#define NVSW_REG_CPLD1_PN_OFFSET	0x2504
+#define NVSW_REG_CPLD1_PN1_OFFSET	0x2505
+#define NVSW_REG_CPLD2_PN_OFFSET	0x2506
+#define NVSW_REG_CPLD2_PN1_OFFSET	0x2507
+#define NVSW_REG_CPLD3_PN_OFFSET	0x2508
+#define NVSW_REG_CPLD3_PN1_OFFSET	0x2509
+#define NVSW_REG_CPLD4_PN_OFFSET	0x250a
+#define NVSW_REG_CPLD4_PN1_OFFSET	0x250b
+#define NVSW_REG_CPLD7_VER_OFFSET	0x2510
+#define NVSW_REG_RESET_GP2_OFFSET	0x2519
+#define NVSW_REG_RESET_CAUSE_OFFSET	0x251d
+#define NVSW_REG_RESET_CAUSE1_OFFSET	0x251e
+#define NVSW_REG_RESET_CAUSE2_OFFSET	0x251f
+#define NVSW_REG_LED1_OFFSET		0x2520
+#define NVSW_REG_LED5_OFFSET		0x2524
+#define NVSW_REG_LED6_OFFSET		0x2525
+#define NVSW_REG_CPLD7_PN_OFFSET	0x2528
+#define NVSW_REG_CPLD7_PN1_OFFSET	0x2529
+#define NVSW_REG_GP0_RO_OFFSET		0x252a
+#define NVSW_REG_GP0_OFFSET		0x252e
+#define NVSW_REG_GP7_OFFSET		0x252f
+#define NVSW_REG_GP1_OFFSET		0x2530
+#define NVSW_REG_GP4_OFFSET		0x2532
+#define NVSW_REG_FIELD_UPGRADE		0x2534
+#define NVSW_REG_AGGR_OFFSET		0x253a
+#define NVSW_REG_AGGR_MASK_OFFSET	0x253b
+#define NVSW_REG_FU_CAP_OFFSET		0x253c
+#define NVSW_REG_AGGRLO_OFFSET		0x2540
+#define NVSW_REG_AGGRLO_MASK_OFFSET	0x2541
+#define NVSW_REG_ASIC1_HEALTH_OFFSET	0x2550
+#define NVSW_REG_ASIC1_EVENT_OFFSET	0x2551
+#define NVSW_REG_ASIC1_MASK_OFFSET	0x2552
+#define NVSW_REG_PS_DC_OK_OFFSET	0x2567
+#define NVSW_REG_PS_DC_OK_EVENT_OFFSET	0x2568
+#define NVSW_REG_PS_DC_OK_MASK_OFFSET	0x2569
+#define NVSW_REG_CPLD8_PN_OFFSET	0x2573
+#define NVSW_REG_CPLD8_PN1_OFFSET	0x2574
+#define NVSW_REG_CPLD6_VER_OFFSET	0x257c
+#define NVSW_REG_CPLD6_PN_OFFSET	0x257d
+#define NVSW_REG_CPLD6_PN1_OFFSET	0x257e
+#define NVSW_REG_CPLD10_PN_OFFSET	0x2580
+#define NVSW_REG_CPLD10_PN1_OFFSET	0x2581
+#define NVSW_REG_FAN_OFFSET		0x2588
+#define NVSW_REG_FAN_EVENT_OFFSET	0x2589
+#define NVSW_REG_FAN_MASK_OFFSET	0x258a
+#define NVSW_REG_CPLD5_VER_OFFSET	0x258e
+#define NVSW_REG_CPLD5_PN_OFFSET	0x258f
+#define NVSW_REG_CPLD5_PN1_OFFSET	0x2590
+#define NVSW_REG_LEAK_OFFSET		0x25af
+#define NVSW_REG_LEAK_EVENT_OFFSET	0x25b0
+#define NVSW_REG_LEAK_MASK_OFFSET	0x25b1
+#define NVSW_REG_SPI_CHNL_SELECT	0x25c3
+#define NVSW_REG_CPLD5_MVER_OFFSET	0x25c4
+#define NVSW_REG_CPLD8_VER_OFFSET	0x25c8
+#define NVSW_REG_CPLD9_VER_OFFSET	0x25c9
+#define NVSW_REG_CPLD10_VER_OFFSET	0x25ca
+#define NVSW_REG_CPLD9_PN_OFFSET	0x25cb
+#define NVSW_REG_CPLD9_PN1_OFFSET	0x25cc
+#define NVSW_REG_WD2_TMR_OFFSET		0x25cd
+#define NVSW_REG_WD2_TLEFT_OFFSET	0x25ce
+#define NVSW_REG_WD2_ACT_OFFSET		0x25cf
+#define NVSW_REG_WD3_TMR_OFFSET		0x25d1
+#define NVSW_REG_WD3_TLEFT_OFFSET	0x25d2
+#define NVSW_REG_WD3_ACT_OFFSET		0x25d3
+#define NVSW_REG_CPLD7_MVER_OFFSET	0x25d5
+#define NVSW_REG_CPLD8_MVER_OFFSET	0x25d6
+#define NVSW_REG_CPLD9_MVER_OFFSET	0x25d7
+#define NVSW_REG_CPLD10_MVER_OFFSET	0x25d8
+#define NVSW_REG_CPLD6_MVER_OFFSET	0x25d9
+#define NVSW_REG_MUX1_OFFSET		0x25db
+#define NVSW_REG_CPLD1_MVER_OFFSET	0x25de
+#define NVSW_REG_CPLD2_MVER_OFFSET	0x25df
+#define NVSW_REG_CPLD3_MVER_OFFSET	0x25e0
+#define NVSW_REG_CPLD4_MVER_OFFSET	0x25e1
+#define NVSW_REG_PWM1_OFFSET		0x25e3
+#define NVSW_REG_TACHO1_OFFSET		0x25e4
+#define NVSW_REG_TACHO2_OFFSET		0x25e5
+#define NVSW_REG_TACHO3_OFFSET		0x25e6
+#define NVSW_REG_TACHO4_OFFSET		0x25e7
+#define NVSW_REG_TACHO5_OFFSET		0x25e8
+#define NVSW_REG_TACHO6_OFFSET		0x25e9
+#define NVSW_REG_TACHO7_OFFSET		0x25eb
+#define NVSW_REG_TACHO8_OFFSET		0x25ec
+#define NVSW_REG_TACHO9_OFFSET		0x25ed
+#define NVSW_REG_TACHO10_OFFSET		0x25ee
+#define NVSW_REG_FAN_CAP1_OFFSET	0x25f5
+#define NVSW_REG_FAN_DRW_CAP_OFFSET	0x25f7
+#define NVSW_REG_TACHO_SPEED_OFFSET	0x25f8
+#define NVSW_REG_MAX			0x26ff
+
+/*
+ * Health fields of the first to the fourth ASIC, two bits each, all held in
+ * NVSW_REG_ASIC1_HEALTH_OFFSET.
+ */
+#define NVSW_ASIC_MASK			GENMASK(1, 0)
+#define NVSW_ASIC2_MASK			GENMASK(3, 2)
+#define NVSW_ASIC3_MASK			GENMASK(5, 4)
+#define NVSW_ASIC4_MASK			GENMASK(7, 6)
+#define NVSW_LED_LO_NIBBLE_MASK		GENMASK(7, 4)
+#define NVSW_LED_HI_NIBBLE_MASK		GENMASK(3, 0)
+#define NVSW_UART_SEL_MASK		GENMASK(7, 6)
+#define NVSW_FU_CAP_MASK		GENMASK(1, 0)
+#define NVSW_WD_RESET_ACT_MASK		GENMASK(7, 1)
+#define NVSW_WD_FAN_ACT_MASK		(GENMASK(7, 0) & ~BIT(4))
+#define NVSW_WD_TYPE2_TO_MASK		0
+#define NVSW_WD3_DFLT_TIMEOUT		600
+
+#define NVSW_MUX_MAX			2
+#define NVSW_WD_MAX			2
+
+/**
+ * struct nvsw_core - device private data
+ * @dev: device;
+ * @client: I2C client device;
+ * @regmap: device register map;
+ * @regio_data: register access platform data;
+ * @regio: register access device;
+ * @hotplug_data: hotplug platform data;
+ * @hotplug: hotplug device;
+ * @led: led device;
+ * @led_data: led platform data;
+ * @fan: fan device;
+ * @fan_data: fan platform data;
+ * @wd: watchdog devices;
+ * @wd_data: watchdog platform data;
+ * @set_reg_default: board callback writing register defaults, run once from
+ *		     nvsw_core_init() before any device is registered, or NULL;
+ * @restore_reg_default: board callback undoing @set_reg_default, run from
+ *			 nvsw_core_exit() and when nvsw_core_init() fails after
+ *			 @set_reg_default succeeded, or NULL;
+ * @mux_init: board callback creating the I2C mux topology, or NULL;
+ * @mux_exit: board callback removing the I2C mux topology, or NULL;
+ * @mux: mux devices;
+ * @mux_num: number of mux devices;
+ */
+struct nvsw_core {
+	struct device *dev;
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct mlxreg_core_platform_data *regio_data;
+	struct platform_device *regio;
+	struct mlxreg_core_hotplug_platform_data *hotplug_data;
+	struct platform_device *hotplug;
+	struct platform_device *led;
+	struct mlxreg_core_platform_data *led_data;
+	struct platform_device *fan;
+	struct mlxreg_core_platform_data *fan_data;
+	struct platform_device *wd[NVSW_WD_MAX];
+	struct mlxreg_core_platform_data *wd_data[NVSW_WD_MAX];
+	int (*set_reg_default)(struct regmap *regmap);
+	int (*restore_reg_default)(struct regmap *regmap);
+	int (*mux_init)(struct nvsw_core *nvsw_core);
+	void (*mux_exit)(struct nvsw_core *nvsw_core);
+	struct platform_device *mux[NVSW_MUX_MAX];
+	u32 mux_num;
+};
+
+/* Platform core init/exit functions. */
+int nvsw_core_init(struct nvsw_core *nvsw_core);
+void nvsw_core_exit(struct nvsw_core *nvsw_core);
+
+#endif /* !defined(__NVSW_H__) */
-- 
2.34.1

