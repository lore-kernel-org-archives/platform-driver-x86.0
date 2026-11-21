Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219693;
	b=bVINFNF0aUeFuD5gGkXUCZRnJAn+bQIskUmWvG19AqNBABCpnDjs6XV9+GFm+173/0Jm
	 3TcNyO+0xvEjinXQHUYDZxsAKYGS366r8U4Vbht3EmWeSP5TuVamuTL2c6sE7XCmfRrDK
	 MnB9fIYbjazi1ql+YRy6NWPjrKmB5LXEsFqltdgk1A/PJhvGS9jdYSpPG87qlfLjSuSl9
	 /gOpIDYYAXyuV5VU4WlRlO3LPUhFawws3I47W/RMH3/z2z5OCrwkljyJjD30id9YqxOIc
	 yslHmopt0/zKdAIGdDxu81qcvXjYovA3DhLKJ4Zhtrw5Q1/XJMwBENQkXeoEqb8gROQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219693;
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
	bh=fVO5bJef09cXu44UU2X8tb+YhtVL13157L9AKGqG/4Y=;
	b=LZ8+7YcP3r96SRvfrX8mipUpsjiHLwPr0QJoeMunKM2bZeQ18YbV2uB/Dy7YxTmBJtrH
	 GrsEoIlNYKLw6H42lXGc+eTNmSEDS9fuET0PRkna6Y2vCLt0sOcv4TmX9lYMxpfd4FiXp
	 rGf2PC9PKI+6Dti4OiS+pU6H+5awMQTDpCVfyYxJupa8DGciuM3mYYVnhrgdk56qKcp1j
	 lTxGA3m2UNkxM1MIBECBArL9Q1GndB3A0oiaSUuiZtA4X5XMWPHh3pf3C+Dy1xShw6rT/
	 cy8Ln7zlNOhJ85PrxCO6Baa964+toxUNNi7EtXruN5K/Z8UzvkMaBvOymY+WkiXBnhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ruMJD2Z4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2939D606A6A0;
	Sat, 21 Nov 2026 00:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2939D606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ruMJD2Z4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8hOkJg6g2F0FCyKzr4SduckBbErfIoYM6fR7q/mZ+K19oXecKPOfKzjNBADCFgUjK3Lc+nW7QIjaPpkkD/Rx/g1FZ0FCPfAd7JS9QnyxDbYSckyeq/3dzT87TMm0iG+SpY+WwhKZvsiy4kzP29+hpUjvI1Ss4VJ46XXHS0nHDrjC2nQbNlYJelPFwWqpHgYHk6J6x5X5EMEU+U0j062GsCujavFExtMH8p3YGCQE5zGi3dI7K9LO7O8R3GpFHVytbVFcria1As9c882dyDgQwPJi/9KBnlT3++EUrw9vUmfzbDvyYQLj4GS4R9xuuWgBXIfw8AGJ02hjqWCswRRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVO5bJef09cXu44UU2X8tb+YhtVL13157L9AKGqG/4Y=;
 b=t3ZmU1e6XFSdksf90I76h5zU1Xn9HWFFWGSDG1IG0ZhkaPPTrCu5zBVIEfwbQjQCWrI9mCbjz8os2r3ihn2T2XdG7DRuXNUL6NxM29yYFBYVuRv5AKl2J+oHqdzA40BfMkUjNSuRra91omPhoJMvFKTQS3Nxrzb5Vv8fDHCR6VUtZyB9XDKqQJ/dJ8O7j//ZWNeDv9q1beUOxGeLZ0kjJ4GsCTwh8tyVgBfMQ3knF9XVLjEDOrA/FGznNLQPEPhLf83J/pyUm8Zbs6TiAAsa7jt8yuDCj5HMsZnSiy/pgTY0YkvAX7WrmVE5hoQjjCwWZ05ApG5PgDyED0+VCWaETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVO5bJef09cXu44UU2X8tb+YhtVL13157L9AKGqG/4Y=;
 b=ruMJD2Z4vW+uRDihKXwaaTuw4hjytrkbCJjIavBeWveylFgyixIDM0YShxrkDNCCtRJeJAnmJmTdMuzmwWNXj8tbyFIyzstBq/gkCSPaVjnYO9n47SsRco8H+PoLYLcTB5Eq3RwT4OCWb5ol9Wp+Qadb/8RQ3vSmRJTn7NwEUTAWkXsMfa3TvWSVd5vSnrKKkqWqb4e3HOvK/MRUcVXXjgcIkCM/uL60aXcbklul4eSVZBLhDGjusAP6JJrpY/WA7+SDsD84UTTGXgwY5d5xMVi5pyA9tCzJ5Nj92oZr4LpJ4cZn817AeK/h69224bfYwMcLR9jdfw6+e+up3dal4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 00:07:55 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 00:07:54 +0000
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
Subject: [PATCH 5/8] platform: dell: smbios-wmi: Fix probe on RTX Spark
Date: Fri, 20 Nov 2026 16:05:51 -0800
Message-ID: <20261121000556.173028-6-bmak@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5e680389-3a11-4b59-828a-08df47637dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|18002099003|22082099003|261009223027099003|261021121427099003|11063799006|56012099006|261022075727099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	VafdvQyyQ1ParL5ISr22TW3Xv/Iux79vs4x+CalSWnhMlfIwPLn3JaAkKm7hRcZaAnNsUB3iFIgd26/vSlPNn8zABHKjlLyx/n0KsQGus1pfhRr15tCPapHHi1kZzbTFdDyMOJse1MhfiS1o4QnG5vq9CxDrXwXKAnA3WtjfUggOU+/4eWHfUKir/b0v+ajc5TWowFkhZSpz6uaz3TvHSpPSx3tITzbD+DI7ytDvrgQgepR2aE+Kw4SG905QN7CiXPpeSKtojCocX1c6wQfnpun6gjDPsGk17zdIxKDWahC6pe3c1V4Nw8godNQJo0qUqq9Rs0YUnWDMU/kpPM8aSFGyQS3CKo26fk4RcTNVjv5nASmC1XjXcPtEdsegqpbJaeAZcq1CnxqwP/rDIQFMyfSGqpdq0u0Z1JNtn3E2mYqEsc0j5PP+RRTaTChzueLoI2k3vjoYlUoAj4dHO3nGi3GwDu1wesiSXeaUjDzA8n1Muv7K9rfyNVdWd9xYSbkd2v4bruWMgX0qo3JeWvYlqCN/9lDw4dLYzMqFmm93b6A2eJuSLmzVVbJYsflCoExUPeHxUtHet3im19PqkN9B+ph5jSNXIAuLpzd/2H+JIargy4U6stHBzxRH4CjBBUg+4a5eYD0+tG9k65q+DBlghUNFBFiKmo6J7keG07kcDbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(11063799006)(56012099006)(261022075727099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zg3AVHYfsjpbDRyzV4hKSAc/zOeNwzkBpVAK+GEkWpWCzHjUQswa5J976WZt?=
 =?us-ascii?Q?Ao7+KfLQXvGN7z3NrpK74GtVi+r8Yh7PwBo3It8XwxvezfzbKqnKH/fN+9A3?=
 =?us-ascii?Q?hmTGApZQjNjc6IzMzXeAwSm0TibVwKsgdJlIKQnV2DsrAG5MIDqWNI3FjxFi?=
 =?us-ascii?Q?eVk1PUvtQJJaPw2X+kAZmyDGPr4+yHH1uQDvuuW3KvbcdsxKQsTWeoaq6b38?=
 =?us-ascii?Q?mRtDgaI6obqOhFYERTvbd7cbnuMW4laF345tm0HRHy4qhC+Qj+KFnLEZSkMQ?=
 =?us-ascii?Q?y53R5p2t+00GaDw38rK1fCPRr43TLHDt/KqYQ5vPvfBzukQ/HqNfF7uh/y0L?=
 =?us-ascii?Q?ivODKRRFQA9wUH4trbD5lLUkIwM8URW8w/2xN3hkaXL3lG+igyNC4z74oLb+?=
 =?us-ascii?Q?+ZkZutA04D76FHRbXTOQ8YNAhQQFOs4nTKw16/mnMKaRNQ1PaoP6lIpaBzOi?=
 =?us-ascii?Q?sn5i2GwSAbVnLUvIdDwryiqr/qiB2MAz+uazSUvlV0UCRrQB3KU9Cc8S1T4Q?=
 =?us-ascii?Q?PGIVicyqpd3eeP5dJcik4taQLE8c93yXxcgivsZzbizL6NEevgiwd5BC2wpi?=
 =?us-ascii?Q?6ZjZco6CCSdcJyuLYfIQn5cPwHJB7zqqkTGVUlbPUBAGXSP60XyMiSmHOYgE?=
 =?us-ascii?Q?1HNtwOxdUm6J7/YRkXiiAmjLh1ANRCVDskSEEiv5UmVsZ11J1kJsJK/CJWDW?=
 =?us-ascii?Q?oWOCyqKwKKiVw6uejTUhd1EQVKt4Ue+Gwv1aaWQPXa6T2n0Celq7lrMDDy+V?=
 =?us-ascii?Q?9lpkLd663m6V0a4DY8grMawcO+1tll9R6Pn9npI0QSwHrvFuAsMPs1yTj+Dp?=
 =?us-ascii?Q?+EP7NWj2nA4E8xpGMIpXWaO8KNMuF3YFd3HPnOajjwV3lP6+ozff+tMNFvrw?=
 =?us-ascii?Q?v5gLLjlFuv7hOa4u5qCOuiCNMVzQk0ofqHbhdDVv0z75uD1vi5+Att+vpdjb?=
 =?us-ascii?Q?9AxUjPcNLnF1YMEsUYEO/AUHnbnvboM4/wG6Y2BaTgpRu4IJ0nJ+rAI5F1My?=
 =?us-ascii?Q?Pa+eV+B8xcjUZy6IaMXVcSTl9k7YA64gvT1D7TZy3beRZF9opdwL84KnUDhc?=
 =?us-ascii?Q?bkecz2w5CQkxD9NKhX3+VqvitnI9wm64iGxfS9D6JSbGiDEBz5bu7BIuEcrx?=
 =?us-ascii?Q?CZvFprZV061AkvmMvsDNGHI/6iPJ1C5mb9cdCg+gIgwwPAmRPvMqJ25EnZSk?=
 =?us-ascii?Q?PwGiLtnzq+mt+tz77waE+dE8JyPuBA4XmhY0ibnqVL2KEpNHwyqA4NVCfLu3?=
 =?us-ascii?Q?hXFP74L3sbPkAbk1IVsyJ3aSqPO8h7tllk7Z4Jzx1byaHVt/juZZy+rGPdFf?=
 =?us-ascii?Q?54Tir07RyeBfaJOiAcUq7SBoe2uia7FnQ1Gi4qUAkhi8axA4jIV9Q7Fos7D2?=
 =?us-ascii?Q?SXIIh5cK4AMTfn380s9lyitYCsONwGqqZ1enjDjMmtV/vTfZmJ6+nmh3rI5T?=
 =?us-ascii?Q?goUSEmIA0spE5AvuchfXheauTClXIgY4FKNeOgeAbn24F9vhKMzYidJru3Gv?=
 =?us-ascii?Q?7qtQjkKLg15E/E1D0fS4fpHnW0aHWi6Yj8dWFAEEkZjsiNL8I4LLK7VFhviJ?=
 =?us-ascii?Q?jmogmQPW42BbUMIXTKdn+18FVxgulZ9MLCgDf/cDFpeBp0lghQA95oOsg2ku?=
 =?us-ascii?Q?JbPQezTnBVwed4SNQai9ExXLZD1HtaPsVLQxTj9NJOvgEzNyBzagphePdUZV?=
 =?us-ascii?Q?U19qcYOQW6bvsThi0AjdtR1PHmIq/gVzsiWG9mmbvhNgbG9njuT07bXFbgnV?=
 =?us-ascii?Q?DqsCPJw8yQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e680389-3a11-4b59-828a-08df47637dc1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:07:54.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0rT8pfJnPV0210U0FjrUW00Tv+tzcw1KgWtsq1oVEBnBmkD70cYkt6X7VFSHjzB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446

dell-smbios-wmi fails to probe on RTX Spark due to a hardcoded SMBIOS
handle (0xB100) of type 0xB1 (misc BIOS flags) that is numbered
differently on Dell RTX Spark laptops. Instead, search for all SMBIOS
handles of type 0xB1, and if there is just one, use that one. If handle
0xB100 exists, always use that.

This fixes dell-smbios-wmi probe on Dell RTX Spark laptops.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/dell/dell-smbios-wmi.c | 37 +++++++++++++++++++------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/dell/dell-smbios-wmi.c b/drivers/platform/dell/dell-smbios-wmi.c
index 7a5c6d7730ab..ff859d9039b9 100644
--- a/drivers/platform/dell/dell-smbios-wmi.c
+++ b/drivers/platform/dell/dell-smbios-wmi.c
@@ -273,7 +273,13 @@ static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
 	{ },
 };
 
