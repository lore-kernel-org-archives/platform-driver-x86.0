Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475408;
	b=BqXPxlh02dENHcTXdXltZgwvobOSMyxEFSoBR2QE6a6Ql6kU6usAStxJsDXVQp/S1+73
	 GCrTJdrtv1VZy+hSZX2bE6Tw00tir83DrPEpwrOdThIB9xPj+BebSx4SYKT1K48YZqmjo
	 Tl6t8gJ9Rh55t6aLv3HINwPXu5iDxEMC/QZNNjaU0e9OShJ1+XLRVnjZVKT6B2jDKuAwa
	 ljAti5ASgw3NR2hIiXZslOASNMsBT3fTAMzH7uC9qyVYhIQyxEBbIpKT4ah6yr9Hfd9CB
	 eDjC6rd8z1YTAEJuBNDWGrG0aN8im85SsBS0yzxnMWv9Bz+Mmigzkwo/0iqqZmlnucg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475408;
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
	bh=gKk3vascc4jdNCvvWbqVBIkQ08kqYvqbC+GRr0Gldno=;
	b=bg7s+c4xSPQeqofjIu6pM9XwBoiyjwZTEphnqVQQjlxIEldkP3LDLX7kYdZ34H3rO+pB
	 WW9kJqg3gaOIWBFUrtnYR/IQYxPqbCWlP43AJ3oR89BHFwNChxAGkiQK+D2/5Qczrt2+c
	 E1EYiIfLICWdbsC2xHASf9y1zRi5VknXSeUVh4EPqZWNdWtQJF+TEE2KHsY69co9G/xsm
	 hka/NfKphitKVXpafsrHi4JIeZb+JsCxePitv+yprkWCyClnAaVRiZRl0wOLSOlM91pOP
	 DfArWrPuOoKztTJeZT7bhC3KboeX9YBuwF0v+WOYHh30m1wyup6ZhTeTRaT1aYKlvlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZcyCuxO2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.24
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010024.outbound.protection.outlook.com [52.101.193.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3F1606A338;
	Mon, 23 Nov 2026 23:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E3F1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZcyCuxO2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vnyb1JDbX3AeBrTwneGgZNxckdwMsNetQrf88ZTPsGCOfnm4Obwm6s6+KVt7bpN4BaBkQcKnC45UqYnEpK6PB3c354qcMDS1wp7vmWHCsYSngBwVitxSOFELF7J8DejN4rwoJCqVqHHVLiCKMpYnZDuIT28m5L/JNW8cIDqssDtscezmqNRJqIpvd3uYD8YbAQBqQBckL9Sr82IQZV5W8mTWsXiwth8NFND9ftq5fYT2F5nzvHnRVjhfZcNxaRe6Boc0YC59wZWGJiCLiWIhYPbW+0rPGnnBh7/rL/0TctIi6/LMVpxmQilEbXYxafAz2X+1jVPmZjFSreUIZmmjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKk3vascc4jdNCvvWbqVBIkQ08kqYvqbC+GRr0Gldno=;
 b=ultLLRWdmrbP9lL66Nr299MUdsFcjDO0IQiQkmoRVNSjzmULwet1L8BLuM2MWX0x8wA8W5EY2cZsGKJ0p9sKnN84DvsaJmGQTEA0aciZHYVcNqZsFemnwMNKptDnLQskbC45UeODFWePB04U/irOesJoRR9ZCUSCwPQe2T9kcZWxjIaiPz9iXRtxnG7bXzT2sleo+oIvy2a8u+LAZFEiJVp3HFyHR9thuRvGEDGVwGlyJwuz9HjC+ms22rEYzee81pUzV6SB7TCP19Tm94l8kkWHai0GLiwYwrHQ/sLCA6HS3EtnzzswEykz4NDyUhUyBsX+alww0SdD8tnxF4Q1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKk3vascc4jdNCvvWbqVBIkQ08kqYvqbC+GRr0Gldno=;
 b=ZcyCuxO2OvZi3ptHvq2furAvYXUG2BRja36++MwShGPyqXlsoWko+ekg8Zp8nD2vhgyJFVDdOTjClH5HEqnR0aR/kwdEstAayHn50SVdrJ7o7WSkJgzf44ujVUJKK+78D+EyLhZe5SHTXSenruTAEtwBig1qh/GwKk2jNaaE4bK4Qiyii+SE2TXlNzfWi1kvLxzgenbnBVtoararz2UjNr7jbxqvgxRSpJAcfhpAGTaG18lpY6B51D09hdkqeQVjKQfCUzdrYkZJ6oUy0ZfVd5yS0yGdeRqxHrvG0ZJtaxHoiVNfnuv3SC9amQYac27n7O06p+CdCfMbekwHGMgw2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:10:00 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:10:00 +0000
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
Subject: [PATCH v2 01/10] platform/x86: dell: Make uart-backlight x86 only
Date: Mon, 23 Nov 2026 15:08:52 -0800
Message-ID: <20261123230905.13899-2-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123230905.13899-1-bmak@nvidia.com>
References: <20261123230905.13899-1-bmak@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 68ba06da-d4af-492c-f60d-08df49b6e5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	160/ZzUZYJC3ojg+ZYspIaxpSG6kUQhgBTkEIKPdZ9Hu88K/lUV/Nmtl3KW2s/jZzQ/BHtFLeiwC4/WaEJRIk+AWhbUi/y6eCVTBX/Jlb5t51izcJGF4pU01QFbp78CoapbO4xiLVfsgtiNssVshHpG/jQFOXQgYX7NB0PFAVIkUY5vKGMI5oTo8jxBRd3Gyuv6UndOMmMUR6cOvwGbmmGEn4f7eMqHXzXtykpMFRHl2KWed1u5WUkG0fBkn2ERh+nHQeWn89u03D5o9djdEWEWssBfI4EICvqe7YKJuu3uZgJb0nXwrp+NAYnm+lpq9COWm9YhMuBlBKcOxkA0Ci+P6QCMs4sOP2wibSDCEZgirBlxJr4d18Wgdjen/16wNmHksQyWMrQJ5LGk1YS5wdb7PDaMHcvqHhBTD3dOikTPIHa/BTDFue7RzKm0UQwKbz05peuAuy0ww/Ra6x2K9fhHKd5GgBwozqpSOmgMMtrx3+5+eGpOAUlMEF9TO/B997+ID8P/2LHaSo5OUBB8sJuBXljfNCFlpUIGfJ2nK2bkmdEJ8lfJAmomOjAOUNpIqS99Uo2TJyauU+NfHgJ+bdsnvteF+363b20jBKXPc+a7Qt8M7VlFPPQ05dr2622ju30ybQMv93docZxXvb5BMm6jtaGdVRd0xvmXpWR8kHzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xPVZsxt+QCH2E7m/DpzgH+BL0UDcsLmF/Hj9mm147+XMXxBdBRKUu7GLy62F?=
 =?us-ascii?Q?SLTVVKt0d5TfQSVoGqtRf1kaiimTN0TOg1WMgdw25uEhDkX8SJoR05tEuQGj?=
 =?us-ascii?Q?TjKHQadftd6HdNh9PzBagiJcsaFqnkmQ/GyRdLtUk/TfDeHYySjVMMn+zl7L?=
 =?us-ascii?Q?vbDpTJILTiXTtW4vqvKRrYQ8yzG34M4PEnWCXljUF8DNT9wxMR4VpsGu3yMU?=
 =?us-ascii?Q?F/XLrRtWgMkKIhV8ED1ff47Gfd5GywPU22Yk/imxaVwwZyatQfcO7jBhBh3l?=
 =?us-ascii?Q?039wSatfN4rY9n5/bbPqvJrvZwdjtteMjbmcGmibYxcUTFD5X9M/C1dkCQh/?=
 =?us-ascii?Q?+XnccjlRI7kH2eVQl7XehGX1WUy4Lne1c96QRPuma9Cc2zxAhtKw5S/uOygO?=
 =?us-ascii?Q?E6EHy76RNIPphWCyI8WoWLYJTxREOYnvSxFIjYm2kQeSJbKqpAP2naedLsqi?=
 =?us-ascii?Q?zc7MYBa4PxBo9JDzCDNZfndkg1o6aP/oFl4pBRUfdccjO/18hHs3O/g152Zo?=
 =?us-ascii?Q?nUeM2fnmi9eoYUO9wfJyMP/KOP5Nwa1GUdFmjr+EJ1N9BNJXl/VUoG5agR2h?=
 =?us-ascii?Q?cald0gP9RmolMqbHp2m2JjpOknz1k9phbWoKp8DaHjiZQXCk8nGITngRF02e?=
 =?us-ascii?Q?8gKdfpfimxmFGYS7Z6Jaz4erwZRh98/Fwz8/gjn9xJK7XdOSUJsGPTPYqCtO?=
 =?us-ascii?Q?cKCn2edSuZeAE4n8ZKRrsaZP0ltqDCifLjyJsOSYBW8Qaoy2nN77ohv72DhR?=
 =?us-ascii?Q?pFf5dK1rZzDoYitq62ghENtEwfYQFzMvYI889PhcMRAtxGJ6eerQGbXDejwC?=
 =?us-ascii?Q?lh2V+IEK8ESjs7wzJwF5emAuRK7UCXdFyi5Ry++8Q1vLVnwPTJI/z6g3CXTo?=
 =?us-ascii?Q?NdpJD5rUHQRBKP8iptX5ypau9QCvVdlzestnqoKpsXjnFSjLorhO2K9B6Rty?=
 =?us-ascii?Q?L0AJwuz/ZJibMXDF6jBL53JwAneozE4xmF34qtkBLoWj1Cf5Ttr1QaKApbQS?=
 =?us-ascii?Q?VhaI+qR+/9cf1N3J9C5ZuMCjWM3XcSeRk7hUV06xdbP/Eubq0fpQu3Bk36ts?=
 =?us-ascii?Q?g/vkxniWeCFsuM39mqtr+4MVgoy7TgKDewbznvg6qyi3Ryir457Y0/ylKghz?=
 =?us-ascii?Q?BBHvQaDfALGwVYa3whh07ZkBD3+pACfbB9nWbqn5/uly3ZQgKfx/sv29y2BP?=
 =?us-ascii?Q?hN3ZBYAGhKFobL0aEdhbxQNhRFKCZr50TIij5yHbynDaSTdssPI2rhpkvSjr?=
 =?us-ascii?Q?VsQ9nJtoO08foDtrYAJS8IWaHtmwE1ipzw0sFdCrwN+U+edn6M9qcnrFqORI?=
 =?us-ascii?Q?gK3TOi51Y9zdz0LVBJ0xpBxdo3l6CcHVMpuustaeRNmGtxFS0JLKkXmiZ52r?=
 =?us-ascii?Q?poctPvutvSPLlBV05t+dTeBOf/HVa9kpoxndCf55fVfmrbsX994L67ussMTk?=
 =?us-ascii?Q?TOAREW76VCS+n8SISPqvUHZfuolRQRP5r80iFb4HKtpklAs4nTMnJNl79LIa?=
 =?us-ascii?Q?COZrrPIojl0nQTGeg+1G5VtKV8tmummzK3dCfF8+u6mYPyLpoTvUG8O+3+8V?=
 =?us-ascii?Q?7enRNcKfLiCXZlHscuE8lSYIgE6eXHNBzttcsXu1pO7+aP1ofgq+g2Vvpe/G?=
 =?us-ascii?Q?nzhMQPjArQO+akUF0EVTTbbBN5d1scuSKmgRX0fTcv0wVpYeM3vY84SbubeI?=
 =?us-ascii?Q?pJJ9lPzOqnyASgrcmjmKxID4wttUvvhb9zD/w7435yAVV7fLxKkuK/+oDs+2?=
 =?us-ascii?Q?WTNquh92bg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ba06da-d4af-492c-f60d-08df49b6e5f8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:10:00.3165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fA9GuVM1EHcjdVGBOO6dXB1X5OgRpzrZQBvHGEZI5/LrRjC1GOjvegO9YcZPhi0m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

Make dell-uart-backlight x86 only, as it uses some x86 helpers.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/x86/dell/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index 9f0016056d7e..4c28d4c008fc 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -188,6 +188,7 @@ config DELL_UART_BACKLIGHT
 	depends on ACPI_VIDEO
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on SERIAL_DEV_BUS
+	depends on X86
 	help
 	  Say Y here if you want to support Dell AIO UART backlight interface.
 	  The Dell AIO machines released after 2017 come with a UART interface
-- 
2.53.0

