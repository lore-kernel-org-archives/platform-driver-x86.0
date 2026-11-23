Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475426;
	b=mFoYU4DxgWlG9mz0F7Xl/7KbfySHs3h2CHjNP/0NuNBYmhi6AVdQ7oa7wf+1WdLAp1Zl
	 OqVqS4J1YNVTmWqc9+2WNwwuxSKu5VMvZBFDChG/XrYnGPermX7Ipg75+OgM07tt6722a
	 eh7E7EpIkBgjPqurPHgzpy7bmHgxnBBSaZ2jrfNIiV5mzo8pXw87v+O8Gy4BgNHopXrA4
	 V08WBOnGduyOpWVfnWY3KRfdWWKsbY6OF3oALr81TQuQYK10aQgakwEMbBU5X8FoUKh8H
	 8FobT9MVDtKyopAgzXn37RA5nFKmYeHH5NjH8Ys9+UVWPtKZZBZYoef8J9BE17BhnRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475426;
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
	bh=oDpnPDz11b1ACoFbyakjOtlN6tXAGhXB67WHDTfP2JE=;
	b=SkOtuU+xS8NGPSNZNgMNB2gK32IKwxBFdWuKGN9r8mOVPTS17HgGTbrhCHrvzxKsZFWv
	 0ZrxG2c5b1SSAeZ21pppI3RynwInMfGxgSvnclw/U38Vx27HbnRkRxxuznnysc7BlF87l
	 z1wlLBq8Dy3386F7Bl3Nk8/xM4cDaCQDPaPp1Hw1qEAII7ogVKWofxoxmZ2Byt8BSF9FF
	 97OxW3zBXddhuufAnhIeaFU+WCG4CoRpsAASy3Xq3P/gt4gQehKiuAlqAVoZ91aFgKb0+
	 KVl8uOXj0kFvXCALlloEF9LJ9aKejYvqY6kD6YDrVorugwOJfCTOaHZ35Vz91vZjKSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PAdCi3MN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89EA606A33E;
	Mon, 23 Nov 2026 23:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C89EA606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PAdCi3MN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqFJ/d1vbb9qlNh01u7I8hjkXK4A/zTn1fGYgwKaoo4bFwRBaJYaogwdVEsfdEEDXaDOPriHWheZC67aRHPIw235oLfbbBzXyEaz2laGODPTtFt2mN8FARPUuvW0v7j/yKjfIZh5quHrEhVUVIz1TvAakYHe6byjMCtK7qF90Ip9O014FluKcSaPheR1Pt5fLIPw4iegi2UXneeVrDy+tsWSZAQSUBB4DNRRZLckKlilH8Ipe9dEH+/fWvi3liZumbop1JwgrqHFHLpMTklm1589JMPnp+hf5TtcYubqz3Ec8ATAXVXdIU3Lurv5iGTSgpZF06b+J7juxtd1rjSZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDpnPDz11b1ACoFbyakjOtlN6tXAGhXB67WHDTfP2JE=;
 b=r2tgBuUa0VcQf9yE0s4G8R+IQniHJMeHfNLv32Y7iQu0EjyUmH5vqaSHP1mGd1sZ0y0FMY5eIZ2vfuFSVJjQMWk2VYzHEunIcT9iF7wAimn74k2Fd0Kbwc3320Zqe4pOIdabvHJJyh6nykMIqJCsDOUjc2Jo4SMuVA7+lQ562kosQCM4tMxFtv05ALNInAtIAC0oh95PHLwJxD7+1PYcUfGEhcJUvqTLs+YN73ssJFJn+MM3JdarJ/TTy9mFzIWp+F+Eo/Xxi4ksXFuEl/ebJSlMsq9IGrpsy9jKhTHkguNqb4JHWzzp05uNo+fSD2kEO7ChOBZqUwSpu+VJ8To1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDpnPDz11b1ACoFbyakjOtlN6tXAGhXB67WHDTfP2JE=;
 b=PAdCi3MNni2AaYIPM6hor9aHtYgm/IclG3eHl1us82vf3Yk92TbpuK99zGSPVtS/upUqyzFn/B2wd+SAC5pPYdcmqATgCX0SEECL8BDxi8FJnSK0rq0AJCLgbA2hT6kDPb0zWzsXsOkVqKOHDQTJVIXQ9lrhSrz8M3fG0ohP1uUzLBo4SN5TeCgl4Ie4Cc/2Qpj6EDCy5kyitk0OOg7P6jazJQaoCZDA/M81CegHhhSZR1Yj1J0V8ZuwJVqTTJ2Jstdv+xQkiSxZC8YSALk8rFqwU2OyTVzirGDNdTC/x2wN5BN0cAlhqQHiT4MRoyOPm3cmGHKM38yjlsYCStRnGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:10:10 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:10:10 +0000
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
Subject: [PATCH v2 05/10] platform: dell: laptop: Compile out i8042 usage without SERIO_I8042
Date: Mon, 23 Nov 2026 15:08:56 -0800
Message-ID: <20261123230905.13899-6-bmak@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: b3ba5d7a-ea4a-4185-a5ca-08df49b6ebfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|10067099003|5023799004|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fViD0sKOrzNE+GMxkPpQpSGIBsKbSnCaOnCQTBwIsku4P6j3oLLh3tqiYUYY3oYG/u6CLEFuaypNG2wR/Z9gv7DxvcoYwn40AN9DHgj0SEWzDgU815yOhGZ5Zfso5FolyYdWYOltKXPqV6Vat3Keh4UJectXPwevr5omtGM7IWMoeSAfOcPxG2bt2whFEkUn8+Uy5T/rPE5saSpCzC3PSq22y+gBUcPsoYts8YeewxDvYzTO/VSuT1PRn54JQCN4kDmd0pmmel9j/drIjySwALxRSjPS8RQlafOoRFKUyBL5rgzCj+bU75nW91T37ktTP8oDbJsTtq9nyMW6PoX161TmwvskYd1VbEmjy31Xo3LtdR4cN/LeM9aQcz9NuqVRPcIk178z0mt9bpa/BWYaG8c16ZEn+bFBdxQZUANM42gV5yl0cvABoUMkSzF8yuNjYObW+AYqxrT4gF5hbhDLyV3Ep9tehfs9LZlJWJ9WXBqBaTwmPfTnJeRZXrmMk2FVPKzuSyVsTgw8QjhbIQWdZipxBjd3GI2/FDu8vPVw46oZdhOOltxAafgaZck1nzuipIszxDDFfLgiR5tmpxt7g97hO7wGdo5LWTzDJYu4tSRIXRM/TRXKDfsWigSwqPqRnYpMGifgUtrFkiqRBnItOJwa2/nfr9awn1CWg39hrbg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(10067099003)(5023799004)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A61AUlBEkEGkcdW15OiE14zS+hFYunqmPKWjOFHLhzGa2onU17wLrdikyxgl?=
 =?us-ascii?Q?MZHb7zkqoO9YRg7eSHc0u1k8NUMxjTs5mNbC3jlHvWLJK4TFtD5aQ6h/S7jd?=
 =?us-ascii?Q?7Mpr0Z38A4yG1IIFZWN8FpkROaPupG0qlyRoNvz9U0yGSnM8uyV1HsmXOWfg?=
 =?us-ascii?Q?pEiZ+76UR1SdjRZ8ZkqUP0Gpy/pDlWDfFfyoz9w8P/WU5HiKIM6+q/S7cgqe?=
 =?us-ascii?Q?t2ZjKLUqR631CHguq562muR/vnj1/i3a/Utk+Upj7dbAXE0IXhsMDWDfYHKx?=
 =?us-ascii?Q?eAL1XmlqA63JQlmMJ79YskO5RBELCz+AobcRXQVpNNYvlZ1Nw3vvzXAwwUMm?=
 =?us-ascii?Q?RTTes3QNDG5WBRehKBMHjZc96IjNjr0uymidY368DA0PQyinpdE8PlXP4LTU?=
 =?us-ascii?Q?xB11t1rhrYlXMU+UK8l8C+zoVjZnUERtA+sw6bAtC0kxSs2fba4umh54XdLj?=
 =?us-ascii?Q?ZjYT8ZNUIHHdh1M5va4+nF2AVLYxbhMpV9wYVSCo2uvhgSoKjSlPNcntUD+a?=
 =?us-ascii?Q?OIqi4y7UB1yMBpXbMb4gWhO5dhr+Qj4KPeei7IEu4C41jY3HWfY4IjD89Jhf?=
 =?us-ascii?Q?BQIK9SbDkhFV/KEZFhkWl7MX5nmTSurrPj0FqNBRfQuXvg+L7PGjImEBdQvk?=
 =?us-ascii?Q?R1cB4GkcxalSioCQrjqTsFzfwRT34KTQrKbieBje/lj5K1ibLngT3v0uUCe+?=
 =?us-ascii?Q?ZPW359ZffzFSP2lDnpzXk+kX1AyMIns6ZP+j+JCWAOeiPVUNsbkSwHGYynNy?=
 =?us-ascii?Q?I5L4okLOLapTsCEVynqGFr69jIFdiNrS+thHmSkQN4cghWzItqa6swug0NLf?=
 =?us-ascii?Q?VHVf/ltMNeXsBaBAX45xuC2hRICtRM1WghAdp16g8hS5aoyVVGr2C0WRU8nt?=
 =?us-ascii?Q?+kG0wAFByXTr/FPBfG1ed2pdLOpgDbIiIcuzQnEVoeeeJEVnmdgNahkqP5oi?=
 =?us-ascii?Q?ccW5Nmz6iMHoyxSy5tkwUSE/i9LGgRvObeAgfr82a2bPAH8Ie/QsTDX+pXds?=
 =?us-ascii?Q?Va6ok7hn5M8KMc6cgQa0BKk4wu2iCn0rngN97ceoD4tc9NOZdqw4/S6BlU2q?=
 =?us-ascii?Q?G438jaMkUOxTP2Jluif/c80q0sdxl1tCn36IQLjhUC/n3rfyRgmekH6U5AEW?=
 =?us-ascii?Q?2x1Z1Ibkurtj4iha7ubRwylzcp/obSX7Mk5vLYRLvYMxDFnik6YdLiy38wid?=
 =?us-ascii?Q?xvWSWprdK6+jdXvRZ7jEpiPCx9AYJrFf2+IsKf/gIU7XpPSRLjKc1M5ADAkH?=
 =?us-ascii?Q?vXQvH379FGex+TQ5Bcyz1lyWTJzEt6hq65m4NV7h894pYPz0CG6uTPcbY4Ns?=
 =?us-ascii?Q?Oqq+AS4Ba+DVFb8nfEUSWGpf6q17EL+tQeWPkidhhNWmpnxngV5hufbEVofF?=
 =?us-ascii?Q?rPKOI7aRDRNvFd3C3swovGe41lj001SrLYUNMuOHtT5WEAQRsF23SeFcq+PS?=
 =?us-ascii?Q?qdCaL9qqbJwlRDL1Jx0kMIaktcBw4KFtYV7VutBXvyb7t3aLi063oWR67meO?=
 =?us-ascii?Q?ALLZZU5uDsxTKSKSDAtyNCQ7wIPJCPw9K2MhG0skjKyU7fg3sHZNtg3XmGC/?=
 =?us-ascii?Q?eQCgNwK58d+EdU1qhyS3xaP3zGwhJ10EwGx4Ugxa/vpwp2/9POPK21miyb0X?=
 =?us-ascii?Q?Zl3sQ8lrJu+CMhwvEkli+GJsl1/TSelqueINPH0eHESJ6SNGuniUgGJenilw?=
 =?us-ascii?Q?/cvHr2/8bNA3/Q72Dka+/vZdbd8t0QxVCyDTQyBROWqYEWC4gT2RSA3i1OsB?=
 =?us-ascii?Q?fltiOL7ELA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ba5d7a-ea4a-4185-a5ca-08df49b6ebfc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:10:10.3607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMoIPFqjpdCV6HMIuBS2XPwqMXdzRYuYIoHaDFsXsxKtcZE2NyLsdSXNSZV3L2yN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

