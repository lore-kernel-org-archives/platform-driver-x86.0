Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219697;
	b=bQkKG9GSFwtyS4/aQtjnWh4aW0I3/4fC64x1FrKsPD3waZEpTTViQV7GVCX5Bczoz/y0
	 Xu5IUyVdyYtmxNfJewNftbwSQWdPjQZAWBnvrl2xVF3+2WZGVJCewJXy68Qlj+nC3o+Dg
	 Y97V7XaUemSgZerMz5kf5jQCDHUgAsI3yOMdKIOFPetPmwC49M6rnNZx/EVeCLGR8NwHi
	 vmGXiySLuSTTyOtFQGTm+ELkthspj8VjkDk5LoOhBzydngqEqTdzoB5xpM72i22jB3Y3O
	 pTJllX4rEkJ3sJlNgftfEIGuGbIYMQnemvNlIUszA10nOmIpWAHjxd8koHraxRU0Epw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219697;
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
	bh=RXuY32Rkta+RWudogjyStrawmFr7bBxB2STdu1O1+p0=;
	b=kr6wLBvNoSkshowM3CG3M5hqHJcOCeP8x5mNpf6OUaD9C1x0v64VAS1cUHkMUr2ThpYg
	 x8w6z4Mk6BSGxOcS9UV9VKXR8jV9+Q3xc+xjK2ICrvY2cXvCKw2VySxRMVO2m0NXEKK/F
	 ypYnHA3G7o85b8urkYiUhQU488kD+i95CuZhCJekp8E5rsRVxH1wkKNLDbqrHOvRTxSyl
	 t4Ijs9K1rV1YqEuWpN3aCnNnpAbN2UBIBiePyA8B49ZakusT34opXUo/W6HoI3Woomeka
	 5WI8cRul544w3lP8nD2kvKF953oBwSEBfy/TllcUGggPbKMoj3tQhWUnIDQh2/ulmiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WhinSJJf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0128606A68D;
	Sat, 21 Nov 2026 00:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0128606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WhinSJJf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgYhdPWQWB6NqYr1YFjDoc2IhDDrdJU8jl9AWqoV9E8xOyxfQaVOpHUioLXWBurIY701QcCTL9aotkQimX/w9p1f0R2SKy+1MdR0qTtXUDf46cLrEoHLgBqz1/pgzuh61fmmgvauC7OElXSaI3v3AD+dO5hrQDFQetHkyDICXingQNIdQJ41vnYqO5OrO9bGfTIpjVZqVjq3ZfIwQQLOcaM+NcaPn1f/xTYeu+NmD5BeLj9cUw39MHHb3cKOFSeYoaPQbexttNn5698fZp5/SbyYdWCPX9j0g+8zo7FolDAbiXWWW5aFjPvXYnhBnxO5gsrdfHcMK/F2ixPTorKMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXuY32Rkta+RWudogjyStrawmFr7bBxB2STdu1O1+p0=;
 b=iOxy638fS2+QHJnhDv2ZEYH4tOa4A/ogQbxeRX0RnjKyFJfeHjSS8lWZbgJXpizqjK+jlX/8t3cLecBnFwbkGHUIkJsrczA9HJiFmuEVOSZbFTZNb2z/i3/sRWROXgnbpnI67qnvuI0mDQuYvFZOMuCqjp2wd7ZW+rIfm2bU/RNtNEKczmTx2fvhZc5ReieBH0p2TbeVTp17Zx/plEzGZ460O+4QU9820YtK2bYcxutQN00Eja5BZ49gPM5l/DFTHxJUk6ukzkHdL7jENmOIG2nIQ33PVzR+Vb6StIknByfdefTYXUAsP9Y2N3flLV7zb+blClvBseYufwgtFvVHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXuY32Rkta+RWudogjyStrawmFr7bBxB2STdu1O1+p0=;
 b=WhinSJJfsx51B2Q65FDo8syQbRBS9V3RKOMTFZGnjvvhcZlZ7sLH8cP4Yn0IgLc+yKeu6GNr1GlQq15Q8d4q1BZ0shYIejpP378E18mZbHnFgrSNcruYGdCrGawoCKgqdaKbsuRu9SA0sCeKFjSCyEyEm0AaBXRoDj2mrfgJeCqu8K9USOD4RGds5UcwS13zgVuJX4+F1uVL1DZCla+eZklKfBa1lJHNjW+uRBchp0Q8vdHFdz0N0cCyp46yTdRU/Jsi4BHVZawPovZLA4FCTDzP74/CONplTpjSuK9DwdBJrsScS4iyiIBcea3Z+brv8dYFCyqdC6Kx7p3y9OziEw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 00:07:57 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 00:07:57 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>,
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
Subject: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional calling interface
Date: Fri, 20 Nov 2026 16:05:52 -0800
Message-ID: <20261121000556.173028-7-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121000556.173028-1-bmak@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:303:6a::33) To MN0PR12MB5786.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: 126d11c6-be56-4624-2dbd-08df47637f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|18002099003|22082099003|261009223027099003|261021121427099003|11063799006|56012099006|261022075727099003|261022113327099003|261028144727099003|261026140227099003|261021130227099003|261021123027099003|261022115727099003|261022105027099003|261026121527099003|261102130727099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	+HR+0cyOVUpLWlS5z6VaD4Stmc3LynWwUENlwHT7P2aiAZBA2p0xo5R4bmpZTW20EAErqqJUg/7tcq7b6IYDe0Hu5JJnw9K3Y+cPTeiKep32ZQbDqJwzA0EwB50GaZgjLhBHlfoZ+Y0gQU2G8+R7HRX6gtW131cayW4zbHP8aMF5mX1mbX3a4gTOC7zaVMsQ6G5KbIHZBPOOwbbOla9nQbMsUv5B8RGgemy+q78kMaiHHoqsOVwh01kOTHUgyFYq61EGVeEnV2iFcqj7lIHVdyPZraWQP5M1qh4X2ZFd4ARxQuN5xhVOfTJd3E56ZuIDkW7CmtNlClsD2Rpp9+ma4BUEUBZQEYF49OSOLk5KtWuhqH6slgd4AmaQFxs+oknuD8FKHXAzB7GKeHlw0WOUfBG4blkdMSv5m+xNGJalnEEO2FPrFnse6SbtvIMihjJLUIACcWcaVa8PAb8jkLHGaOydHTPaQRsi1qLDEje+96WaiZHxIwxc6ti3Pih962A3Y1lJc3PyllGe3rPlqU00yAtBkd8/o+2Mpg13Mx4yzR1RH63creQGYmjT5KQxjFa+sTNnL4J18OtSDwvk9XJm6d8XIYuEAjlPpo1/5Lg32EF9g+faKJYYQDbd92PWQXW4Y37HsHGWbYRn9fu0qFb6/Y0ufPxVqxtw9DsPfLtE270=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(11063799006)(56012099006)(261022075727099003)(261022113327099003)(261028144727099003)(261026140227099003)(261021130227099003)(261021123027099003)(261022115727099003)(261022105027099003)(261026121527099003)(261102130727099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zDmlCEthvr7yb86yYoJazSRHEMfcqKGSKND0wiI0CC919zhEy4M9br5cI6Q8?=
 =?us-ascii?Q?SPuZAoImSK+0ye0TJQXIufqxNHRFHrp61xLgwRcnxiKILSQrwy1Tjw2WZhAQ?=
 =?us-ascii?Q?5d7zHMjJGiLnAtH0MVRYpkMj4WdAPejQrkO7/pY20TW0TU34KrwGsPx2jLDO?=
 =?us-ascii?Q?mU5OwM70gGxqs+VCN47qGQ6RY7LPOSZfgoejEkTlT8IrplP2izKVwNUhZeSf?=
 =?us-ascii?Q?oEanFidJbCl+qFtSeSuqL+HKqnPce2pMZdyZZ4KDWAcWbHkHgx2TDRn25+pA?=
 =?us-ascii?Q?9q3B5sBYqaS4z8IV2uSWqxZyY2X8GnojaPBx7COf/jP/n/NSb6SDp+7tT4Hr?=
 =?us-ascii?Q?ITvVoT5Q6t3Xc5TgHMCzwOdErssDconipCbGUxRAwVdDF6HwAXWNrLKfqWxZ?=
 =?us-ascii?Q?PZHXBUo0pH7hutB+56ktfyRPb8uKBFaoLJcYqKGPBcpE/xqmURd2/hl86ViN?=
 =?us-ascii?Q?HyF+J65mKKQpA9Ad1usY8svSmLj6kiwnd9AgrQtqdWt/pwsry+g9bGT2RxwY?=
 =?us-ascii?Q?hRgQ9qJS6uqQPVcleVWaAsAresJczHs/nfq4sJE3AhbdVKjOPWREl+TWY9R0?=
 =?us-ascii?Q?Wr5DOGAieYJ1RaCQWZpANgXFikFZNrlFgU6R+kw7HvJ6hVVOut6vdY9nCODT?=
 =?us-ascii?Q?qwt32O1EUjPKG0Ub4Lcgv/pV4fUrw3bthC7OQWDEefcMdxmCCcVpxiJYVzex?=
 =?us-ascii?Q?jHpa7h1x17GyJQYkC5zc2jImdNqAHbDhcwXEoFIVgWYCCj5LtzOXV9AV4wZr?=
 =?us-ascii?Q?bQIKkGaVlqedeFrFfEocj738TbkDhgtuxjPXmwNnvhCW7ck3CievzFzT5ZnB?=
 =?us-ascii?Q?mWh1tUXnKyT2GedpRE5h8wc9Ox4bKR3ziBIrs9GuWlnooXV8Awgl6ei8eKKj?=
 =?us-ascii?Q?Rw5UNsHBIPZ/v1gSchqiTlOKRrU5Lub10Lf1DP7XRbM8+LGMMuPwCrBH20zW?=
 =?us-ascii?Q?RBVMDTQ9QP3uXbLTQEJxmyVtJn+Ydjb7HFep488c97eB2hCdwUJGbHFvY19S?=
 =?us-ascii?Q?COsIovPCaTjdz8tY7nBxvRghQGjJM47c8knSmo6lq7ywTghu+ccncDOm6dQH?=
 =?us-ascii?Q?CL1adFdgohPaJeuNIFAJahuxi539dkFkkCgEiXYhryeskS//j0JFTXEnVajb?=
 =?us-ascii?Q?egJ9m1Zfn1UossxtDH2c4l+pZ10qacLl44OIk+HHWYc4UKlJJXfrqSeTVkpL?=
 =?us-ascii?Q?17aHCUPduSiUBdqjfTmyG2FAhT89p0ac01wpjwQ2wefHbYtI91G6bU7chdv8?=
 =?us-ascii?Q?JadaJOk2S6HH/cGpDeo7qVCsEaXN/f4onXCrsWPMraaQeJ602Z/oDrhxYLoC?=
 =?us-ascii?Q?lilQuoETlJoteFXKFhND2MjJ2+0Rcb4c4jiom9w+hq1FV0y8EhV4e/ksp+1H?=
 =?us-ascii?Q?HzY8qrKqj/OjrjZXmUrFPh86aQFq8x2jU9chUnz3IH5AZSLXFT3zwmxddxd3?=
 =?us-ascii?Q?td1Nya/Q0QPX0SwfKWSFua5AR+dBn1Qqjk3dGAoyCb5dLleqMjxyxsnMdsR9?=
 =?us-ascii?Q?kM0063njAQllf4cL/phV7O058DFX7w0xfNRnm+WB81bV1P904wlDBvgdCgJi?=
 =?us-ascii?Q?vECWGPLIJWMGam48bEKgluwbgqQlDf/YPjpMH5E1V3yNot/RxtE9h1bxb6RU?=
 =?us-ascii?Q?Cp+2G7UIuSmPvzsNAOLGSgRDg7/EsHVGgUJ+I1Kz1jge/utH6JnhekIOFZjS?=
 =?us-ascii?Q?+/ZX6s9lNtqIYlSgJWIkUd9XPUrWphOg+NWNwAuDBndfgWTbiWb7Mai+CMuT?=
 =?us-ascii?Q?JHF4474kqw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 126d11c6-be56-4624-2dbd-08df47637f3d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:07:57.3299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VA7TUo3YIMu17kpuOGbniCZMY8GDfoOwY+4DOWIm1viEFUMc3pOG+nOFpeStqaYN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446

On Dell RTX Spark laptops, the SMBIOS calling interface completes every
request with an all-zero buffer, even for requests that should fail.
Drivers that rely on it, such as dell-laptop and dell-pc, end up
reporting bogus state, like battery charge modes and thermal modes.

Add a DMI quirk list for platforms with a non-functional calling
interface, and export dell_smbios_calls_functional() so that consumers
can avoid loading on them. dell-smbios itself still loads, as dell-wmi
depends on it.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/dell/dell-smbios-base.c | 22 ++++++++++++++++++++++
 drivers/platform/dell/dell-smbios.h      |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/platform/dell/dell-smbios-base.c b/drivers/platform/dell/dell-smbios-base.c
index c8e93c12c445..e07cbb0e8a6a 100644
--- a/drivers/platform/dell/dell-smbios-base.c
+++ b/drivers/platform/dell/dell-smbios-base.c
@@ -390,6 +390,28 @@ bool dell_smbios_class_is_supported(u16 class)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_class_is_supported);
 
