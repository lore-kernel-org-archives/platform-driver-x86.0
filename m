Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012037.outbound.protection.outlook.com [52.101.126.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A6137BE7F;
	Fri, 17 Jul 2026 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287346; cv=fail; b=VR9XyMveD33Xo8Q1x9Ew+z4NctkcEhAW/Q9SyTu2LjOaMjth33uvnTaYu1tvD14rULN1DsxS7DppCVqqM5amaQEVWibyvbm7u7hDlLQUew+jC/aedwi+Ccu93xSgc6XEQBlfp0urYwfrsbyl7jUQj/K+KwZXcYeT6rx1pNUXUws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287346; c=relaxed/simple;
	bh=0Cln/tctmGT4p1sc7IeaR6+Usz7WLROHXIhYboEELao=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ilQlJamamClwVE7LDIcMImI53cT84NxSFFQXxbn4wWVVUOmNAXYv0PCSUxF/619Rc2uoZZhA0IMsUnAAiTJjWa8qO9TmMzE1RujoBMPDGXG5GLNKf7H2l4YW1qLYlxCIjB+BP/87n7rFDE4Y1lWSGX9FHMi3Iut4d3vKuhYkgRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=cny7eBw2; arc=fail smtp.client-ip=52.101.126.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="cny7eBw2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agHgE9gFrDNS496EDBcPQYezx0l12KkqhEphfbInyNAdRTbpyqa1TaFChfwa5wffbb7jBl47JI2paGdb75JuHkC94C3z5yiRnvgEo25wGDR1A/blessDJPKCuhyoivz6oDYm7wFY8tAoJ4hXlNOJDxoBcRaKHAbd21BAyjPDLuCrBH2qh95JlFDeCYoC3yVHhoTI0VIa5dt+Q70h3XwV3zz8l8wJrvI//dXy8Q3qNPF2DbhzfJyNMYF6SHMxLSJMpErQWddgEK4nD/+KU1mmWTZCVzC6fAMs/tRkgZcbt7vtCG0I2LtIUM02UUpOxbowfWtfgEQf/r/DlMYHTpM53A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etoSKMORDa6k4YC+I7NEeZ1fbH7B8Ku7y8C+3MI+kyQ=;
 b=FzTWjQgHbzhCDceGheWmBHcA+ICBY21a/fToBuWld64NfkyzVrIu1ErePU1SAKooXOdxBmrNmshmyZNNW/c1IHJdvrzFFSaIuUr2slnnFj5C+0esA9FNeT02fmfvEoeQ6QgO6Ai4QSJt4BiooYKlzUBI0Fv3phLItTJMw7CwHkr8a2XO/wIqkmFfP0tKmqZaIOAO6rYfeedVU2u0jY0pdQgZo9x3cyc0vEaeB8h+88czaAV70XceG+1cCJY0/lLMw9H61Ys/gh6IM9UfdH3CMV+z1WceTJgNQRtJ98m+vDFcBfHBFXKlnvezaFW+ErWwl2uLNCZ0oltq2gPiFynqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etoSKMORDa6k4YC+I7NEeZ1fbH7B8Ku7y8C+3MI+kyQ=;
 b=cny7eBw2GTE9CBDGam91d8KLLu4R6bQJLUu66ooL2STL1ftXEftHKmFVjPOcDL4kOhVbKWCpq6c69lvDn7Fq0MGGwyknKj1JnN42vCvOGTrJRxRhCjnlfu1u6lN2fI8Qz4l4dCL7VSXAXsXkLvLO/AeVR9UlbBEpzn6J/hQfGItlw++Oe8anXwqMM/OHjjMiuh4Q3qR4hCgkyY89wWYBO5BQOdYmeae9+FTOVfvIAyLf00edleyP6WoPqnCsJHI9KoZUF6ITCgEIk4qa6sHzKRs2K1L+S6uhCWQUrCh5gOHzIipXtSgUyeCMfdsQ6n7fVMqj1SppGtXh6UohHY62ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Fri, 17 Jul
 2026 11:21:53 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 11:21:53 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	platform-driver-x86@vger.kernel.org (open list:ARM64 PLATFORM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	chrome-platform@lists.linux.dev (open list:CHROME HARDWARE PLATFORM SUPPORT),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH 0/7] platform: Remove redundant error messages on IRQ request failure
Date: Fri, 17 Jul 2026 19:20:38 +0800
Message-Id: <20260717112103.213017-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::15) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|PS1PPF5540628D6:EE_
X-MS-Office365-Filtering-Correlation-Id: 112d670a-75bf-4f23-12ad-08dee3f59a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|52116014|7416014|1800799024|376014|6133799003|56012099006|11063799006|921020|38350700014|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	0juP94SKO34ByhTEzBmhS3Vsk1KRyXekeWO6GgqQpshpHK9pmmBP2XOsFD8/r/PyghnJ/XmQPesd2aMGXcVDv7v3QK4Zly9qGHdpK208oFWQ8nKjLpHb7OzdoV1qdBBZzBVb1Sfc6a7kQPFln3pmagy4Cp+CClwU6TVWX0NLFVqIFTLJSxq8I6xDIk9pGORBZG2je4ZfeXcCYN0y+hpihgjTRjDs0ONJ5FUdOhjdjKAYlfVy72yp2Q8+6sIv/Y8JfYH8pNK+klDo0LCL4oXIgqcpz4NPY621SkDQ8mfFUTfaiJa7NFpETzMWWglPkUnk6G2E33IddGlj3BKypO8o0N2psSBiFnSZ0CXhs4VFo+IIxqK0++H83eSZ0e90RYGiF2TlwywGb6O/iKOy1Uh+zmraydXncpySvEKF1UiRFKnhVUso7uKc52DlnOk5BG65+/XYY8HYn3qOvO5FvzVHZ58qQxEtzuuXu6Tmo1rZVf0961BpwXr1mGkJQen96FAKe/T/bn7uQgkjJekfevKVmphKb1J8lgHwudvNcijijfE4Dq/jusBoGW/RsnfPrQYaArEOfiSsJvksUvW1lytt1LictwVPef2kbsgF6kmerrEPHUsueTevdcngQzZqjWFrppWnEB6JVMzaX6PRTCG6mosSVg4/DQy8DCyJINTzfLtubicN5qfcmnycb1SOIi+bTzuldDeYexgZpSBZwfiMt+bM9Q41ueDpvViDDVzRG6w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(7416014)(1800799024)(376014)(6133799003)(56012099006)(11063799006)(921020)(38350700014)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FwelsyXnvqRxBmmwHFRdRRBf1HkvDCgdLr6IcH0rpR2typ1+nKYd0XCYqWro?=
 =?us-ascii?Q?DrTE+zsOH9uMvpLzyofzdU4J1H0cS8ePWc2m2RfwSRCaSezDET3haLcE7yui?=
 =?us-ascii?Q?tJPzthElu/KBYAzFIu/Tqz+7G7tAtEc121XQIJ2tvLkUUJzUbtsrAUXC/llb?=
 =?us-ascii?Q?D4iyVNH6Ch0ubslKwZK6nnexR0mb2+weSSD4ut6+X2eP/twILWAJAb5TumvC?=
 =?us-ascii?Q?DZV3ux9pb7WhpVguMbexa5jRzCkJccngGaQKhIOgM4xI8xLxsrj6yPYPZ4Ct?=
 =?us-ascii?Q?JZYjsOBvAC2mDP8XMciXt9PAKv8pvngImt+a5oKbqAEdqxtBTJW6hz9rMFZh?=
 =?us-ascii?Q?HIjkz5wLc4B3HzbDxh3HbSv4gpY6Df1HD3Tvp9nuusoYBigW0ZdNp21hyH8S?=
 =?us-ascii?Q?QAkTeOoZmzWX5AB5shJ/Pl7+BrKukE1EXyCwxJ8JItm1L9FFZkO9b+rK3yis?=
 =?us-ascii?Q?OlkQP1pqyx4C5anFsDDW20CE9H2T3FsgHKZ8Mjw8gLXUpi4ss7irw54YEcuE?=
 =?us-ascii?Q?df5wRTDLs0FRT2ed60WO+hu2kXo6ZfNBETFWbwM8fZuYDD8ifVk8VfxPxiEZ?=
 =?us-ascii?Q?WmtFT7QdiwLHoq164zfoatBu3PwajqLI0W/0kuiJZr2W2u+f4tsa4rta7Sl6?=
 =?us-ascii?Q?zjpKJUzfgePScNDlnQJ7X+3cf16yVSLQxttY2JjVlFK7YkuVaMEz35eku6P7?=
 =?us-ascii?Q?WLJvnrGDe8oObHuoCBjO2v9WxD+C1VoCu4elEGziZV7L+Rwetfbs5A1UOpWi?=
 =?us-ascii?Q?U2H93YMYLoWvm+LRX5KqjubWO2lEcrdHYu1Z6u6cpPbrHFi4qylcrUZ92AWy?=
 =?us-ascii?Q?dlov3s45Idpob+iqTOsUEToJYKsJ4DOVFaqYYf8d+MtAWDvuo30l3rCq5m8d?=
 =?us-ascii?Q?ziZs3jS/sq3U9r+4xsHNEKp0RRjYAJeWGeu+XiC4gJd9B9+s9vqJNUMMORGO?=
 =?us-ascii?Q?UZlr2TPeeDpE7a3sP6QT+8wHVAgnUO7FZQIlykf7L8qoJHiDEuphmyKdPeuP?=
 =?us-ascii?Q?fwBOvRwlZQ5l8eZo6T8ztmBE1cSIJyC6nMN+tmvpunec9IxD8CIdxeLzbm+e?=
 =?us-ascii?Q?0rOtJGx34UzhGhgqyxL5tOdvpfVfoYGbJQtoErQwEsRIbptQB6To3t2Az66j?=
 =?us-ascii?Q?TVu5Tcl2ra4izIKTbneWwt7hUjTSapOM2+MxjaQqLtzhrdECAPmlns71w4+I?=
 =?us-ascii?Q?bhh9L8ma9MOTvSCaUiWhvDC4LWJhvIUmTavrrFV/N90SJJ1WnmCGtqmwLwT4?=
 =?us-ascii?Q?Q+qXuAjKmavmRbNVXFzJMdzDlqsJqkrOJuMZcwMqr0X8tQ/xclC0JXFgGoky?=
 =?us-ascii?Q?oSVCYEGXjqu5k0bTkJ4mN16wGiiMAYMxxdZrAqp+7vcFMK4/3F9nOM9/m0W5?=
 =?us-ascii?Q?V71/f86S1gpOb/C3RUpS5tR/Cq1r7l3qIjuGYGm3IiIxvrJrEFH/xOUiCG25?=
 =?us-ascii?Q?ytls9zIvnkgBhzzv7EXHED66j73qZZc+cjJti/EA5Lx/kTyOZtatNdn4ovS0?=
 =?us-ascii?Q?Cl9uSK6a9BWBlplmIYgDzpOeSxJoI2muGkcCw77JlMsAScGNqqoJADxw6Rx3?=
 =?us-ascii?Q?97D1jbNM8eDnMahwbkwRS+58SIR+7hraGF9hdAAxypJfwwqzKcyjub/eQHiP?=
 =?us-ascii?Q?JiwYgn4BZpNvyYF/8RApqvU8/FinPICKMi2s6OXD7IMTIhBfyRK/Xm2M3tSf?=
 =?us-ascii?Q?/NYjit/7aO8mtdXm58m02MobB9p7XF5sqtdi7g5/BXSYLeTrjG0c29AycEpy?=
 =?us-ascii?Q?L2xhg//Oow=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112d670a-75bf-4f23-12ad-08dee3f59a97
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 11:21:53.5472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BUYKK0QrslRhMntSwr+owv+NteUntAD2Wsk82oeQoyyhMBhFpzKRJRS5ka6ubqio9ug9n+vKMLnIXNU5IzBtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF5540628D6