dell-laptop uses the i8042 controller for two things: controlling the
touchpad LED on certain models and receiving rfkill hotkey events when
dell-rbtn is not available. When SERIO_I8042 is disabled, the i8042
stubs return -ENODEV, and neither path handles that gracefully:

- The touchpad LED is registered anyway, and writes to it do nothing.
- On Latitude and Precision models with a hardware rfkill switch and
  no dell-rbtn, i8042_install_filter() fails, and dell-laptop fails to
  load entirely.

Only register the touchpad LED when SERIO_I8042 is enabled. When
neither dell-rbtn nor i8042 is available, skip rfkill instead of
failing to load, since there would be no way to track the hardware
switch state. Clear the rfkill pointers after unwinding so that
dell_cleanup_rfkill() does not free them again.

This prepares for dropping the hard SERIO_I8042 dependency, so that
dell-laptop can be built on platforms without an i8042 controller, such
as ARM64.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/dell/dell-laptop.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/dell/dell-laptop.c b/drivers/platform/dell/dell-laptop.c
index 89e85c7f7132..514449fa6e05 100644
--- a/drivers/platform/dell/dell-laptop.c
+++ b/drivers/platform/dell/dell-laptop.c
@@ -892,13 +892,17 @@ static int __init dell_setup_rfkill(void)
 	} else if (ret != -ENODEV) {
 		pr_warn("Unable to register dell rbtn notifier\n");
 		goto err_filter;
-	} else {
+	} else if (IS_ENABLED(CONFIG_SERIO_I8042)) {
 		ret = i8042_install_filter(dell_laptop_i8042_filter, NULL);
 		if (ret) {
 			pr_warn("Unable to install key filter\n");
 			goto err_filter;
 		}
 		pr_info("Using i8042 filter function for receiving events\n");
+	} else {
+		pr_info("No source for receiving events, rfkill disabled\n");
+		ret = 0;
+		goto err_filter;
 	}
 
 	return 0;