-static void parse_b1_table(const struct dmi_header *dm)
+struct b1_search {
+	bool found_b100;
+	unsigned int count;
+	u16 flags0;
+};
+
+static void parse_b1_table(const struct dmi_header *dm, struct b1_search *search)
 {
 	struct misc_bios_flags_structure *flags =
 	container_of(dm, struct misc_bios_flags_structure, header);
@@ -281,17 +287,21 @@ static void parse_b1_table(const struct dmi_header *dm)
 	/* 4 bytes header, 8 bytes flags */
 	if (dm->length < 12)
 		return;
-	if (dm->handle != 0xb100)
-		return;
-	if ((flags->flags0 & FLAG_HAS_ACPI_WMI))
-		wmi_supported = 1;
+
+	search->count++;
+	if (dm->handle == 0xb100) {
+		search->found_b100 = true;
+		search->flags0 = flags->flags0;
+	} else if (!search->found_b100) {
+		search->flags0 = flags->flags0;
+	}
 }
 
-static void find_b1(const struct dmi_header *dm, void *dummy)
+static void find_b1(const struct dmi_header *dm, void *data)
 {
 	switch (dm->type) {
 	case 0xb1: /* misc bios flags */
-		parse_b1_table(dm);
+		parse_b1_table(dm, data);
 		break;
 	}
 }
@@ -308,7 +318,18 @@ static struct wmi_driver dell_smbios_wmi_driver = {
 
 int init_dell_smbios_wmi(void)
 {
-	dmi_walk(find_b1, NULL);
+	struct b1_search search = {};
+
+	dmi_walk(find_b1, &search);
+
+	/*
+	 * Dell x86 firmware places the misc BIOS flags at handle 0xb100. However,
+	 * with RTX Spark, it is not at handle 0xb100, so fall back to the only type
+	 * 0xb1 handle present if there is only one.
+	 */
+	if ((search.found_b100 || search.count == 1) &&
+	    (search.flags0 & FLAG_HAS_ACPI_WMI))
+		wmi_supported = 1;
 
 	if (!wmi_supported)
 		return -ENODEV;
-- 
2.53.0