devm_request_threaded_irq() and devm_request_any_context_irq()
automatically log detailed error messages on failure via
the devm_request_result() helper, which prints device
name, IRQ number, handler functions, and error code.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this
automatic logging.

Remove the now-redundant dev_err() and dev_err_probe() calls
in platform drivers that follow these devm_request_*_irq()
functions, as the core now provides more detailed diagnostic
information on failure.

Pan Chuang (7):
  platform: arm64: Remove redundant dev_err_probe()
  platform/chrome: Remove redundant dev_err()
  platform: cznic: turris-omnia-mcu: Remove redundant dev_err_probe()
  platform: goldfish: pipe: Remove redundant dev_err()
  platform/mellanox: Remove redundant dev_err()
  platform/raspberrypi: Remove redundant dev_err()
  platform/x86: Remove redundant dev_err()/dev_err_probe()

 drivers/platform/arm64/acer-aspire1-ec.c                 | 2 +-
 drivers/platform/arm64/huawei-gaokun-ec.c                | 2 +-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c            | 2 +-
 drivers/platform/arm64/lenovo-yoga-c630.c                | 2 +-
 drivers/platform/chrome/cros_ec.c                        | 5 +----
 drivers/platform/cznic/turris-omnia-mcu-gpio.c           | 2 +-
 drivers/platform/goldfish/goldfish_pipe.c                | 4 +---
 drivers/platform/mellanox/mlxbf-tmfifo.c                 | 1 -
 drivers/platform/mellanox/mlxreg-hotplug.c               | 4 +---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 4 +---
 drivers/platform/x86/asus-tf103c-dock.c                  | 2 +-
 drivers/platform/x86/intel/bxtwc_tmu.c                   | 5 +----
 drivers/platform/x86/intel/bytcrc_pwrsrc.c               | 2 +-
 drivers/platform/x86/intel/crystal_cove_charger.c        | 2 +-
 drivers/platform/x86/intel/int0002_vgpio.c               | 4 +---
 drivers/platform/x86/intel/punit_ipc.c                   | 4 +---
 16 files changed, 15 insertions(+), 32 deletions(-)

-- 
2.34.1

