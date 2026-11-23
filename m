Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475406;
	b=b3Tw7wqbrZhjokSs/SFE3W8Sp3GJakAfBFJI5upBR2qSykoVhCHBZrZ1wcwXSVgiyoKg
	 Ex1aXeWzRkN3Wi+PR6FNw6BrMtCFqscXabubJZuEASjA15xh921M0wIionCjz52GsjP+m
	 0DjfFCloOFV3XgAq5qyQVFxs/P+rGJfN4jOd1mDIbCGsdiBr3MvpOFuyukxLXGMyPtEBQ
	 oNqNH8EVcAwsRY75wVbNtntFpQcO21cuWvOxZ5hyk8YDuAbVru4ifViHmXmym7bLKtFpu
	 kpi1Prc4NVz4cojf3iyK8a84Ds3oekCSdxNqS9rHESo5CxEipxZKuvOyRAlgTkiWgtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475406;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JhM3jrEjGwussC4IR5VEAGC5v941JS2pJ90H+TVo3MI=;
	b=hM1w0UiVNFlufjZH5qEksAKnj2CuRUktPu8h/CkFz8EaqUUIDEV3vjdKbZ2A0y0sQKjz
	 W9Hh0ulmQiNydw0U3EUTwsfJl6fYc/H1t0DCXC8dEaZiVZababn56j90Ou1j801La8PT5
	 Rm5fOZzgUR5nMMdzJ4v7fBHTBI4jKaQJkRZUXQrwOTG7IqBbt5rA8nhIcqTvwGN/2GeK3
	 bEhWhAg0Z3hB/91ss0FtoUrZKs3r+Bv3pImxKV47vAOhTeUGPPm51jw6UeqCrjHrrNPmC
	 7YbrD87I96lMF2WYwGSrWYjn2yQjxvGT68GtEkPD4uxE5ToIH+zcH21IGZFpu2Hx8DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qaw1nbhT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.27
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B538C606A32C;
	Mon, 23 Nov 2026 23:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B538C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qaw1nbhT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOM0BVpvv28iP/8MOT6jA0fP0/Gjbnq3f2Jw1jKxmtSZgoyNPxexa3v/AF2iL3T/b4mSJEiQDIuuG/tjO7h46BU7AN8IZT2xCk8pibX7sxae52r0xa3ShVbWQLiMvZZYf7wKplFAwnwWrmuJeoSCDHbRZhSYEtOJDSmthCpVQ5Qa6h/HiY/DmZ6SDnQpQnuU1lim4PMWCsTBnLTeL4lOtsfrGm7oDytWxPYdUeRPUDXi4xfdqiqHX7AEdVpRegc0EcbZ9bkyneNn5CSvTrAEuK4oV77QG0l99ebUSPVLraWT5cc1bT8r/xnDIfvMjLeiusNzYi6MAudRTP7emWnq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhM3jrEjGwussC4IR5VEAGC5v941JS2pJ90H+TVo3MI=;
 b=orFKULracayOS00RV8hDLwukjGnQ1y17AnueXUD5kLQIPyuqsc5iiQ3JrWu9L+s8NAiRT5eAY0UH4Via2QTFdT+uiIqRYyvrDCWckujkZyHXDsSDmuMthMHJIH4EBNGyXyZC4kvLk5qjVaoH6/THmyzf5vF44l6Nwwn+vJZePAgIRoa4gAsgkbINga/Ykm0koF9YjvuAoc9XHV3o8V2yNHc+NXf5CJCiQYFVllLp1DOA5rIx6DEZhyNbFbqmVbF6OCyHuLLkaHn00JBB1c5u8JQBVcTL7XzIHw2OK18QvwytxPXJmX7WRwI79idWuwd9ioiwg44oECZ9Ulz2cbjqKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhM3jrEjGwussC4IR5VEAGC5v941JS2pJ90H+TVo3MI=;
 b=Qaw1nbhTG/TSZBcwL0RIxpbwnNgrTVKnd0I/f6btlYKPbqwKXmUgerfZOs3vrNJVJMUsad0s9MKRMWT9x8mzdW0UgY1CP5c2/hjZ0qXhIO/nISTXwBaWCkW0sGwzflc1IgDMsqXNLiq0Rf1GelxIMAM/ol/Z8wAGgt8XOySlEvbD3eyzIwOAhWRSnjPqEytJO2sDA9cpPK3EdeB8p3pbLNYBstc+mJCFr2NyTrbDBtRuFo2N0sdqO9tZy4ggsXsThAB/N4buM3aVSKJlZHWBN426K5Dw4k7tdL0QKoqKNxjZnG1dtknsA2upi01V+GPwLW3SZvvfs+Sak/nye4DwVw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:09:57 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:09:57 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: David Cemin <dcemin@nvidia.com>,
	Lucas De Marchi <ldemarchi@nvidia.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Mak <bmak@nvidia.com>
