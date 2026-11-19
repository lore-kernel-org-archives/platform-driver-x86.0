Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795055250;
	b=y0tSZRNaisZioOn0dMIvBFmGZ9c6Gybly/c+IukyNxJksLEXRs3mR+MSIzArupEXE1/A
	 fqWRUL2SSgEZPbb9gGXawVdJDEzNKlzaLc6rEuUcLanurkia6kfIsHwIVSqlPhNhj4BwD
	 ECArAmrp19SoOZ/B+B9Pj6Qm9pKgNGX0cZ+G6NG2DJyYs5gdCfcPHwwjV5k8hFEqleKM7
	 OSEh0xe9QXwPWlX5vLLEMRqrl8HJFyX1rFknYC4NnEVpoNj/VoDFU3XZZmt3tENEn9aif
	 PZriFROk4jPjdaJSBoMeVPvSqPUudTMNiO7uQbcelqWRedqDKdNQ/givm9SiDRIZi9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055250;
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
	bh=XMryFI9xsqcJ0iNzaucgmKhdOKfs9Q2sYQW+fP33Fs0=;
	b=R0kmeFNblPH46bMqwQL2yvOiwoVbMhwuiYWWUReWwvMCQKas6B5YieCaiDhNXDDJGaAQ
	 K1e5HJTbXRHZc/ISTfqPm7DmOwTKUrCqZT05q8jaxTxsDQ/QWuHAsD3RLJqeRMuR13B94
	 fAkolwHVR0Ff3ujlhrPONXXqcbu9rW084Nv0/ier7x4rcD9+Ffd/BV7txpMKSwDGdi1/R
	 Y+LjulSFc03cc6O+RSSjDfeVx7FezBdwRztN/PWitCoVJ8fqr42a7Z4U/cVZMf80c/lDJ
	 Ulglk24DVPDZhq58vg6oaukzpTU/xwRf40XV41rlnA1gCZktOIfNwyeFc5dXequY7Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AVMWVlg7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.50
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F72606A320;
	Thu, 19 Nov 2026 02:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F72606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AVMWVlg7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/GrjueZ+VSvfc3OnlgmGCSWBc+npY63PK+Vd5UsbfUXk3uVy15TiePtCp6ZSGcw6SOCAQTmA8x8JJ6w7HM3hYekSzecKFE+IQ5vp7WYyHRB1EpIiPfrH/kq8KIL/RPgRvyfL3VCIa7l4h7l28iKANDVh/boImPLIzXwtxAur9qW2KohhCD2Qy2MR3vhKwbgwuQSvZRgJM0BVfFHSRwQgaF0bHtS5AOA8dWV01gBj2qpdmrYg6PvfbXAv49dnhzVn7+Qdc4ElOdC9QJt8dsC7C+hPfn6DzxnyQLop9h71JSRk5g2I3ixdfs0udqgRMUtoTK8dWCNflru7Xt+N1tUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMryFI9xsqcJ0iNzaucgmKhdOKfs9Q2sYQW+fP33Fs0=;
 b=Y11UUj+Y441fXMNTzSNQBC8A+Rhsn8e/tIQ92uOZsovHHm0Yjlxy7q2MZNfUT0Ibt1J7LJiW5MdWvyZbOz5webdnsFEaC2hF6O+3R4JLvowbFZGzRhUy5cCg5d2E1x8RWz3gOSIhdkpAJTyA0KrlK+EkV7soUm3guorNPFRY4bc0IqpOemb+z+3afewQOdveKYz/fa9w5MovFQmTwocKf2AKbbl16GdjuqPRqZ+cvYe9OFF8vu+HoxN3B35yF3XrlDuTQYH/gGDzMcRBQ9rtXUiqQ18fvQCMy0fvw/GBtAoAc7T960JxvrWadsvBK0ppOK9cs2VSzIMjVF4SlkppaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMryFI9xsqcJ0iNzaucgmKhdOKfs9Q2sYQW+fP33Fs0=;
 b=AVMWVlg7ginncybGc76TNfMHL19TCWmwaBXdbAqFDd4xtSH8fXJnfub2NuX2yXzt/oR4I76jX3YMc8hKyNHJK4ADnGV6glq7bexB968maXaMJc4sFRp42XhpH+PUU6/5zwjbHior6ATZJ+r3FG7/7A6A13mvM5VTJYQnnZm1L6ROc5IveqmLZD4LGpRbb2VMccuKENTx9Mh2l3zYw0qaAVl8hfDHLMFHyEx0/qzmqnF95YBL/XlsiZW39h/eUvrQ0JKCPY1PgyEEEmYCMrdIgn8X/1bIwjc+hUdXGxzg+o4cP66g4H7yyfaBzkiRz0lWpCaVjX6vdwUwX1E5ggbfyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:27:26 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 02:27:26 +0000
