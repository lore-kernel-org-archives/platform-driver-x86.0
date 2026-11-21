Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795232021;
	b=tNaYYLdrUTTUlGrzaWTbNG26LhkSMoQnA/R7artxCy5eZJ0e3uvMeMVawC6mldC5qxAH
	 wZFpqUr1deaCer23bMgXnVNal9bDuNuco7aoVeyhMOezu3ckTpzs9aVzXIL3g8/CmpvSV
	 bJND6g9MPJqgoXyDLw5CGBsDx1aBPhSZrHp3rnq01UjbeDNT7t4y85W0utUXJ61gFYu6O
	 rcH6udtH0JXa2oZg50ZRI3dsK16IFBkuecSKTfGWeaTTiWGT/EPH7sMEIGA7hujs/Pnov
	 XUHNi0VCRWUbbS10Ev3if3n+lzs/1l08oMU2SOtcMpdHbmfZCMjbImEpMQSZHToZmEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232021;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EAPiZc7sNCcFBTNDAG6AnY4vBZ3prdVqwsVgCgcUQF4=;
	b=rQhenEHmGRonmrPLUa8VoS/3yL0MxQScitaUCKzoZ02nFvyLi9vel89NbJ03TBZY4+t2
	 iLG4G0xnlnJ/l8blYTu6vBigcFw+a0cPdH949H2guSs0PueHjo7Zgf5weg8qnS0SZl9rK
	 SkDdB8s3KJexeGh1B6iUv6yjFLLThI/iN7Zenp8jZlyTkQOzRWQwgBWUVpTjZeS540S4K
	 k/fTESciO8wPFJFSlDxR2LPoXI3FiB0/tS5JIS3CeJRJ7g7om0Xz602FSHzQJ3Zm1qnwm
	 nARIizHzKivXhrev8vFFlh8/fPDzyBCaXwwdhqt3gsSpfwExpIHKJcLF56AXMoU6y+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Az7a+10d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.16
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FEB606A6BA;
	Sat, 21 Nov 2026 03:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7FEB606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Az7a+10d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wo/xrS4rgsryEA1lu1fEzThS9ka5wF+MwrMZKj6EVifUr0k3Jgbp2IXU4KgFPprLGtkMuHabi4Lgwh32dH1U46gQ9q8QYE/uRcf4dMftVmY0iv8jeEPy/NxJxD+UwSD2Ch16IgsEcHSWmLlkWUYNPOIDNDDwev/d9I83TDdWtp5L9xzd+beUPUlNJPJVKe/ZkO/vTjGlQhTLJAN3Oj+Q4Hexh1Gd/MD93VuhFn+ZG7BbebHeW3wtW17s+kIOk/mBqufA1yhUVOHk5vKhlCkKgQVtVJdJczcTV1XI80x3gLwDQI8mC3YObNEyUjTKdcs+NigWhLOuAwFLZXgqSe1wlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAPiZc7sNCcFBTNDAG6AnY4vBZ3prdVqwsVgCgcUQF4=;
 b=ibbLr0m9XzmCoqJRs7G/uZjx4XpN1uJSuEnT0XT734uXWsn4LZG7fBUVM6YualwyDi8TD3UbBDBQeNC+jSz1oFVSGENSs0N30bQkTz0rxMO2dlEj3OUNncEDs3Fr6oscj6C1fSV1SvMx0PgTzTy1oihJxy3OG6mPevZmaftoSkXc6fX0lcLnylXq5ZyWs/5Md/8iTSLb0pr9bYaGEgdnEJIZS25aVz7T8wX/6E/jIUXgCT17g21S7iYNom6B82OVn1z6mvAVaFATetwd/PqDN2bo1KzzHwTXNNxjLgKPw0gVrO/kHCQCiCiux+GfGvi61FUFjwW87taCPQM6Tbo3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAPiZc7sNCcFBTNDAG6AnY4vBZ3prdVqwsVgCgcUQF4=;
 b=Az7a+10dGf4SNdl2B1q8NfXJ4S7KUkAsFkUzn2g/ix7i2MJniIuEN7Tm6IrunDdgIqcBgCNPRTJDkHcBLyYU8jCne+8FWgLLsadasjIq4Dqc67QPUlFSqWV0nLCfLINnLH9my+z9TA59jZZsnUsr6xQQ8fd4RI8HyGHYEkAEaIqFFZ/gBh45c1ExtxaIpRucsCQu8JeYZNiS2u78Eg1wo51M1/rb0OVlXtediowU8YAe06CTAlN6C6zllN1hfltXA+lvoBeuYFIMXviHutxVoUrxC7iwqakxa5jq8txRuNYsfKjvgujeM/j0JgYmv7YhlqlxW/6EJ/7HATEAet+wIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 03:33:31 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 03:33:31 +0000
From: David Cemin <dcemin@nvidia.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	xy-jackie@139.com,
	i@rong.moe,
	marco_giunta@outlook.it,
	ldemarchi@nvidia.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] platform: lenovo: add WMI Fn keys driver and use it from ideapad-laptop
