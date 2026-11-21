Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795232016;
	b=hX5L5A5wJduRerygEMrgNKIys6Ml2TCiVkJkEHgJr3tNqDaqgldrRMan8AFIp/H7gArp
	 Tlify9BnQqC1McIxCUfsgBGXoC95MI8klBPyf+bw8rMI4J9McGKt5dxbRGjqFQMCUDhL0
	 Up+oawPGzgHnhso5d9OATKcvr74gsO2gbgEmomjzdPoHr8im/QEARqDRz71NgvEkyH4EZ
	 WJObn/kgBvtVynvb+eJAKZHAjC9ttkjcF+NZqc2HC1DainZpRwfib+xTKgtUteV5ASu7K
	 nGiNL3Xdt7paP1Mu+DpfaDyTL72RWFReUS+wadaA0pfW02ABRImJPJN4O3xjU+6UW7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232016;
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
	bh=W972IKMY/jD83La9+pmc3KmSzPNgoNp921AA4HsZHmA=;
	b=aFaI0TQ6g62MJ8zBaGr8fBTvdqvfwI/GizKXRonZelEHICQfdeUIRWg6swTpC9WUuvVH
	 kupLB4ixg1q3XUR1AuW2FU72YXHEYY9B5yC1TZD/YAkSV70BUlWtDFzZgTU3qYfWIhR2t
	 gL0ZU0zl/XKpJVIqxWtGdUzT2Zr1IPtgk6I+sSNQlmnDXbcBNY4hPMaYhGruqmzIhh8B0
	 IP41piWRs92SDXu/wB4bFVV4cAE5eQrEziE/LVW0YGG6shqUKR8j0Wt5+wx6aCK+VD4Xd
	 oYAY2MpdjSv2uMzpAr5MymCVazjQLmASeX7BOgZn8wyx5nvOHlfOH3rqOr6w2SGFPbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iGiBgirM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.16
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1661606A6A5;
	Sat, 21 Nov 2026 03:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1661606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iGiBgirM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zp0Lmo7PjWNDtO59qvpwJysrcBH/1Kt98ThqOJnWFbNp2pef7dCESwWL7suvwRM4oSr/eUHxS+KASEO5BaTvdHVq19jJTHvpWG69V/B5x/tAI3dNveZiK5kWt+znruaCPwST8Cud4yu1sUvHRFmRTvDje7UtT8Bj9ZPu/gFa8FqEjQMqDxcPLc6AJxVvy/oarZi5GvM7t5+vvmiyH43wL21Ht/UAlJmbBziZyS26Ry8P0O6PByR9+CytVguLaQBKn6a8zZ5zX5CPUrXIoYK0oNaik7RPeKZND2q9UZOpsy4bA0tcw13P9gnsI5ZzGhEBtfxMhpIzNWStbX88X6uu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W972IKMY/jD83La9+pmc3KmSzPNgoNp921AA4HsZHmA=;
 b=njPG7VsQhVb5VW4hhewC7XO6fZpFdAraSQHkvkvsi1JWcIcpArHgE0DQJwoiPwaiAe8kHbDK2ugBO7szmVgUgnrFfEfdCe/t9Ln9IPTSAfE4hfJL6SWIJha4r/uL8YtYpcriu/a7WFAUrPOI7EL6ivPTxBCXlYzynYDWk5xWpImnarIDFlobA/bvP93p94Xe0Saye/UJYxEH3vr8+dtYYSIUqfNW2HqjdNJf9qjwXUF5p0Kq03OXjC3lgJyTUYZr8oLl+awRpzcu5lyDyt2krlvuQ90i1B9T4SQoV21LtcHLvQF4UfGwK9vS/52OsiukOlJ6Y5CBisE4/474U9Jp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W972IKMY/jD83La9+pmc3KmSzPNgoNp921AA4HsZHmA=;
 b=iGiBgirMbOFC50NTCLqeE947QM6+b43quKlvZBvHrid6i8ntdq0xe2YT/iSlDecBlZwHtzlW4UnDfzSOOeQrXlMMdLo9hDcXHhnjR2jlMp65EaV+M5QPY6ZdK4H2TB7VYtkMHjiIFZXa4I+mCeOoUYyXnmjEBaNhZgFOYRGss5Or6c2821pEL9os5OGMLSOMmeAdspnsMOYOYX88Q/QbVmcwgDeQ/AA64Dw/T3Ea5u2jIj3JEGu+m/tGFZmqPd5ssHn3xbIdunuG8tl80f1qWpcqI9VJQwzhqWZspkMqxOjOz/cGg+Yer2WOtKIrU3IqEb6SXboseRyDLhHxA8DT4A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 03:33:28 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 03:33:28 +0000
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
Subject: [PATCH v3 0/3] platform: lenovo: architecture independent home for the Lenovo WMI drivers
Date: Fri, 20 Nov 2026 19:33:19 -0800
Message-ID: <20261121033322.974635-1-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119022719.3089229-1-dcemin@nvidia.com>
References: <20261119022719.3089229-1-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::38) To CH0PR12MB5089.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 853bb449-9981-4856-16b5-08df478034b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|261022105027099003|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261026121527099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	8BZ6iePbxBx0qvFI8CKIs/bIl2ZHFz4dIw9cwm0AR01VwXVbf0PhmF/nqosfA0SX/QSe0IC0hDKDYzXE1AuWbXjGjPpB2oEBuYMIXkyS/iiuMkGYwVrrBUc5SFFi58Lz9uuPMnr/LK7wnqCk9NGm+N77vEdsbzxgRXe9WdzZoQ7xHfcTrAU6JtxvvXY9q8SEOPo+EjbBOi+4PA3JYpijnhKHwdwsSbkGeSa1upb4npmkBSmfX4+DdV732yeilBi4gujgSyYmf9BDQyjPrVV6nNPmdcbU9AZRuzYaOxPlbFnrpfHrDOTUsnAtQJ7Hrb3B6E0FBLP5DR9lr9Sr00kxaMnoFATqXUGc87qqf7BhMBNBMVRpgYcx/hQsv7s+E3O+niRBuNKFqCvc1ILdQqHd9cClh7q5u+EQMgacl6QEhXrLCBYU9yEr/e70P5eUL/jz7FU4Xg5hf5JaG2VCoi5JyOJx2FI0kuncyk6jyNK4fl0nRAX1HdLgwdxfYW5kRNEu5foAXAnVLf4zdx3saJ5zkUPOCEzTvQtM2VbRl66eiSC1udSYoEbvhIM7Y1ecVjDGe7ZRiboveExLd/PgK0kbvDe0N5WICoI33md8Ga2VBw2cXwDw/TQbJZnEqz6wdfhG9bQFK5rZYyPZfRAeT7xme1SsScmaNsFUwN5MEnUxbJg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(261022105027099003)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261026121527099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?In/8DuNSBXRUOoTJUA7q74slVatLmDoPvumgv6fXHhPevkBquUiLAwrcBiXo?=
 =?us-ascii?Q?b0rFPK6VxxHCT/GMAjfgYCOgkj8A0WAIfFJ9dBrAgQgf97lzAOe8jmUBFDQ6?=
 =?us-ascii?Q?vh32EG9Y5SkzM6uR3LmLizsJwawWw2GUfsuLLaPH3cD5PQvEGEe65bE0VWQA?=
 =?us-ascii?Q?0YTbklK4HqahIql9sBLv1cxejX+lMMMGQRTzQwoO2j8RI6bO0xuu0Uu6903d?=
 =?us-ascii?Q?a779fb9vXAoTFBSGJGukjJ5qIUneV180oMbbeaaXRENRSXpLTVBpkAQfHJUY?=
 =?us-ascii?Q?MuGbHABvYj7mqGpmkFLYFr9+PH1qkKeOhXkt+SFF6B3OUoNvmMrPBgWCcbXf?=
 =?us-ascii?Q?uOJ2UJOAYB/wYKKhxbRAl1CakRbFBoc64tcLAQ3Bo+U0gbGR7hMxXVDpS1E6?=
 =?us-ascii?Q?e3m1rwrqo2UN0hx6meIsjJjeKED5uROc1k4YlogrzAPuK6K5YaQ7qd7j0qhA?=
 =?us-ascii?Q?LNSXwB+H4suBAjJ2DjFvT+jlQT7bU3UTXv9IZCruUmCos99fnFYyhzGV3VAU?=
 =?us-ascii?Q?spDgjOuZiZ5uRuUyCbP6OAGuYlEl+TPWSuvT3ddpY1XuSHh80sWgmrzeALpy?=
 =?us-ascii?Q?LiOm9+gDKKKH2RhqXtcwMqpiYVS9QkWCzOa4GnMYe6FOEnJV4K5HhiYoFoY7?=
 =?us-ascii?Q?Z7JeZpsPJC7YEfxoEOyuGqgnnmTkPLf6y2AT3fn2d0oHA77ibg4A9acaUAe/?=
 =?us-ascii?Q?/Wdl+kHBHAbtE0dOMsIgVGH6MbJcojIsLXuGUCfkPNHG1S6fMV8iqCOxPCUM?=
 =?us-ascii?Q?5hgpdOLMXZKWZOU6IAXku4rH09vWQ4y+yZu80l6VRztZGkYvPpO9LSLZzSeS?=
 =?us-ascii?Q?oarjngRnw8x2BfPojo2vEmRBqbL+rC5yCv0CVTXzmPfIe9cRrV1YrVlqu52p?=
 =?us-ascii?Q?iqnGwj5AbmI6VSgd+Qd771MGUuWFoD/NstoyH8+IJrEduAkIAXKhxmpk+UXD?=
 =?us-ascii?Q?O8b1TI4vgs0kEB7ZBV0jXzQ64zZXjhjWgEjEgnDzT/kwhMxftXaNr8kvsB9l?=
 =?us-ascii?Q?40DiPAbRqroWaA+a9Je1zQmgsRmCXCHhNFCiYfaBuN1BJ7AbGxVo8dlbHCvw?=
 =?us-ascii?Q?DYKZZqpLroxPF4AUStyGehcQS3TR3nz3ldBunCNTPL0/ULaB7f7WtGfvLSIh?=
 =?us-ascii?Q?dtTP0nrgpfNefeYa7LvtHsUUAr9PdmyQHvFSGUui/fhTz7r/k7uYDBqx1Cis?=
 =?us-ascii?Q?VOGxFknRIVGqvSGi1MnCTCDc47HeI2VRNIF2In5PsymOKEKANpgZ7RPtyBev?=
 =?us-ascii?Q?8ILRd3mrycfsyv7c9gQQYXgNDQ+nwlscVWpJw7rwmcmvbJ/s2OwuSCBQkyuT?=
 =?us-ascii?Q?W64js8wvxDEJNkSwDPQdJ2ZYZALgjMvD28F6a3Q3QEeLGVNiLtSuwcBJyQxE?=
 =?us-ascii?Q?V41Rj5nF//hYmvACCFHZ4xWK8LGB8qrdXmQyi9nKhSSKJo9cC94yoHGLvvtQ?=
 =?us-ascii?Q?AtESDsIPlD710s0O69r8SRCB307yDglArtm0QiPGSnuOPA/XU7zTtJt5jN9J?=
 =?us-ascii?Q?jSY259HKPyfUkC2MpNINgc39wJvDnKdeBcPoHL0SIqCVTCFsbNuVqE07zpdZ?=
 =?us-ascii?Q?AkUWb9XaUir3U9uSqIaXfMzfUZSkL+auf+p+p82pEtLd0uxIiXzfDSz3FyzX?=
 =?us-ascii?Q?PtHn3sveGbRqubJmbv2INqRZNv6DBpKAs41LrCp1w79/U564cKMJiH9uwW5i?=
 =?us-ascii?Q?ORlT5mHjf4+GMNFbpK8+LgCEaiiVASdIKp7mr+Puz9smpokc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853bb449-9981-4856-16b5-08df478034b9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 03:33:27.8818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zC92/6i2QGbEXpgXvXxdNl8jYtP0FXNQp3gOhIXUCCl5dr4rUgMWpuwK/CqTr98itmL61jzFDAKyTPLLhSA5Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522

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
  2. adds a WMI Fn keys driver that owns the Fn key and Fn+Esc event
     GUIDs on every architecture, reports the keys through the keymap
     taken over from ideapad-laptop, and offers a notifier chain to
     drivers with platform knowledge; ideapad-laptop drops its WMI event
     driver in the same patch and subscribes to that notifier for its
     Fn lock LED and DYTC performance mode handling;
  3. adds the keyboard backlight level events seen on the arm64 Yoga as
     ignored entries.