From: David Cemin <dcemin@nvidia.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	xy-jackie@139.com,
	ikepanhc@gmail.com,
	i@rong.moe,
	marco_giunta@outlook.it,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ldemarchi@nvidia.com
Subject: [PATCH v2 0/3] platform: lenovo: architecture independent home for the Lenovo WMI drivers
Date: Wed, 18 Nov 2026 18:27:16 -0800
Message-ID: <20261119022719.3089229-1-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113222755.1696567-1-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:303:16d::13) To CH0PR12MB5089.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c3a3db-25fd-47f8-c575-08df45e4a688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	etTicZPhuHFwHHU0Z3R/HUYlM+Asxu5IHLAORMIb0HJumntv1+C4hSBlgD1ANLEgW4d1WFl+t0MOu23JP6oAWHt6yU1rILGi8oXkJqwGj4HSRVaBmlFi5Vq6skV2sDXsVUg4AP+vFOD2GL0JvrCMS05pvs/8f3SLwkV7osa+d0Njl2ZDqYU2zII5K/yYgFDjwe17ci5qowAJ/B36ujktgRzMmmFON7HkfS4lATqID6veSihVIjKse7oD2SwiyeXVNuJpAr+Gh21Xli8n/HO7mGwF2BXd5aR7RrixDOor3l1fqnxnUMlnj10uT+oAjP7jPvxGzKYbz+DneMNwd7okVtd3hMFX5IHrA6A88tZqE2aygiQtZ9PuWn0FaJx6ib+sZ0J+Qr/JoV/wMnLfIKgNfmUIhDI/pTE0a718V9lFHK1qk8T6JXjkss6bXKc7H1aZ9HfxW9Wz/sy5Vrku4+xxLjuYJZIcg3jqMVO/vmniYZ8b53wK+JCbYt3FqOtpUcFEIObQIWe3glejDc+uwGizkEGxJsleiZnhTRktBoZLcSunDzIeosN1RGI1KWacwNpVy2gKlHhexYlcvOqax+EKFrZ1kio2crYatQ3W7XnnhK5QZLiT799KHnn3Xj/CrjB3WL1TBS1aqpQN4lwfgogz0kb4oct2t4Zu3fZQrfQQPCc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C+zGoW6BbImryN2Uc5ffoabCyjUgYxwptmi47epB5Ml4l+l77TcNoIDUcSwC?=
 =?us-ascii?Q?uUT+c1zxU9vWg9mf/NNmY7mnHQ5sTMUgRKDJKI68dUrA3m/zkkqlygENY9Qr?=
 =?us-ascii?Q?/WSkGqAvXGbA95sIGY58t617mDRJ2JSIvRw92MOB2dTgq04ww2/3GdKIZdIT?=
 =?us-ascii?Q?oCq/hPEbBYh59heVkiPJNHFfoZtcgYt3GQ+pzl7u6BgjYvkXiarHS3zHNoIA?=
 =?us-ascii?Q?706nHbkhKREOor9FxSz1/Bje7rTe+je1e70wLRkC7JFTekNi0dFFS0ubk+gq?=
 =?us-ascii?Q?Qc44LZdK3JevwC6jOs4X6e5Glg0q7SIuQykgIeSunsriMqE2DW9dnibWNGHY?=
 =?us-ascii?Q?b2uTxNhyqfJ153ArUMAglrIfWQYNBxceXo13vuLGWgPhyFEGCIEfkqnaTGOm?=
 =?us-ascii?Q?xoWqRgh1sXFVLs7t2If8d7JUA+ZN/40fiUsjkF+u/xRwIG0wkPo9ln28p2Of?=
 =?us-ascii?Q?/8CKV7ZcMpF2V3qtYzGWOgd+nMsDWytM8R7ppRcP1NXh/oyDNIbGe9EPA2dI?=
 =?us-ascii?Q?C2X8Lx/29wqqFWmygEuiFcd5p8UP5k8gG/q/yFsk5rmDRHbrPci2MjoCtmqm?=
 =?us-ascii?Q?LM6KYCFPZS85kd33hqzrZtpSwP4AZCM8CirCCCNImn8rc+UenQcBrsI6XUvu?=
 =?us-ascii?Q?KFyF7WwYeW/N5fxrSXLAFIeDU7feyuFL03Dgpx44ddT8Jzd3mgQsgvMHwWdm?=
 =?us-ascii?Q?tjg8MIKZadX9VOJESEsrRmCaoOHOFpd1mUZUtlcEkJ9Fj8POGICs+jz0fYSt?=
 =?us-ascii?Q?fCuyoExsOzW90uQHGyfiGrQW4ZSuBCKIVhlit6DprGe/qxlN1HIsg4Dndorn?=
 =?us-ascii?Q?PW2DD94CA+iJqaGRBCYYSos0G5IXuqqEuNFLyeSwW9Eq5/GK3/bgVbPsyfaw?=
 =?us-ascii?Q?7PK1VhYzH+BSJmgXhyMiVhXR+zqknKtabDN1dFDmGeas06aka8dg2EWM52NE?=
 =?us-ascii?Q?UqcAREZExdvIpYrHE6OsCH1eljlOELFIMRm9ZJjKQpDFeMx66kS58uvcqMq5?=
 =?us-ascii?Q?RNRBV3ca4Ui17DSTA1k9s2ZywwAoCZd/FQYLrwPxZgXemyvC6riQyapbB61o?=
 =?us-ascii?Q?N941PCSzNO9iY2j1wjwv5+bnFBG2VXAruefpoO0VGExKLFE7bQ7/tPLb/77U?=
 =?us-ascii?Q?5w6Ep7ZtBuuQf8SUFM2ScCIwjc3ld5sqJ0r7St/Yy0a0YFLcDhNo/CHQXoHR?=
 =?us-ascii?Q?fpIzLY9jy5alWT9wNO4rJ0wWN57GgvIjcVYxY/qytV5mQ+cr1Dfhj2/y6acU?=
 =?us-ascii?Q?gpmZ2IbfUQkgiT9MQ/9Siw8mN+JgwjcqTsE++/vgKMiBOVBLaSQQ1WgfUGY9?=
 =?us-ascii?Q?pgsvQe+kLv2ofFQfef8Po4x7ZY66Cl0CtB8BepVpnpfezuX60orl+rbbXEOP?=
 =?us-ascii?Q?ThkJW9MSWE2eJP5zRcpgMJNN8fD1/edg6kjycceH8pNS3tUOw9c7nzpvcBVN?=
 =?us-ascii?Q?Fwjnh8IDPGXNaGbqpGHtEWfQCJcFsjYIAjFPPcLuiInjNATWK3Mf1rMdZ/Z0?=
 =?us-ascii?Q?NF05pRb0fd8WoXCd8LEGIa8QhYxmLZvAqUy/jz9qu7zAhg70IIUywAgl4ibz?=
 =?us-ascii?Q?/qUkG6rF0NVNuIMhFh6wj3CoyuMDUZ/R3C0z7Z8WrRpiKKmCs8OzBnpDTcvD?=
 =?us-ascii?Q?nv6s7rtiHAfYx7LoDugWYuMvxGo/9i6QqjOH4FLiMme+NIzARU2gUn3P4YGd?=
 =?us-ascii?Q?RhMLw0KKUHBLtJrIv0b+oFhiwIdQRb36uyNy7LdPKPL3YBFOKmn0x3uv9993?=
 =?us-ascii?Q?RwVCeE3ztw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c3a3db-25fd-47f8-c575-08df45e4a688
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:27:26.0904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfKAR1s2x7AlQ0MhtTSOY8+5zBn6DRodCHY3HjEr4Xav3AVGyevkGB9OXqM822NBSXIgCmTfAX0kvRLDVU95eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174