Subject: [PATCH v2 00/10] platform: dell: Move out of x86 and support Dell XPS 16 Creator Edition
Date: Mon, 23 Nov 2026 15:08:51 -0800
Message-ID: <20261123230905.13899-1-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MN0PR12MB5786.namprd12.prod.outlook.com
 (2603:10b6:208:375::13)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d0ab92-81ae-4d06-8112-08df49b6e3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|261102130727099003|10067099003|5023799004|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|261026121527099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	aWnIi65T1tAQkL0dykwRd2K0YeeMHyx6jmWB0PRHSD9cCzVSEGC7+s3CbJRv9fR6rE65loRLaAtSt6P3YYH10+eOE1yPiL6Zfc5Wfv7aOzdCV8PEKT+HW9EtHrEO2b32ywVtaf/lOsXPe/CoPQxBZQ1QoRpe7LmO8pQKWpT4CZgdarvISaq725/hS9enxB5KigmiWfLrjT36kkZr/8m28I4hT2oHtN1cTcd8LOAehkcaZta5NOzBxh0507mJkWrQIa0SP5x98J244SYusVrKiLLM5CvuZSt0gK0Jg1WP1LSDFlhFmLBspOaASwKULF3M1qKlkk1JEQaCgAzQ+b0R7wOYIm6WKU3lnDMxIJccLXG4QIJQ1CttPgzj9U8mJoe13pvYnE+V96J3whx8o/kDi5nEMzlGEqPlBLSYYEA4R4kKIYl6epBVk1tv2LOVp83DFXTmTmkOny9igfUEI4YEAk7DwEcyu9IGKyvIT5OF2olOK1ceuUe3YbndaGj5FW1kChZbNt7YW2O7s76vhZVWtKWvlm0xSqE/MpIxESxVdGcIPrKhlrvixYiuWGIxkyc982wDn3rAXOOAHOhyd+lyywCn08RjGh5om4sbOrOpz4ewZQR909SoKIURwz+wGymAtzJJ8YSZS8Jlpby0yA/PRQRif2qi7A599r371O8QxbY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(261102130727099003)(10067099003)(5023799004)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261026121527099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ac95qhFVGKOHHipqRMgeFqKFW+cKko4dH9KiihXui86I+k1+cklOm0JeMRr0?=
 =?us-ascii?Q?YljTT4EH4bb13dXbeARYlkUPVqhHIsKi7fwcSS6krg33XP678h+fMprgr9tD?=
 =?us-ascii?Q?luTX1In2f/qxLZ/BGosrLQcMAKFvAj7Bczsb2sV18zLA/UMETw6EpmXk1M/r?=
 =?us-ascii?Q?0hmWtepnr3jSFZpoO1fT+tL0rzMZplKdQmGn+AIKYGWsBduscOeDhZ6QWOdh?=
 =?us-ascii?Q?6xcApVjhsPM7XZrGRtDu6a8U2vbEEE0ahEceeDzPdNdKk+DsxFBIgzqQwF+E?=
 =?us-ascii?Q?TyWp/U6CNPqL8grdnUY9DSpdKyfSLIYbRolOiExIkw4t5zArm9JX7HhX+NKD?=
 =?us-ascii?Q?Ja9xXX+wqIEQmV4UDceSmfmBphuPKDjFtN4g6CW+w3638yPlvMxU4hp5xCUo?=
 =?us-ascii?Q?odDLOfSrix9++dB4lf5tRlmK7bH2Of6UeD/MboKITt4Rj1UC9YSh4IzNmypl?=
 =?us-ascii?Q?8Klf5hc79F/v2Ir3/tQ86iiMtW7/LYif8BKk0D6OSBONyMuorzuGPswJg5Qx?=
 =?us-ascii?Q?/BAHUiXrTxsF2QjFrv9rKjm9mpxxse51hpNhDt4GFOsFGXNjF2e7fF3M/ra3?=
 =?us-ascii?Q?LfF5IgC6esShvULEsK+dFVfLGDS9FJkud0SJ4/70JQ7EC5E8JUfF5XN8ubNY?=
 =?us-ascii?Q?cAvB5EcAdYOekRgtaOEB76edHwLCc7apPf7Ji3RZ+hPzyexnJe+XZde6u5Dv?=
 =?us-ascii?Q?pm9IJtqHtQZ75mrbSiw/6OqR7PYyBcMqhVS3k70E1J4wk7dFB/4n7EJLyWe0?=
 =?us-ascii?Q?JZ8CE5FKDL3GYah6WkwmNyW1YnPlN/tqSuv382QR2RjmQebN+gLqa9g9aRPL?=
 =?us-ascii?Q?4La9oR+Wl4EUhsSJS8YTyrKLdechHIhU/y6Mge/+tG1oPTxwv8GIMxwASryW?=
 =?us-ascii?Q?32PtNrJyuUxWmq/ESGli4Dd3JcWlyRsmujI5x5EvB0fsHq14MwAvJ0AJIjk8?=
 =?us-ascii?Q?l+AzwIA+kMcpeoeMp9n9gNOUXh119gl/l4AdIp6kMTmxqSIhV0YgI+YC2o3y?=
 =?us-ascii?Q?AuQr8odwKStrucQk90msqC7qtdODk4Q/1i05W8NEriNCHAI1MlP2H8FMqGyx?=
 =?us-ascii?Q?U6X9EDAnmdFU9KNvxhjsdhztZ5YaRb5GRIXe7INSe75aYjHAGZut+yEQWi2Y?=
 =?us-ascii?Q?zCov2fZji4qiDiGtv3Hqm/CSepL2Cs2KfoyeCBVn5e2dqQWk52nqk7eWF2gI?=
 =?us-ascii?Q?CiqsnPAqIc95ZgBzD+WJE3WpUsV2+5TMWqrHwne3yEYjg0IZvOvE7cfrtJrD?=
 =?us-ascii?Q?imt/aTQPCorTtRtPkM+Kvvb4OkcryO/0XN7jcd3nJDT2s4nGboRb6aY3rnVn?=
 =?us-ascii?Q?ZtdzH/wEbZ6ibLIs3RT2AOGcSCthEuo+9Rn+r3ZlrErFladTb2TxQEhDfucH?=
 =?us-ascii?Q?wEFOsWHnRaGQjp0SJL0omguvbJFaAAWjSENxPp5YuRonYVqUhG4HvTaAJoHG?=
 =?us-ascii?Q?FB4QxntCuTr5xHX7YrTcRBDi9lkh8mEDNMeKJvGkNrI2JOpCpyHw+hf05/KQ?=
 =?us-ascii?Q?JGB84k2CbnxikP5BPYppZV5KQ69uwLkB23RC7Rk6RqpBSSKoiE0yJ6DlVDI6?=
 =?us-ascii?Q?HT1ypp0ogOK3clbTlG2fLbsWzcoCwHHGnjJfwwi+cEdVz7M4lsc4Avhl+Uva?=
 =?us-ascii?Q?TCR7RVnORMGo7+BAe+9K5Hcaz61f4NoLjcBfJK2JJkkBEWpMn27oeNjnlZrn?=
 =?us-ascii?Q?Um7IAzLFa7ForH5goyx065kZbw0snH4rx5kXCIPU2zeYHle4IzXRlJ7mucVY?=
 =?us-ascii?Q?jvyeHqpKkA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d0ab92-81ae-4d06-8112-08df49b6e3fd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:09:56.9266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNTlpkqkf6CmNUwldgVvs2JcVTxa5S2EftcYyaOjpl24QvksRkk/I/3wesN/BbR8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

