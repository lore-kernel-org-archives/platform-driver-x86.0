Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795632462;
	b=giuEyha0Vys9TIFO1SAKCEjctT3qt2wY3kyj1JLtwMRl2bKSuaWJIyBsQFXszYXGzu4X
	 cGa5vAW8OflQs19Adma7V5ZFe6cSbvwaJo4Wea51BZ4UKvvpmWBbneK5o28fDcjk+57l3
	 0hDOe6DQ0YYxC9tjNBjnvorNZ0lDb2Tp64WIFCZVjyz259+YTUc0zChQsj6M7KMT4Mzl4
	 9iE6lrw0BGeYR3WrFmAIXdwd1l0AY2aeHRMsI2rCK83bHnYYWSzQQqT/HgZOeSEFDc/MS
	 tPBJNQTa+x5MrS8BBnoRR1JUNXChor2/7rn5wWNqE9ewV5yaB+Cq/c+8Lytp4q0WqSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632462;
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
	bh=qOWArkFHVIFNHvxttanomc4QVnZSq531AiJ4qJyKcr8=;
	b=OHUDx7woXREYtg6idhwhCZmKi5Dz1reevYfAiGEPplgCJWBwV0Kgr7oOpABnPCiyumlS
	 UKga1dvHs43cQs8FnNC3B+6M2YJGN6G6kXwzOIIw6XSRlXFS2wSA1suPFdEocLHenOzh9
	 NFhBT7YelLdy/GmvkLtTecvXwSAI45BbKpzOQtaOOlFDKeMcUfrVTw4aIPEmvk9Loitjt
	 JQ9ZI+BCT5t/a2/xPEYqfG2G80gJbFF+UFTBNetHoRKePwkmfmM0ssMP/QZ3VymmNuxfS
	 cb/EHdd2nboAzDdYv/jVXWRdYDsb/cAIcfAxq5L/VAZFMwiUE1ksDsFyQPkhoR1Op8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e7SQUt5R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.23
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D372606A335
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 18:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D372606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e7SQUt5R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZdHXEj+DkPTwQ0sy2Qbk1Slr0K4Pfy/PS4d71g+IeZx+anFqCinTZgC02+YIzLjn8pUlhidVaxgcwJqYDgYbIiVFnevaw3ouQu3u3dqe2qfhp8OsoXPCz5YxTE8Cmh3REVQUFWbCzTc5kihlZOeyXQIXIwnCHiLd+aoDaA99UjJwt7xqjBahKvRcGPavDWL+/g5Ncf4dTD065uJ8L3JDxZEeXKm4oesD9AK7mwDwNVi6EOJXe6oZB/w18K9rm4i3JS1KkI1A1RMJat8+KIcxEHjcGavNsJb99X74y4W3P5kCkz9DsogjGavQDxzRXaNiGjn7bfNyFn3vMQGbpn1FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOWArkFHVIFNHvxttanomc4QVnZSq531AiJ4qJyKcr8=;
 b=Hx4o7u3eGEJY1H/KqEH3qWOePGV3OpCW0IXRvXJEDiil2/29CB6m6lSTWmzo+JT84Y0YYJAVgHPOSKk2M9SFobwv6xblh1FDm7rIqkBsaN0tuVagY7dWgCZSKiIt/CaBFad96odjvA0MVmEI9y4hFUz7Jh9ZZuAAQqHjHbOCIYYqwFwiK1VI5xJ9IXlwmtoRRYYMxbimdkAjr3YZF0YamkTKiOPixGWVzzQ5IGGOmxpIZgFoJ3SPPSdnxl/8k3m1JpSDst5L+pUR1dL8oSsZrGVT+Ia6chJ5Me60sNAvr7gemZvagEfLSTdFQHZ66AgkoCmW22ffydTeOhsOxbvQTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOWArkFHVIFNHvxttanomc4QVnZSq531AiJ4qJyKcr8=;
 b=e7SQUt5RiLFtu8Uetr6URc1U7wENqNrwipv5aHgbIA1DKI3D+kvDEbPc1ysYQKCQUzRTQpgnxQ20tGRIhr44lbUvn145Qvg5Tjt8wPZH/wBvIRxhqKYZaeaaJk6Iwt9vDbKntih2ttZStgHd/DzIwqpLYkK4eVwo14XbimtEBe3iMMrCrLOBZXoteZVkjXbNHWNzuPPsII5gCCdNV1gACXsXgugCQSkpOA2Lr2fR1OTeQNMU+c9f/8A6zFmgApO6gL6uMW/m690VcGFVYTjP2AK/r/HBo5PTcJGSVrYOd7qVh5+XRDIucez1nNY4Zx4HjYKYmt+8dcuBRn2h3TM90g==