Lenovo now ships ACPI based arm64 laptops whose firmware exposes the
same ACPI-WMI interfaces as the x86 IdeaPad and Legion machines: the Fn
key event GUID consumed by ideapad-laptop, the hotkey utility GUID used
for the microphone mute LED, and the GameZone, Other Mode and capability
data GUIDs behind the thermal operation modes. Since 884d53763d30
("platform/wmi: Remove dependency on CONFIG_X86") the ACPI-WMI core
builds on arm64, but the Lenovo WMI drivers still live under
drivers/platform/x86, which is gated by X86_PLATFORM_DEVICES.

This series:
  1. moves the architecture independent Lenovo WMI drivers into a new
     drivers/platform/lenovo directory, following drivers/platform/surface;
     ideapad-laptop, thinkpad_acpi, think-lmi and the Yoga tablet drivers
     stay under x86 because they need i8042, port I/O or x86 only devices;
  2. adds a WMI hotkeys driver that owns the Fn key and Fn+Esc event
     GUIDs on every architecture, reports the keys through a sparse
     keymap and offers a notifier chain to drivers with platform
     knowledge;
  3. makes ideapad-laptop drop its WMI event driver and subscribe to
     that notifier instead, keeping its Fn lock LED and DYTC performance
     mode handling.

The series applies on top of Rong Zhang's "platform/x86: ideapad-laptop:
Trigger the EC on YMC events" (20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe)
because both touch the ideapad-laptop WMI code and that series
modernizes the lenovo-wmi-events helper.