The Dell XPS 16 Creator Edition (DX16263) is an ARM64 laptop based on
NVIDIA RTX Spark. Its firmware exposes the same ACPI-WMI and SMBIOS
interfaces as Dell's x86 laptops, so existing Dell platform drivers
apply to it as-is. Today, they live under drivers/platform/x86/ and are
gated on X86_PLATFORM_DEVICES, so they can't be enabled on ARM64.

This series moves the Dell drivers to drivers/platform/dell/, makes the
ones that work there available on ARM64, and works around some firmware
quirks found on the Dell XPS 16 Creator Edition.

Patch 1 makes DELL_UART_BACKLIGHT depend on X86 before the move. The
driver relies on the DELL0501 handling in
acpi_quirk_skip_serdev_enumeration(), which only exists in
drivers/acpi/x86/utils.c, and on drivers/platform/x86/serdev_helpers.h.
Without that quirk, no serdev controller or platform device is created,
so the driver wouldn't work on other architectures.

Patch 2 fixes pre-existing kernel-doc warnings in dcdbas, which the
kernel test robot reported as new against v1 because of the rename.

Patches 3-4 move the drivers to drivers/platform/dell/, rename
X86_PLATFORM_DRIVERS_DELL to DELL_PLATFORMS (keeping the old symbol as a
transitional config so existing .configs carry over), and add a
MAINTAINERS entry for the new directory. The per-driver MAINTAINERS
entries are updated to the new paths. DCDBAS, DELL_RBU and
DELL_SMBIOS_SMM keep their X86 dependency.