Received: from MW4P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::20)
 by LV2PR12MB290147.namprd12.prod.outlook.com (2603:10b6:408:3a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 18:47:33 +0000
Received: from SJ1PEPF000037AC.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::98) by MW4P222CA0015.outlook.office365.com
 (2603:10b6:303:114::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 18:47:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000037AC.mail.protection.outlook.com (10.167.244.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 18:47:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:47:06 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:47:04 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
CC: Felix Radensky <fradensky@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH v4 3/3] platform/mellanox: nvsw-host-spc6: Add support for SPC6 air cooled switches
Date: Wed, 25 Nov 2026 20:46:33 +0200
Message-ID: <20261125184633.2825486-4-fradensky@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AC:EE_|LV2PR12MB290147:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ab6db2-a8c2-4fcf-59ac-08df4b2490e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|11063799006|56012099006|10067099003|5023799004|261022075727099003|261022105027099003|261026121527099003|261028144727099003|261021121427099003|261026140227099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	cSyvWHGpPOZMdsHEjtjS0SMBGOx/OacuKgi3YwtBOhgbbYq2RRPXBg1SmoFHBo/F3QildLVtzp0P/MrTZBVSRUILwsbuH0b1cy8VOGQvsC60zngdWIwmJEaqWdsmniXy4Pm3bKaRCp3YRtMFnH040mK4c6AxBqF6kUPfsZToHI6Y+Zhst3ja5r+OCLDRm34Z9bIb3Vxr/3WHxaS1FfTn3kB9+mujuEewuligmhkx8RhEr5ike2anB/ifRuio0eM5xWFfHQThG02HGzkG5ZqZqe3kBmVoWnyZ7IDVj8cNlAdjKbxY2oxcWt0frtr+2D+Bc5sz0rRgcZZqLHQtw5prLZEb8UF5efbcKDxyWDuc+LuxndUIfUNVTEK8MztlbVpjxuspui/OTmh3oekrFMrWQZtD+wHnFq171WWohozIkO0Af3gp928dOO1eTY89XjGjJeiwXqGrs8XUhKZjohIRpbwnKKHXLa85p0b13gVuOTycRnlya9HyuBb+/ySitaB5NRBvpZ7Qf6FdHm1SxMMODE4P+U98YUNUwRSkH4JhpruURTA6MbezUR1SZ+SuX0N7r/zp/+jAblq54pWqzAGXpAWCWc33LKmy/VJLOse5xttIRh1SJ1y5CY2NwnqzFht2xt1WgOmtbOh7Ra7fNAhToclgnO6J7usvQ2Pkna8Ib0PNW3Xv2/oyYrGngL3XADgZMSvjd1DgiLBbKvcQtvRbXw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(11063799006)(56012099006)(10067099003)(5023799004)(261022075727099003)(261022105027099003)(261026121527099003)(261028144727099003)(261021121427099003)(261026140227099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9ECz6cCPgsX/3DQR16gtvTHJj7X016GmEP7CVHA8ybGxwpEN6jJnyfZT1XchV/89ptuYJIKF/Z/mBm/k4SyyRLOCHM/OBfIZeydmIwq2TzfoJ+pbmY6SPrXYUszJTmej4lqYqEUW2DCcQzeAQ2K+IK/lNj0V1xgAocjWB3Rvn6ZnfyL1inA4k0EtHDu5JhhCSJB+wo6jSdXyleOusgFAu71dWLx82hd71R7A+oTbGTS2UCWHX4lio+Sv4LCTMLV02lIIINWx4c54iY/TLrYuVt5dCfRtZIbqtQl1cUXVakHgQVzUSBTdpQZKgVbLIo9WzgHbjfrXameXODgwhNEociiFqCZb6UIHXAk0bkuC7dMKU1eOUfZh8BTtIxT7L82RTuwqY7+bo9j6ptvCpuVSv+ilfn52C0aPay1qXB1cOApqWTnYTWAeIvvGvBlu1693
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:47:33.1098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ab6db2-a8c2-4fcf-59ac-08df4b2490e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB290147

Add support for air cooled Ethernet switches based on the Nvidia SPC6
ASIC. Unlike the liquid cooled systems already supported by the
driver, these carry their own power supplies and fan drawers.

They therefore expose a different set of register access attributes:
power supply presence, AC and DC status and fan drawer presence, in
place of the coolant leakage detection and power distribution board
status of the liquid cooled systems. They also come with their own LED
layout, adding power supply and per fan drawer LEDs, and with fan
control. Add the LED and power supply registers these attributes use
to the nvsw-core register map. As for the other status registers in the
map, the mask registers of the two power supply status registers are
added too, so that a board can describe hotplug items over them. These
systems do not create a hotplug device; they report power supply and
fan events through the mlxreg-io event attributes.

The CPLD of these systems can override the fan PWM and drive the fans at
full speed when it detects a fan fault. The override is enabled by bit 0
of the general purpose register at 0x252e, which is set by default.
Clear it through the set_reg_default callback, which runs before the fan
device is registered, leaving the fan speed to the software. Set it
again through restore_reg_default when the driver is removed or fails to
probe, so that the CPLD handles fan faults whenever no software controls
the fans.

Describe the system and select its description through the driver_data
of the matching DMI entry, so that the board data is chosen by the SKU
that was matched rather than by inspecting DMI again.

Document the power supply and fan drawer attributes the new system
exposes, which are not yet covered by
Documentation/ABI/stable/sysfs-driver-mlxreg-io.

Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---

Notes:
    v3->v4
    Comments pointed out by Ilpo:
    - Take the fan platform data and the set_reg_default callback from
      the matched board description in the probe path, following the
      rework in patch 2. The two module scope copies are gone.
    - Update the ABI Date and KernelVersion to November 2026 and 7.5, as
      in patch 2.
    Issues reported by a local sashiko review:
    - Add only the registers this patch uses to the nvsw-core register
      map. The power supply alarm status, event and mask registers,
      TACHO13 to TACHO20, and CURRENT_TEMP_RO and SWITCH_IC_QTY were made
      accessible with no attribute, LED or fan entry over them, widening
      regmap and debugfs access for no user. They are dropped from the
      tables, along with the definitions this patch introduced for them,
      and the commit message now says which registers are added. The mask
      registers of the power supply and power supply AC status registers
      (0x255d, 0x2563) stay, so that every status register in the map has
      its event and mask registers, as in patch 1. Nothing in the series
      accesses them, since these systems create no hotplug device and
      report power supply and fan events through mlxreg-io, and the commit
      message says so.
    - Restore the CPLD fan fault override on remove and on probe failure.
      The override was cleared at probe and never set again, so after an
      unbind, or a probe that failed past set_reg_default, the fans were
      left at their last PWM value with neither the CPLD nor software
      reacting to a fan fault. The new restore_reg_default callback sets
      NVSW_FAN_CONTROL_EN_MASK again once the fan device is gone.
    - Drop the claim that mlx-platform clears the same override. Its
      defaults write PWM_CONTROL, whose SPC6 counterpart at 0x2537 holds
      SPD write protect and power controls instead. The override is bit 0
      of 0x252e on the air cooled CPLD only; the liquid cooled one uses
      that bit for a USB to UART bridge reset. The commit message names
      the register, and NVSW_FAN_CONTROL_EN_MASK carries a comment.
    - Say in the ABI what a write to psu_event, psu_ac_event,
      psu_dc_event and fan_event does to the other bits. The attributes
      cover the whole register, so a write reaches every bit of it, and
      the CPLD clears the bits written as 0 and leaves those written as 1
      unchanged. The text only said that writing 0 to a bit clears it.
    - On the sashiko.dev finding against this patch: it is valid, and it
      is fixed in the LED tree rather than here. The fan drawer LEDs are
      described by a slot index because the capability register of these
      systems reports a count rather than a bitmap, and
      mlxreg_led_config() only understood the bitmap flavour. The same
      description style is used by mlx-platform, which has been losing
      all twenty of its fan LEDs since v6.16, so the gap belongs to
      leds-mlxreg. Lee has applied the fix, commit 68a2bfdf7b4d ("leds:
      mlxreg: Fix missing fan LEDs on systems reporting a unit count"),
      queued for the same merge window. The LED table is unchanged here.
    Additional fixes added by Felix:
    - Make asic_reset write only, as in patch 2.
    - Drop the cpu_mctp_ready attribute, as in patch 2.
    - Drop the asic_pg_fail attribute, which the liquid cooled table does
      not have either. GP4_RO, the register only it used, is dropped from
      the patch 1 register map with it.
    
    v2->v3
    Additional fixes added by Felix:
    - Describe jtag_enable as the single bit it is, as in patch 2.
    - Drop the aux_pwr_cycle attribute, which is not supported on systems
      with power supply units.
    - Clear the CPLD fan fault override enable bit, so that the fan speed
      is left to the software. This is done from the board driver through
      the set_reg_default callback, which the core calls before the fan
      device is registered.
    
    Issues reported by the sashiko.dev review:
    - Fix the documented polarity of psu_status. The CPLD reports power
      supply presence active low, so bit value 0 means the unit is
      present. psu_ac_status and psu_dc_status share the same
      description block but are active high, so the polarity is now
      spelled out per attribute instead of in one sentence covering all
      three.
    - Fix the documented polarity of fan_status. The CPLD reports fan
      drawer presence active low, so bit value 0 means the drawer is
      present, which is what mlxreg_fan_read() already assumes when it
      reads the same register through .reg_prsnt. The ABI text claimed
      the opposite.
    - Drop the claim that this system exposes power supply alarm
      indications from the commit message. The alarm registers are
      defined and reachable through the register map, but no attribute is
      described over them.
    - Correct the mode of the pwr_cycle attribute, which was 0244 instead
      of the 0200 used by the liquid cooled table and documented in the
      ABI. 0244 denied read access to root while granting it to everyone
      else on a write only attribute.
    
    v1->v2
    - No change. The hunk offsets moved because of the include additions
      in patches 1 and 2.

 .../ABI/stable/sysfs-driver-mlxreg-io         |  46 ++
 drivers/platform/mellanox/nvsw-core.c         |  16 +
 drivers/platform/mellanox/nvsw-host-spc6.c    | 600 ++++++++++++++++++
 drivers/platform/mellanox/nvsw.h              |  15 +
 4 files changed, 677 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 8d59181d7196..25f722379873 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -970,3 +970,49 @@ Description:	These files show the system reset cause. Respectively:
 		the last reset.
 
 		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_status
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_ac_status
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_dc_status
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show the state of the system power supply units, one
+		bit per unit. Respectively: unit presence, unit AC power good
+		and unit DC power good. In psu_status bit value 0 means the
+		related unit is present, 1 - otherwise. In psu_ac_status and
+		psu_dc_status bit value 1 means the related power is good,
+		0 - otherwise.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/fan_status
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file shows the presence of the system fan drawers, one bit
+		per drawer. Bit value 0 means the related drawer is present,
+		1 - otherwise.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_event
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_ac_event
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_dc_event
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/fan_event
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show the sticky indication of a change in the
+		matching status file: power supply unit presence, power supply
+		unit AC power, power supply unit DC power and fan drawer
+		presence. Bit value 1 means the related unit changed its state
+		since the indication was last cleared.
+
+		A write applies to all the bits of the file at once: a bit
+		written as 0 is cleared, and a bit written as 1 is left
+		unchanged. Writing 0 clears all the indications, and writing
+		a value with only the bit of one unit at 0 clears the
+		indication of that unit alone.
+
+		The files are read/write.
diff --git a/drivers/platform/mellanox/nvsw-core.c b/drivers/platform/mellanox/nvsw-core.c
index 82b2d856292b..e9d0ff9b2c1a 100644
--- a/drivers/platform/mellanox/nvsw-core.c
+++ b/drivers/platform/mellanox/nvsw-core.c
@@ -33,10 +33,17 @@ static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_ASIC1_EVENT_OFFSET:
 	case NVSW_REG_ASIC1_MASK_OFFSET:
 	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED2_OFFSET:
+	case NVSW_REG_LED3_OFFSET:
+	case NVSW_REG_LED4_OFFSET:
 	case NVSW_REG_LED5_OFFSET:
 	case NVSW_REG_LED6_OFFSET:
+	case NVSW_REG_PS_AC_2_EVENT_OFFSET:
+	case NVSW_REG_PS_AC_2_MASK_OFFSET:
 	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
 	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
+	case NVSW_REG_PS_2_EVENT_OFFSET:
+	case NVSW_REG_PS_2_MASK_OFFSET:
 	case NVSW_REG_FAN_EVENT_OFFSET:
 	case NVSW_REG_FAN_MASK_OFFSET:
 	case NVSW_REG_LEAK_EVENT_OFFSET:
@@ -82,6 +89,9 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_RESET_CAUSE1_OFFSET:
 	case NVSW_REG_RESET_CAUSE2_OFFSET:
 	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED2_OFFSET:
+	case NVSW_REG_LED3_OFFSET:
+	case NVSW_REG_LED4_OFFSET:
 	case NVSW_REG_LED5_OFFSET:
 	case NVSW_REG_LED6_OFFSET:
 	case NVSW_REG_CPLD7_PN_OFFSET:
@@ -100,6 +110,12 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_ASIC1_HEALTH_OFFSET:
 	case NVSW_REG_ASIC1_EVENT_OFFSET:
 	case NVSW_REG_ASIC1_MASK_OFFSET:
+	case NVSW_REG_PS_AC_2_OFFSET:
+	case NVSW_REG_PS_AC_2_EVENT_OFFSET:
+	case NVSW_REG_PS_AC_2_MASK_OFFSET:
+	case NVSW_REG_PS_2_OFFSET:
+	case NVSW_REG_PS_2_EVENT_OFFSET:
+	case NVSW_REG_PS_2_MASK_OFFSET:
 	case NVSW_REG_PS_DC_OK_OFFSET:
 	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
 	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
diff --git a/drivers/platform/mellanox/nvsw-host-spc6.c b/drivers/platform/mellanox/nvsw-host-spc6.c
index a3ed8dde9403..9480398aafc8 100644
--- a/drivers/platform/mellanox/nvsw-host-spc6.c
+++ b/drivers/platform/mellanox/nvsw-host-spc6.c
@@ -33,10 +33,16 @@
  * struct nvsw_host_spc6_cfg - per SKU board description
  * @regs_io: register access platform data;
  * @led: led platform data;
+ * @fan: fan platform data, NULL on systems without fans;
+ * @set_reg_default: set default registers callback, NULL if not required;
+ * @restore_reg_default: restore default registers callback, NULL if not required;
  */
 struct nvsw_host_spc6_cfg {
 	struct mlxreg_core_platform_data *regs_io;
 	struct mlxreg_core_platform_data *led;
+	struct mlxreg_core_platform_data *fan;
+	int (*set_reg_default)(struct regmap *regmap);
+	int (*restore_reg_default)(struct regmap *regmap);
 };
 
 /* Platform mux channels */
@@ -567,6 +573,346 @@ static struct mlxreg_core_platform_data nvsw_host_spc6_lc_4asic_regs_io = {
 	.counter = ARRAY_SIZE(nvsw_host_spc6_lc_4asic_regs_io_data),
 };
 
+/* Platform register access data for air cooled system */
+static struct mlxreg_core_data nvsw_host_spc6_ac_regs_io_data[] = {
+	{
+		.label = "cpld1_version",
+		.reg = NVSW_REG_CPLD1_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld1_version_min",
+		.reg = NVSW_REG_CPLD1_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version",
+		.reg = NVSW_REG_CPLD2_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version_min",
+		.reg = NVSW_REG_CPLD2_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version",
+		.reg = NVSW_REG_CPLD3_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version_min",
+		.reg = NVSW_REG_CPLD3_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version",
+		.reg = NVSW_REG_CPLD4_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version_min",
+		.reg = NVSW_REG_CPLD4_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld1_pn",
+		.reg = NVSW_REG_CPLD1_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld2_pn",
+		.reg = NVSW_REG_CPLD2_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld3_pn",
+		.reg = NVSW_REG_CPLD3_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld4_pn",
+		.reg = NVSW_REG_CPLD4_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "asic_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "reset_long_pb",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_short_pb",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_aux_pwr_or_reload",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_dc_dc_pwr_fail",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_platform",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_wd",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_asic_thermal",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_soc",
+		.reg = NVSW_REG_RESET_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_system",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_sw_pwr_off",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_cpu_thermal",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_ac_pwr_fail",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_mgmt_pwr",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "fan_dir",
+		.reg = NVSW_REG_GP0_RO_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpu_shutdown_req",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "vpd_wp",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+		.secured = 1,
+	},
+	{
+		.label = "pcie_asic_reset_dis",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "cpu_power_off_ready",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "pwr_converter_prog_en",
+		.reg = NVSW_REG_GP7_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "graceful_pwr_off",
+		.reg = NVSW_REG_GP7_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "pwr_cycle",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "pwr_down",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "bmc_to_cpu_ctrl",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "uart_sel",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = NVSW_UART_SEL_MASK,
+		.bit = 7,
+		.mode = 0644,
+	},
+	{
+		.label = "psu1_on",
+		.reg = NVSW_REG_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0200,
+	},
+	{
+		.label = "psu2_on",
+		.reg = NVSW_REG_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0200,
+	},
+	{
+		.label = "psu3_on",
+		.reg = NVSW_REG_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "psu4_on",
+		.reg = NVSW_REG_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "jtag_enable",
+		.reg = NVSW_REG_FIELD_UPGRADE,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "jtag_cap",
+		.reg = NVSW_REG_FU_CAP_OFFSET,
+		.mask = NVSW_FU_CAP_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "asic_health",
+		.reg = NVSW_REG_ASIC1_HEALTH_OFFSET,
+		.mask = NVSW_ASIC_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "psu_status",
+		.reg = NVSW_REG_PS_2_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "psu_event",
+		.reg = NVSW_REG_PS_2_EVENT_OFFSET,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "psu_ac_status",
+		.reg = NVSW_REG_PS_AC_2_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "psu_ac_event",
+		.reg = NVSW_REG_PS_AC_2_EVENT_OFFSET,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "psu_dc_status",
+		.reg = NVSW_REG_PS_DC_OK_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "psu_dc_event",
+		.reg = NVSW_REG_PS_DC_OK_EVENT_OFFSET,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "fan_status",
+		.reg = NVSW_REG_FAN_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "fan_event",
+		.reg = NVSW_REG_FAN_EVENT_OFFSET,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "spi_chnl_select",
+		.reg = NVSW_REG_SPI_CHNL_SELECT,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_ac_regs_io = {
+	.data = nvsw_host_spc6_ac_regs_io_data,
+	.counter = ARRAY_SIZE(nvsw_host_spc6_ac_regs_io_data),
+};
+
 /* Platform led data for liquid cooled system */
 static struct mlxreg_core_data nvsw_host_spc6_lc_led_data[] = {
 	{
@@ -601,6 +947,219 @@ static struct mlxreg_core_platform_data nvsw_host_spc6_lc_led = {
 	.counter = ARRAY_SIZE(nvsw_host_spc6_lc_led_data),
 };
 
+/* Platform led data for air cooled system */
+static struct mlxreg_core_data nvsw_host_spc6_ac_led_data[] = {
+	{
+		.label = "status:green",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "status:amber",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "psu:green",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "psu:amber",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "fan:green",
+		.reg = NVSW_REG_LED6_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "fan:amber",
+		.reg = NVSW_REG_LED6_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "uid:blue",
+		.reg = NVSW_REG_LED5_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "fan1:green",
+		.reg = NVSW_REG_LED2_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 1,
+	},
+	{
+		.label = "fan1:orange",
+		.reg = NVSW_REG_LED2_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 1,
+	},
+	{
+		.label = "fan2:green",
+		.reg = NVSW_REG_LED2_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 2,
+	},
+	{
+		.label = "fan2:orange",
+		.reg = NVSW_REG_LED2_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 2,
+	},
+	{
+		.label = "fan3:green",
+		.reg = NVSW_REG_LED3_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 3,
+	},
+	{
+		.label = "fan3:orange",
+		.reg = NVSW_REG_LED3_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 3,
+	},
+	{
+		.label = "fan4:green",
+		.reg = NVSW_REG_LED3_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 4,
+	},
+	{
+		.label = "fan4:orange",
+		.reg = NVSW_REG_LED3_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 4,
+	},
+	{
+		.label = "fan5:green",
+		.reg = NVSW_REG_LED4_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 5,
+	},
+	{
+		.label = "fan5:orange",
+		.reg = NVSW_REG_LED4_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 5,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_ac_led = {
+	.data = nvsw_host_spc6_ac_led_data,
+	.counter = ARRAY_SIZE(nvsw_host_spc6_ac_led_data),
+};
+
+/* Platform fan data for air cooled system */
+static struct mlxreg_core_data nvsw_host_spc6_ac_fan_data[] = {
+	{
+		.label = "pwm1",
+		.reg = NVSW_REG_PWM1_OFFSET,
+	},
+	{
+		.label = "tacho1",
+		.reg = NVSW_REG_TACHO1_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 1,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho2",
+		.reg = NVSW_REG_TACHO2_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 2,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho3",
+		.reg = NVSW_REG_TACHO3_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 3,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho4",
+		.reg = NVSW_REG_TACHO4_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 4,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho5",
+		.reg = NVSW_REG_TACHO5_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 5,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho6",
+		.reg = NVSW_REG_TACHO6_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 6,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho7",
+		.reg = NVSW_REG_TACHO7_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 7,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho8",
+		.reg = NVSW_REG_TACHO8_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 8,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho9",
+		.reg = NVSW_REG_TACHO9_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 9,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho10",
+		.reg = NVSW_REG_TACHO10_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 10,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "conf",
+		.capability = NVSW_REG_TACHO_SPEED_OFFSET,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_ac_fan = {
+	.data = nvsw_host_spc6_ac_fan_data,
+	.counter = ARRAY_SIZE(nvsw_host_spc6_ac_fan_data),
+	.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+	.version = 1,
+};
+
 /* Watchdog platform data */
 static struct mlxreg_core_data nvsw_host_spc6_wd_main_regs[] = {
 	{
@@ -712,6 +1271,28 @@ static void nvsw_host_spc6_mux_topology_exit(struct nvsw_core *nvsw_core)
 		platform_device_unregister(nvsw_core->mux[i]);
 }
 
+/* Register default values callback. */
+static int nvsw_host_spc6_set_reg_default(struct regmap *regmap)
+{
+	/* The CPLD can override the fan PWM and drive the fans at full speed
+	 * on a fan fault. Clear the enable bit for that override, leaving the
+	 * fan speed to the software.
+	 */
+	return regmap_update_bits(regmap, NVSW_REG_GP0_OFFSET,
+				  NVSW_FAN_CONTROL_EN_MASK, 0);
+}
+
+/* Register default values restore callback. */
+static int nvsw_host_spc6_restore_reg_default(struct regmap *regmap)
+{
+	/* Hand fan fault handling back to the CPLD, as no software controls
+	 * the fans once the fan device is gone.
+	 */
+	return regmap_update_bits(regmap, NVSW_REG_GP0_OFFSET,
+				  NVSW_FAN_CONTROL_EN_MASK,
+				  NVSW_FAN_CONTROL_EN_MASK);
+}
+
 /* Liquid cooled single ASIC systems, without power supplies and fans. */
 static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_lc = {
 	.regs_io = &nvsw_host_spc6_lc_regs_io,
@@ -724,7 +1305,23 @@ static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_lc_4asic = {
 	.led = &nvsw_host_spc6_lc_led,
 };
 
+/* Air cooled system, equipped with power supplies and fan drawers. */
+static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_ac = {
+	.regs_io = &nvsw_host_spc6_ac_regs_io,
+	.led = &nvsw_host_spc6_ac_led,
+	.fan = &nvsw_host_spc6_ac_fan,
+	.set_reg_default = nvsw_host_spc6_set_reg_default,
+	.restore_reg_default = nvsw_host_spc6_restore_reg_default,
+};
+
 static const struct dmi_system_id nvsw_host_dmi_table[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0025"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI186"),
+		},
+		.driver_data = (void *)&nvsw_host_spc6_cfg_ac,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "VMOD0025"),
@@ -803,6 +1400,9 @@ static int nvsw_host_probe(struct platform_device *pdev)
 		nvsw_core->wd_data[i] = &nvsw_host_spc6_wd_set[i];
 	nvsw_core->regio_data = cfg->regs_io;
 	nvsw_core->led_data = cfg->led;
+	nvsw_core->fan_data = cfg->fan;
+	nvsw_core->set_reg_default = cfg->set_reg_default;
+	nvsw_core->restore_reg_default = cfg->restore_reg_default;
 	nvsw_core->mux_init = nvsw_host_spc6_mux_topology_init;
 	nvsw_core->mux_exit = nvsw_host_spc6_mux_topology_exit;
 	platform_set_drvdata(pdev, nvsw_core);
diff --git a/drivers/platform/mellanox/nvsw.h b/drivers/platform/mellanox/nvsw.h
index 65746e4b539b..0b3544fbee49 100644
--- a/drivers/platform/mellanox/nvsw.h
+++ b/drivers/platform/mellanox/nvsw.h
@@ -37,6 +37,9 @@ struct regmap;
 #define NVSW_REG_RESET_CAUSE1_OFFSET	0x251e
 #define NVSW_REG_RESET_CAUSE2_OFFSET	0x251f
 #define NVSW_REG_LED1_OFFSET		0x2520
+#define NVSW_REG_LED2_OFFSET		0x2521
+#define NVSW_REG_LED3_OFFSET		0x2522
+#define NVSW_REG_LED4_OFFSET		0x2523
 #define NVSW_REG_LED5_OFFSET		0x2524
 #define NVSW_REG_LED6_OFFSET		0x2525
 #define NVSW_REG_CPLD7_PN_OFFSET	0x2528
@@ -55,6 +58,12 @@ struct regmap;
 #define NVSW_REG_ASIC1_HEALTH_OFFSET	0x2550
 #define NVSW_REG_ASIC1_EVENT_OFFSET	0x2551
 #define NVSW_REG_ASIC1_MASK_OFFSET	0x2552
+#define NVSW_REG_PS_2_OFFSET		0x255b
+#define NVSW_REG_PS_2_EVENT_OFFSET	0x255c
+#define NVSW_REG_PS_2_MASK_OFFSET	0x255d
+#define NVSW_REG_PS_AC_2_OFFSET		0x2561
+#define NVSW_REG_PS_AC_2_EVENT_OFFSET	0x2562
+#define NVSW_REG_PS_AC_2_MASK_OFFSET	0x2563
 #define NVSW_REG_PS_DC_OK_OFFSET	0x2567
 #define NVSW_REG_PS_DC_OK_EVENT_OFFSET	0x2568
 #define NVSW_REG_PS_DC_OK_MASK_OFFSET	0x2569
@@ -113,6 +122,12 @@ struct regmap;
 #define NVSW_REG_TACHO_SPEED_OFFSET	0x25f8
 #define NVSW_REG_MAX			0x26ff
 
+/*
+ * CPLD fan PWM override on fan failure, in NVSW_REG_GP0_OFFSET of the air
+ * cooled SPC6 systems only. The liquid cooled ones use the same bit for a
+ * pulsed USB to UART bridge reset.
+ */
+#define NVSW_FAN_CONTROL_EN_MASK	BIT(0)
 /*
  * Health fields of the first to the fourth ASIC, two bits each, all held in
  * NVSW_REG_ASIC1_HEALTH_OFFSET.
-- 
2.34.1