The series applies on top of Rong Zhang's "platform/x86: ideapad-laptop:
Trigger the EC on YMC events" (20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe)
because both touch the ideapad-laptop WMI code and that series
modernizes the lenovo-wmi-events helper.

Rong offered to co-maintain the new driver and is listed in the
MAINTAINERS entry; Rong, please shout if you would rather I drop that
until the driver is in.

Patch 2 was tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone
mute, airplane mode, the Smart Key, the Smart Connect key and the Fn+Q
performance key report input events with the same scan codes as before.
The Fn+Esc GUIDs are not exposed by that firmware, and the ideapad-laptop
side is compile tested on x86_64 only; a test on a Yoga 3 or Yoga 700
(Fn+Esc) and on a machine where ideapad-laptop handles the Fn lock LED
or DYTC would be appreciated.

Changes in v3:
  - driver renamed to wmi-fn-keys (LENOVO_WMI_FN_KEYS, lenovo-wmi-fn-keys)
    so it is not confused with wmi-hotkey-utilities (Jackie); header
    moved to include/linux/platform_data/lenovo-wmi-fn-keys.h (Rong)
  - patches 2 and 3 of v2 merged, so both drivers never bind the same
    WMI devices between the two (Rong)
  - lwmi_fn_keys_ prefix, per GUID struct lwmi_fn_keys_info with phys
    name, event size, scan code base and keymap, dedicated keymap for the
    Esc GUIDs, MODULE_AUTHOR (Rong)
  - keymap taken over from ideapad-laptop with its scan codes (Fn keys
    offset by 0x100, Fn+Esc 128) and comments unchanged, so userspace
    and the hwdb mappings see the same events; the new 0x40 to 0x43
    entries moved to their own patch (Rong)
  - notifier: the event type is the action and the Fn key code the
    data, ideapad-laptop keeps its switch statement; the notifier is
    unregistered before the DYTC and LED teardown instead of devm (Rong)
  - ideapad-laptop: imply LENOVO_WMI_FN_KEYS and IS_REACHABLE() instead
    of a depends on, so existing configurations keep the Fn keys (Rong);
    dropped the ACPI_WMI dependency (Armin); #else/#endif comments
  - collected Rong's Reviewed-by on patch 1