+/*
+ * Some Dell firmware completes its proprietary SMBIOS calls with all zeroes,
+ * so any value read through it (tokens, battery and thermal modes)
+ * is invalid.
+ */
+static const struct dmi_system_id dell_smbios_calls_broken_list[] = {
+	{
+		.ident = "Dell XPS 16 DX16263",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 16 DX16263"),
+		},
+	},
+	{ }
+};
+
+bool dell_smbios_calls_functional(void)
+{
+	return !dmi_check_system(dell_smbios_calls_broken_list);
+}
+EXPORT_SYMBOL_GPL(dell_smbios_calls_functional);
+
 static void __init parse_da_table(const struct dmi_header *dm)
 {
 	/* Final token is a terminator, so we don't want to copy it */
diff --git a/drivers/platform/dell/dell-smbios.h b/drivers/platform/dell/dell-smbios.h
index 1e64803bc00d..26f54364ffde 100644
--- a/drivers/platform/dell/dell-smbios.h
+++ b/drivers/platform/dell/dell-smbios.h
@@ -89,6 +89,7 @@ int dell_laptop_register_notifier(struct notifier_block *nb);
 int dell_laptop_unregister_notifier(struct notifier_block *nb);
 void dell_laptop_call_notifier(unsigned long action, void *data);
 bool dell_smbios_class_is_supported(u16 class);
+bool dell_smbios_calls_functional(void);
 
 /* for the supported backends */
 #ifdef CONFIG_DELL_SMBIOS_WMI
-- 
2.53.0