@@ -915,6 +919,9 @@ static int __init dell_setup_rfkill(void)
 		rfkill_unregister(wifi_rfkill);
 err_wifi:
 	rfkill_destroy(wifi_rfkill);
+	wifi_rfkill = NULL;
+	bluetooth_rfkill = NULL;
+	wwan_rfkill = NULL;
 
 	return ret;
 }
@@ -1014,6 +1021,11 @@ static void touchpad_led_exit(void)
 	led_classdev_unregister(&touchpad_led);
 }
 
+static bool dell_has_touchpad_led(void)
+{
+	return IS_ENABLED(CONFIG_SERIO_I8042) && quirks && quirks->touchpad_led;
+}
+
 /*
  * Derived from information in smbios-keyboard-ctl:
  *
@@ -2487,7 +2499,7 @@ static int __init dell_init(void)
 		goto fail_rfkill;
 	}
 
-	if (quirks && quirks->touchpad_led)
+	if (dell_has_touchpad_led())
 		touchpad_led_init(&platform_device->dev);
 
 	kbd_led_init(&platform_device->dev);
@@ -2564,7 +2576,7 @@ static int __init dell_init(void)
 	debugfs_remove_recursive(dell_laptop_dir);
 	dell_battery_exit();
 	kbd_led_exit();
-	if (quirks && quirks->touchpad_led)
+	if (dell_has_touchpad_led())
 		touchpad_led_exit();
 	dell_cleanup_rfkill();
 fail_rfkill:
@@ -2581,7 +2593,7 @@ static void __exit dell_exit(void)
 {
 	dell_laptop_unregister_notifier(&dell_laptop_notifier);
 	debugfs_remove_recursive(dell_laptop_dir);
-	if (quirks && quirks->touchpad_led)
+	if (dell_has_touchpad_led())
 		touchpad_led_exit();
 	kbd_led_exit();
 	dell_battery_exit();
-- 
2.53.0