Patch 2 was tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone
mute, airplane mode, the Smart Key, the Smart Connect key and the Fn+Q
performance key report input events. The Fn+Esc GUIDs are not exposed
by that firmware. Patch 3 is compile tested on x86_64 only, I do not
have an x86 IdeaPad; a test on a Yoga 3 or Yoga 700 (Fn+Esc) and on a
machine where ideapad-laptop handles the Fn lock LED or DYTC would be
appreciated.

Changes in v2:
  - dropped the WMI core Kconfig patch, 884d53763d30 covers it (Armin)
  - wmi-hotkeys: notify_new with the wmi_buffer, devm_kzalloc_obj, drvdata
    set before input registration, KEY_PERFORMANCE for 0x3d (Armin)
  - wmi-hotkeys: notifier chain called before the keymap lookup,
    NOTIFY_STOP suppresses the key (Hans, Armin); input device named like
    the ideapad-laptop one so the hwdb mappings keep applying (Hans)
  - wmi-hotkeys: camera lens cover switch events moved here with the
    rest of the Fn key GUID handling
  - the VPC guard patch is replaced by ideapad-laptop subscribing to the
    notifier and dropping its own Fn key WMI driver and keymap entries
  - wmi-hotkeys: the Fn+Esc event GUIDs move here as well, so that
    ideapad-laptop registers no WMI event driver at all (Armin); they
    carry no data and are reported under code 128 as before
  - commit message: 0x48 (Smart Connect) was already KEY_LINK_PHONE in
    ideapad-laptop since ccc8c8481c1f, the keymap follows it (Marco Giunta)
  - collected Mark's and Jackie's Reviewed-by on patch 1

David Cemin (3):
  platform: lenovo: move the architecture independent WMI drivers out of
    x86
  platform: lenovo: add WMI hotkeys driver
  platform/x86: ideapad-laptop: consume the Fn key events from the WMI
    hotkeys driver

 MAINTAINERS                                   |  10 +-
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/lenovo/Kconfig               | 101 ++++++++
 drivers/platform/lenovo/Makefile              |  23 ++
 .../platform/{x86 => }/lenovo/wmi-camera.c    |   0
 .../platform/{x86 => }/lenovo/wmi-capdata.c   |   0
 .../platform/{x86 => }/lenovo/wmi-capdata.h   |   0
 .../platform/{x86 => }/lenovo/wmi-events.c    |   0
 .../platform/{x86 => }/lenovo/wmi-events.h    |   0
 .../platform/{x86 => }/lenovo/wmi-gamezone.c  |   0
 .../platform/{x86 => }/lenovo/wmi-helpers.c   |   0
 .../platform/{x86 => }/lenovo/wmi-helpers.h   |   0
 .../{x86 => }/lenovo/wmi-hotkey-utilities.c   |   0
 drivers/platform/lenovo/wmi-hotkeys.c         | 244 ++++++++++++++++++
 drivers/platform/{x86 => }/lenovo/wmi-other.c |   0
 drivers/platform/x86/lenovo/Kconfig           |  68 +----
 drivers/platform/x86/lenovo/Makefile          |   7 -
 drivers/platform/x86/lenovo/ideapad-laptop.c  | 225 +++-------------
 .../platform_data/x86/lenovo-wmi-hotkeys.h    |  28 ++
 20 files changed, 447 insertions(+), 262 deletions(-)
 create mode 100644 drivers/platform/lenovo/Kconfig
 create mode 100644 drivers/platform/lenovo/Makefile
 rename drivers/platform/{x86 => }/lenovo/wmi-camera.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-capdata.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-capdata.h (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-events.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-events.h (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-gamezone.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-helpers.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-helpers.h (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-hotkey-utilities.c (100%)
 create mode 100644 drivers/platform/lenovo/wmi-hotkeys.c
 rename drivers/platform/{x86 => }/lenovo/wmi-other.c (100%)
 create mode 100644 include/linux/platform_data/x86/lenovo-wmi-hotkeys.h

-- 
2.56.1