Changes in v2:
  - dropped the WMI core Kconfig patch, 884d53763d30 covers it (Armin)
  - notify_new with the wmi_buffer, devm_kzalloc_obj, drvdata set before
    input registration, KEY_PERFORMANCE for 0x3d (Armin)
  - notifier chain called before the keymap lookup, NOTIFY_STOP
    suppresses the key (Hans, Armin); input device named like the
    ideapad-laptop one so the hwdb mappings keep applying (Hans)
  - camera lens cover switch and Fn+Esc GUIDs handled by the new driver
    so ideapad-laptop registers no WMI event driver at all (Armin)
  - 0x48 (Smart Connect) stays KEY_LINK_PHONE as in ideapad-laptop since
    ccc8c8481c1f (Marco Giunta)
  - collected Mark's and Jackie's Reviewed-by on patch 1


David Cemin (3):
  platform: lenovo: move the architecture independent WMI drivers out of
    x86
  platform: lenovo: add WMI Fn keys driver and use it from
    ideapad-laptop
  platform: lenovo: wmi-fn-keys: ignore the keyboard backlight level
    events

 MAINTAINERS                                   |  11 +-
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/lenovo/Kconfig               | 102 +++++++
 drivers/platform/lenovo/Makefile              |  23 ++
 .../platform/{x86 => }/lenovo/wmi-camera.c    |   0
 .../platform/{x86 => }/lenovo/wmi-capdata.c   |   0
 .../platform/{x86 => }/lenovo/wmi-capdata.h   |   0
 .../platform/{x86 => }/lenovo/wmi-events.c    |   0
 .../platform/{x86 => }/lenovo/wmi-events.h    |   0
 drivers/platform/lenovo/wmi-fn-keys.c         | 288 ++++++++++++++++++
 .../platform/{x86 => }/lenovo/wmi-gamezone.c  |   0
 .../platform/{x86 => }/lenovo/wmi-helpers.c   |   0
 .../platform/{x86 => }/lenovo/wmi-helpers.h   |   0
 .../{x86 => }/lenovo/wmi-hotkey-utilities.c   |   0
 drivers/platform/{x86 => }/lenovo/wmi-other.c |   0
 drivers/platform/x86/lenovo/Kconfig           |  69 +----
 drivers/platform/x86/lenovo/Makefile          |   7 -
 drivers/platform/x86/lenovo/ideapad-laptop.c  | 227 +++-----------
 .../linux/platform_data/lenovo-wmi-fn-keys.h  |  32 ++
 20 files changed, 508 insertions(+), 254 deletions(-)
 create mode 100644 drivers/platform/lenovo/Kconfig
 create mode 100644 drivers/platform/lenovo/Makefile
 rename drivers/platform/{x86 => }/lenovo/wmi-camera.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-capdata.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-capdata.h (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-events.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-events.h (100%)
 create mode 100644 drivers/platform/lenovo/wmi-fn-keys.c
 rename drivers/platform/{x86 => }/lenovo/wmi-gamezone.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-helpers.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-helpers.h (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-hotkey-utilities.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-other.c (100%)
 create mode 100644 include/linux/platform_data/lenovo-wmi-fn-keys.h

-- 
2.56.1