Patches 5-6 make DELL_LAPTOP buildable without SERIO_I8042. Patch 5
compiles out dell-laptop's i8042 usage (the touchpad LED and the rfkill
event fallback) when SERIO_I8042 is disabled. When neither dell-rbtn nor
i8042 is available, it skips rfkill instead of failing to load. Patch 6
then relaxes the dependency to SERIO_I8042 || SERIO_I8042 = n.

Patch 7 fixes dell-smbios-wmi probe on the XPS 16 Creator Edition. The
current driver only accepts the misc BIOS flags structure (SMBIOS type
0xB1) at handle 0xB100, but the XPS 16 Creator Edition firmware numbers
its handles differently. The handle value is irrelevant, so match on the
type only.

Patches 8-10 handle a firmware problem on the same machine: the SMBIOS
calling interface completes every request to the Dell-proprietary
interface with all zeroes, even for requests that should fail. As a
result, dell-laptop reports bogus battery charge modes and thresholds
and registers mic mute/mute LEDs that do nothing, and dell-pc fails with
"platform_profile probe failed". Patch 8 adds a DMI quirk list and
exports dell_smbios_calls_functional(). Patches 9-10 make dell-laptop
and dell-pc refuse to load on affected platforms. dell-smbios itself
still loads, since dell-wmi depends on it.

Testing done:
- Build-tested x86-64 and arm64 with all Dell platform drivers enabled.
- Build-tested x86-64 with SERIO_I8042 disabled.
- Runtime-tested on Dell XPS 16 Creator Edition. Mic mute key is
  working.

Need help testing:
- x86 Dell laptops/desktops for regressions.

Outstanding issues (outside of this series):
- When spamming the keyboard backlight key, then pressing the mic mute
  key, the mic mute event is spammed. This is a multi-part issue between
  the EC and DSDT. I have a DSDT patch to fix this. I will be working
  with Dell to get it resolved.
- When the dell-wmi driver is not loaded and the keyboard backlight
  button is spammed, it will eventually stop working and FF-A
  notifications stop firing. This is likely an issue with the EC's event
  queue filling up and not notifying anymore after being full (since
  there's no consumers). I will be working with Dell to get this
  resolved too.

Changes in v2:
- New patch 2: add missing kernel-doc parameter descriptions to dcdbas.
  These W=1 warnings predate the series, but the kernel test robot
  reported them against the move in v1 because the path changed.
- New patch 5: compile out dell-laptop's i8042 usage (touchpad LED and
  rfkill event fallback) when SERIO_I8042 is disabled, and skip rfkill
  instead of failing to probe when neither dell-rbtn nor i8042 is
  available on Latitude and Precision models.
- Patch 6: reword the commit message. The dependency can now be optional
  because of patch 5. No code changes.
- Patch 7: drop the special handling of handle 0xB100 and match on SMBIOS
  type 0xB1 only.

v1: https://lore.kernel.org/lkml/20261121000556.173028-1-bmak@nvidia.com/T/#u