Date: Fri, 20 Nov 2026 19:33:21 -0800
Message-ID: <20261121033322.974635-3-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121033322.974635-1-dcemin@nvidia.com>
References: <20261119022719.3089229-1-dcemin@nvidia.com>
 <20261121033322.974635-1-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::13) To CH0PR12MB5089.namprd12.prod.outlook.com
 (2603:10b6:610:bc::8)
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
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|DM4PR12MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: d70e28c2-e937-4898-d000-08df478036b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|4022899009|261022105027099003|10067099003|4143699003|5023799004|11063799006|56012099006|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261026121527099003|261021123027099003|261022113327099003|261102123227099003|261102130727099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	51N+r/B2o2KMLYmq9jiSgbwiiuDvkj3jNRCZNroeshQx9uRIoy65cKZ67f3B3Xx/zsnaecBzYRtGpy2Pw8XRU9Be8uZUN193N6wXP6vJ0LY6sqMeo7vqBKIloAbB5n0iDaUJ+ulz3u0/ekzSQ8c6c6/8CCsN/URPgbVYC1moMbE3y8f1L8qKaGb/puT8XdEplYRQOvSyZbEtGm00V6w1Jvw+8KenBS5aBiNpGDhV3gOMP+YOXqg6LsM7jC95eys2h2iPnZsUNZr42rEj5rxJcHAK/jwEihXT2ZfWXVGAvTTYXYyBTkUcIjCOnLei7dEHMLKgV/GHgv+VAUCZUJ6wuyF3TWWNI9hfQxYmBBHAseKhrSbioyfD7GE/z7QQ2sNQmMxeAGtsnpUMgCFW1SkECW+TDytZfhQ6FFQt+LAUbTj+JdLl3ASRexVqnP6QFIR60beug/zwzC2hIrXzI7NG8whyqStELol+DGBpckNdBRT5Y3wuxD6nHauEOvbsydLQdAbNr4J+XRkh1peEIPAZqDYNxWsKmG8Wk7ar6Ai3PfClp9ySeHcKoQ5PojFK/r48MjAKZOpH55e7yXpGWyXZk3gvHqVKNtqlDatjQDic3zIyslFOxuKYHmOwXZk+aer3BQBXEY8p7atObsVo+leZ0GsTcSwBj/WXF0wUoNy9Xe8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(4022899009)(261022105027099003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261026121527099003)(261021123027099003)(261022113327099003)(261102123227099003)(261102130727099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?14osL5JbAIsJymoNmTnnuQ6DaArv4p+ep+yhhTaS24vwLmJpmg8Atny4uvs1?=
 =?us-ascii?Q?MAfMDRijl+xgxCc2CR5G6JHEFsc529IlVKIKnSpJ+od50UWv0Vjn/bJyr0yg?=
 =?us-ascii?Q?onp3u1CRqB7vEXV2f1KbfZv9ieG/PH7xkzCSpVi3xtCl0iRV2aqjTZtb+1Vg?=
 =?us-ascii?Q?GxyBNzGL5evXDOv+puldrp1Tx4sJJtN1ewj94JcNghA4BmICufRZQ0XOc+J+?=
 =?us-ascii?Q?ZmVxHJFTueQfxo5V39/SW9nK2WYe8TNW4zU1+RNvwE1ZIUtnqXyMFrO3uY4X?=
 =?us-ascii?Q?rlq48Ru16Lbx4VSoWxmwYmc7MfWWO9gKutNFe7eCz6lb2/PVZiOFizQam3z2?=
 =?us-ascii?Q?jUWOyyhzq7bsl5bK+aNaJhiYcR/IV9U7RdZHoqZVreXBITMLbzzwiywqbtBW?=
 =?us-ascii?Q?HLtbMHgEl6nt932+EKJWiiUBYVdUe49GZj24RUm5FfRS939fQzVTT4HSuwKK?=
 =?us-ascii?Q?RHghkEn5sARSpcvKWvivPi+1P1FlOnXxbAu8U2/VLA5Kv4AMgQDGNsH13YFR?=
 =?us-ascii?Q?EtWC4fILVXCn9ZwRMqh7bTYuAXvrqNt+/gT1Z4R5EVEHYcUYhdgc55lJd9lF?=
 =?us-ascii?Q?oFdUWN7nn6e2zCbt+Wl2Ub39p9SBJheTjIXmvWPoxdq6/Um0C+rWCj5e3zq0?=
 =?us-ascii?Q?xz6toRat+5FE/lR8MCzrNDMY3TvP1/0g2X8FzNf7HrAhzJYzoI4gMtXIAqDn?=
 =?us-ascii?Q?IjZybwAsuynNMbmxClKQuWbcqqSI3JggfUPBG6WyUCL24AG8EG3Glep8CdC+?=
 =?us-ascii?Q?atC8J3cacU4WPcszLUvYC+oQq9fsv6bxgqd+N5z/nJyHboSaVIzFiYOYH7NG?=
 =?us-ascii?Q?z2pfHcGuz55wRGa6n481CTu0k/xtEleXe95tRwXpIScuazS8PUyoQ77YnCr6?=
 =?us-ascii?Q?zQW6bYBAcjrfg6AdQd7L4xQNDxNNRrTzoVceSBsCotqeifGXpe5uIm/R+N6d?=
 =?us-ascii?Q?8AL36VqL2WwPYdfFkAauL03IiI8rXfTlxqdrIPnGzXtrdSMHkSjuX42bxClG?=
 =?us-ascii?Q?cpM5W+WIw4TqiyKrf02aJwo/wrndGf2jc7ORl9GroEb5Ng9UdBqQMcGuAS68?=
 =?us-ascii?Q?6hyyw7MN07nyk26MgriEVr98E6wPyQn0rG/hEYyHqVEM0GMRyyv1GBgQJTwi?=
 =?us-ascii?Q?HN41vyM9vvvhkukj5uRTfeD/VoCsbUB1QpD8LpgEzLj98qcM01wwVtNgESeX?=
 =?us-ascii?Q?hONGo5owsXFBjmeU0uWQcEIiB/tms3SYrni3vigl2V/zDRnOu7zG6ogNOZGQ?=
 =?us-ascii?Q?9PKgRMnG23EpAgt/lmqpc0dkx3gt587hxCQgut0Bvm+U70o5g1BfksgGk1ay?=
 =?us-ascii?Q?A6Bccdn2dV1ajTXwhvvj14MFWjHAYJoIA30u1yXBtgX5ypZn/pPbpzj3H/Ql?=
 =?us-ascii?Q?YU78eEynAJCxPC5POrsfRT8PF14M8MVEf+s1Jk/65s+4Jg7m9XbTSlPPTkaJ?=
 =?us-ascii?Q?cguJTL/9WJB6UIgnE/CnP3NE5cVaYBFSICZlYo5FbD8DVcM8xWd2DQGI/B9v?=
 =?us-ascii?Q?DZw82v0b7eW0fAv8EWNtVs+t97r4lEuqqnu7tgPnIw1Dpb9GQ9n6G/QU0jRW?=
 =?us-ascii?Q?M+GR7Cbk1BkYSzwheGEHCtJ3jCK4SKEFdW7o/tLS4IaGLVHHcB0klRqO018C?=
 =?us-ascii?Q?K96HWV9zkwAHnJCyvV6bOBihXCDXhfhOCu7TlpmEqn5fmoIiJybkHBL4P2Mv?=
 =?us-ascii?Q?PHARzJpPtnVfFVcT0LIA/kgD3m8y+iMxuYoAPkPbxXaQPkrl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70e28c2-e937-4898-d000-08df478036b9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 03:33:31.1795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joq2J9QLWzhfi4WtCouwLgLOPVx/4jSfvOJrPW87Qqj9oZLQ0jX0dF2hN6CxU4PR515Px3e84d21fM+NKi7PfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522

Lenovo consumer laptops deliver their vendor specific Fn keys
(microphone mute, airplane mode, performance mode, the star key and
others) as WMI events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294, and
the older Yoga models report Fn+Esc on two event GUIDs that carry no
data. ideapad-laptop handles all of them today, but it is an x86 only
driver built on the VPC ACPI device and the i8042 controller, and the
new arm64 Lenovo laptops expose the Fn key GUID without any of that.

Add a Lenovo WMI Fn keys driver that owns the three event GUIDs on
every architecture and reports the keys through a sparse keymap. The
keymap, the scan codes (the Fn key codes offset by 0x100, Fn+Esc as
128) and the input device name are taken over from ideapad-laptop, so
the events userspace sees do not change and the existing hwdb mappings
keep applying. The one difference is 0x3d, which now reports
KEY_PERFORMANCE instead of KEY_PROG4. A notifier chain lets drivers
with platform knowledge act on an event before the key is reported and
suppress it with NOTIFY_STOP.

Make ideapad-laptop drop its WMI event driver and keymap entries and
subscribe to that notifier instead. The callback keeps the two platform
specific behaviours: it refreshes the Fn lock LED from the EC on every
Fn key event, and on the performance button it cycles the platform
profile through DYTC and consumes the event, as before. The notifier is
unregistered before the DYTC and LED teardown in remove() and on the
probe error paths. Both changes land in one patch because with the new
driver present but ideapad-laptop unchanged, both drivers would bind
the same WMI devices.

ideapad-laptop implies LENOVO_WMI_FN_KEYS so that existing
configurations keep the Fn keys on a config update, and uses
IS_REACHABLE() to tolerate the driver being a module while
ideapad-laptop is built in, in which case the keys are still reported
by the Fn keys driver and only the VPC specific handling is lost.

Tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone mute, airplane
mode, the Smart Key, the Smart Connect key and the Fn+Q performance key
report input events. The Esc event GUIDs are not exposed by that
firmware, so that path is compile tested only, as is ideapad-laptop.

Signed-off-by: David Cemin <dcemin@nvidia.com>
---
 MAINTAINERS                                   |   8 +
 drivers/platform/lenovo/Kconfig               |  15 +
 drivers/platform/lenovo/Makefile              |   1 +
 drivers/platform/lenovo/wmi-fn-keys.c         | 280 ++++++++++++++++++
 drivers/platform/x86/lenovo/Kconfig           |   2 +-
 drivers/platform/x86/lenovo/ideapad-laptop.c  | 227 +++-----------
 .../linux/platform_data/lenovo-wmi-fn-keys.h  |  32 ++
 7 files changed, 386 insertions(+), 179 deletions(-)
 create mode 100644 drivers/platform/lenovo/wmi-fn-keys.c
 create mode 100644 include/linux/platform_data/lenovo-wmi-fn-keys.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b0ad5a3debe..e2be0b7debeb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15173,6 +15173,14 @@ F:	Documentation/wmi/devices/lenovo-wmi-other.rst
 F:	drivers/platform/lenovo/
 F:	drivers/platform/x86/lenovo/*
 
+LENOVO WMI FN KEYS DRIVER
+M:	David Cemin <dcemin@nvidia.com>
+M:	Rong Zhang <i@rong.moe>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/lenovo/wmi-fn-keys.c
+F:	include/linux/platform_data/lenovo-wmi-fn-keys.h
+
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/lenovo/Kconfig b/drivers/platform/lenovo/Kconfig
index 8222322ca671..f67f7c811214 100644
--- a/drivers/platform/lenovo/Kconfig
+++ b/drivers/platform/lenovo/Kconfig
@@ -41,6 +41,21 @@ config LENOVO_WMI_HOTKEY_UTILITIES
 	  such as LED control for audio/mic mute event for Ideapad, YOGA, XiaoXin,
 	  Gaming, ThinkBook and so on.
 
+config LENOVO_WMI_FN_KEYS
+	tristate "Lenovo WMI Fn keys driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	help
+	  Say Y or M here to enable the vendor specific Fn keys (microphone
+	  mute, airplane mode, performance mode, star key, Fn+Esc, etc.) on
+	  Lenovo laptops that deliver them as WMI events. ideapad-laptop
+	  subscribes to this driver for its Fn lock LED and performance mode
+	  handling.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-wmi-fn-keys.
+
 config LENOVO_WMI_CAMERA
 	tristate "Lenovo WMI Camera Button driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/lenovo/Makefile b/drivers/platform/lenovo/Makefile
index 1cac115dd735..8ea207e79a43 100644
--- a/drivers/platform/lenovo/Makefile
+++ b/drivers/platform/lenovo/Makefile
@@ -8,6 +8,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
 lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
 lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+= wmi-capdata.o
 lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
+lenovo-target-$(CONFIG_LENOVO_WMI_FN_KEYS)	+= wmi-fn-keys.o
 lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
 lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
 lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+= wmi-other.o
diff --git a/drivers/platform/lenovo/wmi-fn-keys.c b/drivers/platform/lenovo/wmi-fn-keys.c
new file mode 100644
index 000000000000..330de9529a87
--- /dev/null
+++ b/drivers/platform/lenovo/wmi-fn-keys.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Lenovo WMI Fn keys driver
+ *
+ * Lenovo consumer laptops deliver their vendor specific Fn keys (microphone
+ * mute, airplane mode, performance mode, the star key and others) as WMI
+ * events on a dedicated GUID instead of keyboard usages, and the older Yoga
+ * models report Fn+Esc on two event GUIDs that carry no data. This driver
+ * owns these event GUIDs on every architecture and reports the keys through
+ * a sparse keymap. Drivers with platform knowledge, such as ideapad-laptop,
+ * subscribe to the notifier chain to act on an event and may stop the key
+ * from being reported.
+ *
+ * The keymap and the scan codes were moved here from ideapad-laptop, so the
+ * input events are the same as before for userspace.
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_data/lenovo-wmi-fn-keys.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include <asm/byteorder.h>
+
+#define LWMI_FN_KEYS_GUID	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
+#define LWMI_ESC_GUID_YOGA3	"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6"
+#define LWMI_ESC_GUID_YOGA700	"56322276-8493-4CE8-A783-98C991274F5E"
+
+/*
+ * Scan codes as ideapad-laptop reported them: the Fn key event codes are
+ * offset by LWMI_FN_KEY so they do not collide with the ACPI hotkeys of that
+ * driver, and the Fn+Esc events, which carry no data, use scan code 128.
+ */
+#define LWMI_FN_KEY		0x100
+#define LWMI_ESC_SCANCODE	128
+
+/**
+ * struct lwmi_fn_keys_info - per event GUID description
+ * @event: event type passed to the notifier chain
+ * @phys: physical path of the input device
+ * @event_size: size of the WMI event data, 0 when the GUID carries none
+ * @code: scan code base: the offset added to the event data, or the whole
+ *        scan code for GUIDs without event data
+ * @keymap: sparse keymap for the input device
+ */
+struct lwmi_fn_keys_info {
+	enum lwmi_fn_keys_event event;
+	const char *phys;
+	size_t event_size;
+	u32 code;
+	const struct key_entry *keymap;
+};
+
+struct lwmi_fn_keys {
+	struct input_dev *input;
+	const struct lwmi_fn_keys_info *info;
+};
+
+static BLOCKING_NOTIFIER_HEAD(lwmi_fn_keys_chain);
+
+static const struct key_entry lwmi_fn_keys_keymap[] = {
+	/* FnLock (handled by the firmware) */
+	{ KE_IGNORE,	0x02 | LWMI_FN_KEY },
+	/* Esc (handled by the firmware) */
+	{ KE_IGNORE,	0x03 | LWMI_FN_KEY },
+
+	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
+	{ KE_KEY,	0x01 | LWMI_FN_KEY, { KEY_FAVORITES } },
+	{ KE_KEY,	0x04 | LWMI_FN_KEY, { KEY_SELECTIVE_SCREENSHOT } },
+	/* Lenovo Support */
+	{ KE_KEY,	0x07 | LWMI_FN_KEY, { KEY_HELP } },
+	{ KE_KEY,	0x0e | LWMI_FN_KEY, { KEY_PICKUP_PHONE } },
+	{ KE_KEY,	0x0f | LWMI_FN_KEY, { KEY_HANGUP_PHONE } },
+	/* Refresh Rate Toggle (Fn+R) */
+	{ KE_KEY,	0x10 | LWMI_FN_KEY, { KEY_REFRESH_RATE_TOGGLE } },
+	/* Dark mode toggle */
+	{ KE_KEY,	0x13 | LWMI_FN_KEY, { KEY_PROG1 } },
+	/* Sound profile switch */
+	{ KE_KEY,	0x12 | LWMI_FN_KEY, { KEY_PROG2 } },
+	/* Lenovo Virtual Background application */
+	{ KE_KEY,	0x28 | LWMI_FN_KEY, { KEY_PROG3 } },
+	/* Lenovo Support */
+	{ KE_KEY,	0x27 | LWMI_FN_KEY, { KEY_HELP } },
+	/* Refresh Rate Toggle */
+	{ KE_KEY,	0x0a | LWMI_FN_KEY, { KEY_REFRESH_RATE_TOGGLE } },
+	/* Specific to some newer models */
+	{ KE_KEY,	0x3e | LWMI_FN_KEY, { KEY_MICMUTE } },
+	{ KE_KEY,	0x3f | LWMI_FN_KEY, { KEY_RFKILL } },
+	/* Star- (User Assignable Key) */
+	{ KE_KEY,	0x44 | LWMI_FN_KEY, { KEY_PROG1 } },
+	/* Eye */
+	{ KE_KEY,	0x45 | LWMI_FN_KEY, { KEY_PROG3 } },
+	/* Lenovo Smart Connect */
+	{ KE_KEY,	0x48 | LWMI_FN_KEY, { KEY_LINK_PHONE } },
+	/*
+	 * Performance toggle also Fn+Q, consumed by ideapad-laptop through the
+	 * notifier chain on machines where it cycles the platform profile
+	 */
+	{ KE_KEY,	0x3d | LWMI_FN_KEY, { KEY_PERFORMANCE } },
+	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile */
+	{ KE_KEY,	0x46 | LWMI_FN_KEY, { KEY_PROG4 } },
+	/* shift + prtsc */
+	{ KE_KEY,	0x2d | LWMI_FN_KEY, { KEY_SELECTIVE_SCREENSHOT } },
+	{ KE_KEY,	0x29 | LWMI_FN_KEY, { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_KEY,	0x2a | LWMI_FN_KEY, { KEY_ROOT_MENU } },
+
+	/*
+	 * WMI switches
+	 *
+	 * Some devices come with physical switches. Whenever a switch is
+	 * toggled, an WMI event is emitted to inform the software about the
+	 * switch's latest state.
+	 */
+
+	/* Camera switch */
+	{ KE_SW,	0x0c | LWMI_FN_KEY, .sw = { SW_CAMERA_LENS_COVER, 0 } },
+	{ KE_SW,	0x0d | LWMI_FN_KEY, .sw = { SW_CAMERA_LENS_COVER, 1 } },
+
+	{ KE_END }
+};
+
+static const struct key_entry lwmi_esc_keymap[] = {
+	{ KE_KEY,	LWMI_ESC_SCANCODE, { KEY_ESC } },
+	{ KE_END }
+};
+
+static const struct lwmi_fn_keys_info lwmi_fn_keys_info_fn_keys = {
+	.event = LWMI_FN_KEYS_EVENT_FN_KEY,
+	.phys = "wmi/input0",
+	.event_size = sizeof(u32),
+	.code = LWMI_FN_KEY,
+	.keymap = lwmi_fn_keys_keymap,
+};
+
+static const struct lwmi_fn_keys_info lwmi_fn_keys_info_esc = {
+	.event = LWMI_FN_KEYS_EVENT_ESC,
+	.phys = "wmi/input1",
+	.code = LWMI_ESC_SCANCODE,
+	.keymap = lwmi_esc_keymap,
+};
+
+/**
+ * lwmi_fn_keys_register_notifier() - Subscribe to the Fn key events.
+ * @nb: The notifier_block to register.
+ *
+ * The callback runs in process context with the &enum lwmi_fn_keys_event as
+ * the action and, for LWMI_FN_KEYS_EVENT_FN_KEY, a pointer to the u32 key
+ * code as the data. Return NOTIFY_STOP from the callback to consume the event
+ * so that no key is reported.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int lwmi_fn_keys_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&lwmi_fn_keys_chain, nb);
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_fn_keys_register_notifier, "LENOVO_WMI_FN_KEYS");
+
+/**
+ * lwmi_fn_keys_unregister_notifier() - Unsubscribe from the Fn key events.
+ * @nb: The notifier_block to unregister.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int lwmi_fn_keys_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&lwmi_fn_keys_chain, nb);
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_fn_keys_unregister_notifier, "LENOVO_WMI_FN_KEYS");
+
+static void devm_lwmi_fn_keys_unregister_notifier(void *data)
+{
+	lwmi_fn_keys_unregister_notifier(data);
+}
+
+/**
+ * devm_lwmi_fn_keys_register_notifier() - Device managed subscription.
+ * @dev: The device whose lifetime bounds the subscription.
+ * @nb: The notifier_block to register.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int devm_lwmi_fn_keys_register_notifier(struct device *dev, struct notifier_block *nb)
+{
+	int ret;
+
+	ret = lwmi_fn_keys_register_notifier(nb);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_lwmi_fn_keys_unregister_notifier, nb);
+}
+EXPORT_SYMBOL_NS_GPL(devm_lwmi_fn_keys_register_notifier, "LENOVO_WMI_FN_KEYS");
+
+static int lwmi_fn_keys_probe(struct wmi_device *wdev, const void *context)
+{
+	struct lwmi_fn_keys *priv;
+	int ret;
+
+	priv = devm_kzalloc_obj(&wdev->dev, *priv);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->info = context;
+
+	priv->input = devm_input_allocate_device(&wdev->dev);
+	if (!priv->input)
+		return -ENOMEM;
+
+	/*
+	 * Same name as the ideapad-laptop input device so that the existing
+	 * hwdb keyboard mappings for these keys keep applying.
+	 */
+	priv->input->name = "Ideapad extra buttons";
+	priv->input->phys = priv->info->phys;
+	priv->input->id.bustype = BUS_HOST;
+	priv->input->dev.parent = &wdev->dev;
+
+	ret = sparse_keymap_setup(priv->input, priv->info->keymap, NULL);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(&wdev->dev, priv);
+
+	return input_register_device(priv->input);
+}
+
+static void lwmi_fn_keys_notify(struct wmi_device *wdev, const struct wmi_buffer *buf)
+{
+	struct lwmi_fn_keys *priv = dev_get_drvdata(&wdev->dev);
+	const struct lwmi_fn_keys_info *info = priv->info;
+	u32 code = 0;
+	int ret;
+
+	if (buf->length < info->event_size) {
+		dev_dbg(&wdev->dev, "short event (%zu bytes)\n", buf->length);
+		return;
+	}
+
+	if (info->event_size)
+		code = le32_to_cpup(buf->data);
+
+	dev_dbg(&wdev->dev, "event %d code 0x%x\n", info->event, code);
+
+	ret = blocking_notifier_call_chain(&lwmi_fn_keys_chain, info->event, &code);
+	if (ret & NOTIFY_STOP_MASK)
+		return;
+
+	if (!sparse_keymap_report_event(priv->input, info->code | code, 1, true))
+		dev_info_ratelimited(&wdev->dev, "unknown key code 0x%x\n", code);
+}
+
+static const struct wmi_device_id lwmi_fn_keys_id_table[] = {
+	{ LWMI_FN_KEYS_GUID, &lwmi_fn_keys_info_fn_keys },
+	{ LWMI_ESC_GUID_YOGA3, &lwmi_fn_keys_info_esc },
+	{ LWMI_ESC_GUID_YOGA700, &lwmi_fn_keys_info_esc },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, lwmi_fn_keys_id_table);
+
+static struct wmi_driver lwmi_fn_keys_driver = {
+	.driver = {
+		.name = "lenovo-wmi-fn-keys",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = lwmi_fn_keys_id_table,
+	.probe = lwmi_fn_keys_probe,
+	.notify_new = lwmi_fn_keys_notify,
+	.no_singleton = true,
+};
+module_wmi_driver(lwmi_fn_keys_driver);
+
+MODULE_AUTHOR("David Cemin <dcemin@nvidia.com>");
+MODULE_DESCRIPTION("Lenovo WMI Fn keys driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 4d9a25d0e3b5..8a11c981241c 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -11,7 +11,7 @@ config IDEAPAD_LAPTOP
 	depends on SERIO_I8042
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	depends on ACPI_WMI || ACPI_WMI = n
+	imply LENOVO_WMI_FN_KEYS
 	select ACPI_PLATFORM_PROFILE
 	select INPUT_SPARSEKMAP
 	select NEW_LEDS
diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index f9453de6df76..92d05470dee9 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -34,7 +34,7 @@
 #include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
-#include <linux/wmi.h>
+#include <linux/platform_data/lenovo-wmi-fn-keys.h>
 #include "ideapad-laptop.h"
 
 #include <acpi/battery.h>
@@ -185,6 +185,7 @@ struct ideapad_private {
 	struct input_dev *inputdev;
 	struct backlight_device *blightdev;
 	struct ideapad_dytc_priv *dytc;
+	struct notifier_block fn_keys_nb;
 	struct dentry *debug;
 	struct acpi_battery_hook battery_hook;
 	const struct power_supply_ext *battery_ext;
@@ -1317,8 +1318,6 @@ static void ideapad_unregister_rfkill(struct ideapad_private *priv, int dev)
 /*
  * input device
  */
-#define IDEAPAD_WMI_KEY 0x100
-
 static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY,   7, { KEY_CAMERA } },
@@ -1331,65 +1330,6 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,  65, { KEY_PROG4 } },
 	{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
 	{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
-	{ KE_KEY, 128, { KEY_ESC } },
-
-	/*
-	 * WMI keys
-	 */
-
-	/* FnLock (handled by the firmware) */
-	{ KE_IGNORE,	0x02 | IDEAPAD_WMI_KEY },
-	/* Esc (handled by the firmware) */
-	{ KE_IGNORE,	0x03 | IDEAPAD_WMI_KEY },
-	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
-	{ KE_KEY,	0x01 | IDEAPAD_WMI_KEY, { KEY_FAVORITES } },
-	{ KE_KEY,	0x04 | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
-	/* Lenovo Support */
-	{ KE_KEY,	0x07 | IDEAPAD_WMI_KEY, { KEY_HELP } },
-	{ KE_KEY,	0x0e | IDEAPAD_WMI_KEY, { KEY_PICKUP_PHONE } },
-	{ KE_KEY,	0x0f | IDEAPAD_WMI_KEY, { KEY_HANGUP_PHONE } },
-	/* Refresh Rate Toggle (Fn+R) */
-	{ KE_KEY,	0x10 | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
-	/* Dark mode toggle */
-	{ KE_KEY,	0x13 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
-	/* Sound profile switch */
-	{ KE_KEY,	0x12 | IDEAPAD_WMI_KEY, { KEY_PROG2 } },
-	/* Lenovo Virtual Background application */
-	{ KE_KEY,	0x28 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
-	/* Lenovo Support */
-	{ KE_KEY,	0x27 | IDEAPAD_WMI_KEY, { KEY_HELP } },
-	/* Refresh Rate Toggle */
-	{ KE_KEY,	0x0a | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
-	/* Specific to some newer models */
-	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
-	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
-	/* Star- (User Assignable Key) */
-	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
-	/* Eye */
-	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
-	/* Lenovo Smart Connect */
-	{ KE_KEY,	0x48 | IDEAPAD_WMI_KEY, { KEY_LINK_PHONE } },
-	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
-	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
-	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile */
-	{ KE_KEY,	0x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
-	/* shift + prtsc */
-	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
-	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
-	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
-
-	/*
-	 * WMI switches
-	 *
-	 * Some devices come with physical switches. Whenever a switch is
-	 * toggled, an WMI event is emitted to inform the software about the
-	 * switch's latest state.
-	 */
-
-	/* Camera switch */
-	{ KE_SW,	0x0c | IDEAPAD_WMI_KEY, .sw = { SW_CAMERA_LENS_COVER, 0 } },
-	{ KE_SW,	0x0d | IDEAPAD_WMI_KEY, .sw = { SW_CAMERA_LENS_COVER, 1 } },
-
 	{ KE_END },
 };
 
@@ -2297,49 +2237,24 @@ static int ideapad_check_features(struct ideapad_private *priv)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_ACPI_WMI)
+#if IS_REACHABLE(CONFIG_LENOVO_WMI_FN_KEYS)
 /*
- * WMI driver
+ * The vendor specific Fn keys arrive as WMI events owned by the Lenovo WMI
+ * Fn keys driver, which reports them as input events. Subscribe to act on the
+ * ones that touch the VPC state: the Fn lock LED and the performance mode
+ * button, which cycles the platform profile through DYTC instead of
+ * reporting a key.
  */
-enum ideapad_wmi_event_type {
-	IDEAPAD_WMI_EVENT_ESC,
-	IDEAPAD_WMI_EVENT_FN_KEYS,
-};
-
-struct ideapad_wmi_private {
-	enum ideapad_wmi_event_type event;
-};
-
-static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
+static int ideapad_fn_keys_notify(struct notifier_block *nb, unsigned long event,
+				  void *data)
 {
-	struct ideapad_wmi_private *wpriv;
+	struct ideapad_private *priv = container_of(nb, struct ideapad_private, fn_keys_nb);
+	u32 code;
 
-	wpriv = devm_kzalloc_obj(&wdev->dev, *wpriv);
-	if (!wpriv)
-		return -ENOMEM;
-
-	*wpriv = *(const struct ideapad_wmi_private *)context;
-
-	dev_set_drvdata(&wdev->dev, wpriv);
-	return 0;
-}
-
-static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
-{
-	struct ideapad_wmi_private *wpriv = dev_get_drvdata(&wdev->dev);
-	struct ideapad_private *priv;
-
-	guard(mutex)(&ideapad_shared_mutex);
-
-	priv = ideapad_shared;
-	if (!priv)
-		return;
-
-	switch (wpriv->event) {
-	case IDEAPAD_WMI_EVENT_ESC:
-		ideapad_input_report(priv, 128);
+	switch (event) {
+	case LWMI_FN_KEYS_EVENT_ESC:
 		break;
-	case IDEAPAD_WMI_EVENT_FN_KEYS:
+	case LWMI_FN_KEYS_EVENT_FN_KEY:
 		if (priv->features.set_fn_lock_led) {
 			int brightness = ideapad_fn_lock_get(priv);
 
@@ -2349,72 +2264,44 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
 			}
 		}
 
-		if (data->type != ACPI_TYPE_INTEGER) {
-			dev_warn(&wdev->dev,
-				 "WMI event data is not an integer\n");
-			break;
-		}
-
-		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
-			data->integer.value);
+		code = *(u32 *)data;
+		dev_dbg(&priv->platform_device->dev, "WMI fn-key event: 0x%x\n", code);
 
-		/* performance button triggered by 0x3d */
-		if (data->integer.value == 0x3d && priv->dytc) {
-			platform_profile_cycle();
+		switch (code) {
+		case 0x3d:
+			/* performance button */
+			if (priv->dytc) {
+				platform_profile_cycle();
+				return NOTIFY_STOP;
+			}
+			break;
+		case 0x02:
+		case 0x03:
+			/* 0x02 FnLock, 0x03 Esc */
+			ideapad_fn_lock_led_notify(priv, code == 0x02);
 			break;
 		}
-
-		/* 0x02 FnLock, 0x03 Esc */
-		if (data->integer.value == 0x02 || data->integer.value == 0x03)
-			ideapad_fn_lock_led_notify(priv, data->integer.value == 0x02);
-
-		ideapad_input_report(priv,
-				     data->integer.value | IDEAPAD_WMI_KEY);
-
 		break;
 	}
-}
 
-static const struct ideapad_wmi_private ideapad_wmi_context_esc = {
-	.event = IDEAPAD_WMI_EVENT_ESC
-};
-
-static const struct ideapad_wmi_private ideapad_wmi_context_fn_keys = {
-	.event = IDEAPAD_WMI_EVENT_FN_KEYS
-};
-
-static const struct wmi_device_id ideapad_wmi_ids[] = {
-	{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc }, /* Yoga 3 */
-	{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc }, /* Yoga 700 */
-	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys }, /* Legion 5 */
-	{},
-};
-MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
-
-static struct wmi_driver ideapad_wmi_driver = {
-	.driver = {
-		.name = "ideapad_wmi",
-	},
-	.id_table = ideapad_wmi_ids,
-	.min_event_size = sizeof(u32),
-	.probe = ideapad_wmi_probe,
-	.notify = ideapad_wmi_notify,
-};
+	return NOTIFY_OK;
+}
 
-static int ideapad_wmi_driver_register(void)
+static int ideapad_fn_keys_register(struct ideapad_private *priv)
 {
-	return wmi_driver_register(&ideapad_wmi_driver);
+	priv->fn_keys_nb.notifier_call = ideapad_fn_keys_notify;
+
+	return lwmi_fn_keys_register_notifier(&priv->fn_keys_nb);
 }
 
-static void ideapad_wmi_driver_unregister(void)
+static void ideapad_fn_keys_unregister(struct ideapad_private *priv)
 {
-	return wmi_driver_unregister(&ideapad_wmi_driver);
+	lwmi_fn_keys_unregister_notifier(&priv->fn_keys_nb);
 }
-
-#else
-static inline int ideapad_wmi_driver_register(void) { return 0; }
-static inline void ideapad_wmi_driver_unregister(void) { }
-#endif
+#else /* CONFIG_LENOVO_WMI_FN_KEYS */
+static inline int ideapad_fn_keys_register(struct ideapad_private *priv) { return 0; }
+static inline void ideapad_fn_keys_unregister(struct ideapad_private *priv) { }
+#endif /* CONFIG_LENOVO_WMI_FN_KEYS */
 
 /*
  * ACPI driver
@@ -2496,6 +2383,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 			dev_info(&pdev->dev, "DYTC interface is not available\n");
 	}
 
+	err = ideapad_fn_keys_register(priv);
+	if (err)
+		dev_warn(&pdev->dev, "Could not subscribe to the WMI Fn key events: %d\n", err);
+
 	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
 		err = ideapad_backlight_init(priv);
 		if (err && err != -ENODEV)
@@ -2527,6 +2418,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	ideapad_backlight_exit(priv);
 
 backlight_failed:
+	ideapad_fn_keys_unregister(priv);
 	ideapad_dytc_profile_exit(priv);
 
 	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
@@ -2556,6 +2448,7 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
 				   ideapad_acpi_notify);
 
 	ideapad_backlight_exit(priv);
+	ideapad_fn_keys_unregister(priv);
 	ideapad_dytc_profile_exit(priv);
 
 	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
@@ -2600,31 +2493,9 @@ static struct platform_driver ideapad_acpi_driver = {
 	},
 };
 
-static int __init ideapad_laptop_init(void)
-{
-	int err;
-
-	err = ideapad_wmi_driver_register();
-	if (err)
-		return err;
-
-	err = platform_driver_register(&ideapad_acpi_driver);
-	if (err) {
-		ideapad_wmi_driver_unregister();
-		return err;
-	}
-
-	return 0;
-}
-module_init(ideapad_laptop_init)
-
-static void __exit ideapad_laptop_exit(void)
-{
-	platform_driver_unregister(&ideapad_acpi_driver);
-	ideapad_wmi_driver_unregister();
-}
-module_exit(ideapad_laptop_exit)
+module_platform_driver(ideapad_acpi_driver);
 
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_DESCRIPTION("IdeaPad ACPI Extras");
+MODULE_IMPORT_NS("LENOVO_WMI_FN_KEYS");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/lenovo-wmi-fn-keys.h b/include/linux/platform_data/lenovo-wmi-fn-keys.h
new file mode 100644
index 000000000000..4a737990b184
--- /dev/null
+++ b/include/linux/platform_data/lenovo-wmi-fn-keys.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Lenovo WMI Fn keys driver, notifier interface for drivers that want to act
+ * on the vendor specific Fn key events before a key is reported.
+ */
+
+#ifndef _LENOVO_WMI_FN_KEYS_H_
+#define _LENOVO_WMI_FN_KEYS_H_
+
+struct device;
+struct notifier_block;
+
+/**
+ * enum lwmi_fn_keys_event - notifier chain actions
+ * @LWMI_FN_KEYS_EVENT_ESC: Fn+Esc from one of the Esc event GUIDs, which
+ *                          carry no event data
+ * @LWMI_FN_KEYS_EVENT_FN_KEY: a key from the Fn key event GUID, the notifier
+ *                             data points to the u32 key code
+ *
+ * A callback that handles the event itself returns NOTIFY_STOP to suppress
+ * the input report; NOTIFY_OK or NOTIFY_DONE let it through.
+ */
+enum lwmi_fn_keys_event {
+	LWMI_FN_KEYS_EVENT_ESC,
+	LWMI_FN_KEYS_EVENT_FN_KEY,
+};
+
+int lwmi_fn_keys_register_notifier(struct notifier_block *nb);
+int lwmi_fn_keys_unregister_notifier(struct notifier_block *nb);
+int devm_lwmi_fn_keys_register_notifier(struct device *dev, struct notifier_block *nb);
+
+#endif /* _LENOVO_WMI_FN_KEYS_H_ */
-- 
2.56.1