Brian Mak (10):
  platform/x86: dell: Make uart-backlight x86 only
  platform/x86: dell: dcdbas: Add missing kernel-doc descriptions
  platform: dell: Move out of x86 directory
  MAINTAINERS: Add Dell platform drivers entry
  platform: dell: laptop: Compile out i8042 usage without SERIO_I8042
  platform: dell: Allow DELL_LAPTOP to be arch-independent
  platform: dell: smbios-wmi: Fix probe on RTX Spark
  platform: dell: smbios: Add quirk for non-functional calling interface
  platform: dell: laptop: Don't load if SMBIOS calls are non-functional
  platform: dell: pc: Don't load if SMBIOS calls are non-functional

 .../admin-guide/laptops/alienware-wmi.rst     |  4 +--
 MAINTAINERS                                   | 36 +++++++++++--------
 drivers/platform/Kconfig                      |  2 ++
 drivers/platform/Makefile                     |  1 +
 drivers/platform/{x86 => }/dell/Kconfig       | 21 +++++++----
 drivers/platform/{x86 => }/dell/Makefile      |  4 +--
 .../{x86 => }/dell/alienware-wmi-base.c       |  0
 .../{x86 => }/dell/alienware-wmi-legacy.c     |  0
 .../{x86 => }/dell/alienware-wmi-wmax.c       |  0
 .../platform/{x86 => }/dell/alienware-wmi.h   |  0
 drivers/platform/{x86 => }/dell/dcdbas.c      | 11 +++++-
 drivers/platform/{x86 => }/dell/dcdbas.h      |  0
 .../{x86 => }/dell/dell-dw5826e-reset.c       |  0
 drivers/platform/{x86 => }/dell/dell-laptop.c | 23 +++++++++---
 .../platform/{x86 => }/dell/dell-lis3lv02d.c  |  0
 drivers/platform/{x86 => }/dell/dell-pc.c     |  3 ++
 drivers/platform/{x86 => }/dell/dell-rbtn.c   |  0
 drivers/platform/{x86 => }/dell/dell-rbtn.h   |  0
 .../{x86 => }/dell/dell-smbios-base.c         | 22 ++++++++++++
 .../platform/{x86 => }/dell/dell-smbios-smm.c |  0
 .../platform/{x86 => }/dell/dell-smbios-wmi.c |  2 --
 drivers/platform/{x86 => }/dell/dell-smbios.h |  1 +
 .../{x86 => }/dell/dell-smo8800-ids.h         |  0
 .../platform/{x86 => }/dell/dell-smo8800.c    |  0
 .../{x86 => }/dell/dell-uart-backlight.c      |  2 +-
 .../platform/{x86 => }/dell/dell-wmi-aio.c    |  0
 .../platform/{x86 => }/dell/dell-wmi-base.c   |  0
 .../platform/{x86 => }/dell/dell-wmi-ddv.c    |  0
 .../{x86 => }/dell/dell-wmi-descriptor.c      |  0
 .../{x86 => }/dell/dell-wmi-descriptor.h      |  0
 .../platform/{x86 => }/dell/dell-wmi-led.c    |  0
 .../{x86 => }/dell/dell-wmi-privacy.c         |  0
 .../{x86 => }/dell/dell-wmi-privacy.h         |  0
 .../{x86 => }/dell/dell-wmi-sysman/Makefile   |  0
 .../dell/dell-wmi-sysman/biosattr-interface.c |  0
 .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  0
 .../dell/dell-wmi-sysman/enum-attributes.c    |  0
 .../dell/dell-wmi-sysman/int-attributes.c     |  0
 .../dell/dell-wmi-sysman/passobj-attributes.c |  0
 .../dell-wmi-sysman/passwordattr-interface.c  |  0
 .../dell/dell-wmi-sysman/string-attributes.c  |  0
 .../{x86 => }/dell/dell-wmi-sysman/sysman.c   |  0
 drivers/platform/{x86 => }/dell/dell_rbu.c    |  0
 drivers/platform/x86/Kconfig                  |  2 --
 drivers/platform/x86/Makefile                 |  3 --
 .../x86/dell-uart-backlight-emulator/README   |  4 +--
 46 files changed, 100 insertions(+), 41 deletions(-)
 rename drivers/platform/{x86 => }/dell/Kconfig (95%)
 rename drivers/platform/{x86 => }/dell/Makefile (93%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-base.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-legacy.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-wmax.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi.h (100%)
 rename drivers/platform/{x86 => }/dell/dcdbas.c (97%)
 rename drivers/platform/{x86 => }/dell/dcdbas.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-dw5826e-reset.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-laptop.c (99%)
 rename drivers/platform/{x86 => }/dell/dell-lis3lv02d.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-pc.c (99%)
 rename drivers/platform/{x86 => }/dell/dell-rbtn.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-rbtn.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-base.c (97%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-smm.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-wmi.c (99%)
 rename drivers/platform/{x86 => }/dell/dell-smbios.h (98%)
 rename drivers/platform/{x86 => }/dell/dell-smo8800-ids.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-smo8800.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-uart-backlight.c (99%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-aio.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-base.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-ddv.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-descriptor.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-descriptor.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-led.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-privacy.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-privacy.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/Makefile (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/biosattr-interface.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/dell-wmi-sysman.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/enum-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/int-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/passobj-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/passwordattr-interface.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/string-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/sysman.c (100%)
 rename drivers/platform/{x86 => }/dell/dell_rbu.c (100%)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

