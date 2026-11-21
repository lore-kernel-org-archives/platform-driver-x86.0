Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219698;
	b=MPsrqikgxCthD9SHDuHAYF2eM3NdX5YSvQBezujrKA+IaVCXdC8oR4VCF9NFpqt9p7cC
	 UdGufhJQynOa/RpKp3RHeUgupYUB8poCjEzjvpLMLjD+RYofwlTv/0r8eObmu8UXSVh9K
	 X+M/VUWMq2PfH9FG3o9zWZmc82S7cXFuXuLdfJA/Ixs/UStwPdQcIUXpi+5+t+gd1Q2Mp
	 E0rYUcTYoIAKRppkmE+LeydEebULoGyrJsvCOZCNnxwoLOkbaOH4qJJA/IZNOgikxHydT
	 Vz/jjQbptaTBRKvkn4NfGfAXKgs7C7yYBRz8wYMw2SGSkDslNF19861HMuzvoiPAy+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219698;
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
	bh=BWgxnY4m4+2n4V9Fzz+vaYN4i01OB7aWR3zEXDgSV/E=;
	b=HOWrlIa/s//UqR23eEh+erooIF06w7Gunv1OwSwJ8L+/aUj9z8d73jBTZlBUKVVDQVYJ
	 7UkvR1PMIUXOWmRGFiOCzUVjK4HBCh8yWfSTP/64AJ1AoSBlJcZntK+s8aGf4oLTag4/e
	 R4Dm1ZAtJ7hU8WkGET46wSdehf1pQKa843vBh5q501HrcjphVJDJHcUt23eycJtlaKjpT
	 caC/D+AQMU0rHixtQBKkGJMHU7s2NawTwFSNDEw18AI5tOg67qZgObmaxDuc+YC2lBF6l
	 zsG/BmHmHZ66MVIl8cmUOo93nidBA25ImxciB/L08uHf1647HrKd4C6hA351HCc0HhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WC8zab3n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537F460A2606;
	Sat, 21 Nov 2026 00:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 537F460A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WC8zab3n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4NdZ/SIhXeRdcBeRXkBe7W6GssAQnO6vt6xRy981BwXoVBF0sx6AneUnzMhzSc+8rCUF1ESPRjYTSmesTv8OFLUM67/ksTiIpFJfeKQxJWzV6cawj2yLItzIRFiyX4ZFPUtDuHYtQf5c45w896jVcnALhIFXky0P+tuRlcNOGs2p6PBAo0mZuTt2bqxd8XJ88WehEfcdvAOoDLtPWK8z/TER7AU+sjm0uGasE6Lq9IVIPsFwdZb+UILL4u19+RTeeSV/HmezocVHDzspEvhYxYu+PgZJLO3jzsrV5uw2KXLXznfBHoLMA62eb919pjP/VJUQS9tzn9Nw61TE+0qEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWgxnY4m4+2n4V9Fzz+vaYN4i01OB7aWR3zEXDgSV/E=;
 b=KX2piO/pNWd79NMEd4dYx3gGVRyLP2lhFeXpC+rPcFJ0L3KdmXXg+QvRKYiGHrKtD5jSJtdBFlcZmHfrm8MutMqdYyHzRiMnix8nMAgdZlPhUV+iDnEe2EclFExGsOidJBB5eECg46xDoZ/p2NpSeMMc6dgVBBXyBzSMkR/OVFXkJMkk/lJbAts2AKiOUsImQAzD96fWKs5yi3WkTxpXnGt2pY2cwvwqy1Hd30ehDGisvtm+CE9HNPd8hrgWqTpGnYjMcFrqx/9p5qet5pcuP+VJrSJWF8ST6YFYmHN7/rNa4iLTxgjlqfqSgm5j5FYOHm7iPwc4iqY/3qgmr99jIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWgxnY4m4+2n4V9Fzz+vaYN4i01OB7aWR3zEXDgSV/E=;
 b=WC8zab3nOX4UBhPJH9tKJKX4cOcjCTFuS7gTDsRqIwO+ip/1H8YHFYowDNBUxii6EY2nNglSRijytx8rf8ITwU0p7mE+AVVvxSpCc/1KcgR4+nm547vkf6umvtiKKbiF8BxR8elbHDdxLPBF0qeHsnKmDTlt3JPSMBDvkgj0fQqWpi31ZYUPMiduGYUkHzX7+0m7y+smp0+by1FFyG055NiLNxYK+pkxbIlBqgVue0IhM5IAjk2fF9O9VI8HR6cT1RZyU30tde6qHAXZz3U08b0hb4JEMioOQovjtbiyfGrCXHlFKwE9GoOVvWL8uQZGMackYoIUy8gFgfHS9sClgQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 00:08:00 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 00:08:00 +0000
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
Subject: [PATCH 7/8] platform: dell: laptop: Don't load if SMBIOS calls are non-functional
Date: Fri, 20 Nov 2026 16:05:53 -0800
Message-ID: <20261121000556.173028-8-bmak@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: e8b93b2e-a519-4898-37c4-08df4763810e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|18002099003|6133799003|22082099003|261009223027099003|261021121427099003|5023799004|11063799006|56012099006|261021123027099003|261026121527099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	f5YNBKcA1SJH7oFrnv4Jw9V9YfAB1hBtymsB7Yd8bgE9qL4So1FfZiEiKJ7aQzTp48gEEk9d8UOX2n8oQ90Cpu63V4hcI3QACzcpUoxEC+igO58YkBzKrVIhfYNUyMdgNU/NlEptmDwDRIZgF4J9cjAg4kDx32dQKW18sKtAYEQKaZ7oAU02bsLMrEDWqUl5A0Ffe65sA5dnOGzrAn5mSNzle7lTFDGugWJj+nabio6Fq9Gkihby1v/hHUWhiY2yjiua59ei5CUJhZ8Pp4fUcxGulssh0y5OTxawHWf921BVARfG0+tlaOAm5cPh8a6M0ClT6x4zE4dIxjA166IZuDBngSRMLcKsMqtAvg+g0btto9lDFUhRVBtA55nMSiicTC72Le3gj1L/YUZX5CqaFjnJREOhQlOR6j0i2Tu0u0tdhrBENOsGR8zuHnjUJxukLbmgD9Gk0omBi2mxq6Iz9fiolbQgvkW7WQes6+LxYBg6gA993D8v6Zw28XGXUGUo5D2qLFAkChVy0vp09X4wceqgEo9yVlUfzkKjvYScpdsZ4+oejvxEn7D7LF7xoa6iLyS47rYg/PJN22AWDTeZlFi/yprfU7318qqFYSMWvuEZFgbjcH+g69o/eR+S14U8KzIG/jhwoq6PWQ6Gv5bHxX6oUO+89MAXNakyY8exccA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(18002099003)(6133799003)(22082099003)(261009223027099003)(261021121427099003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261026121527099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FUFlea/OV///2EV1mx62SRQPWa5IDjiQcuJYiXajwdFlOjchGVDcA7NKbAGN?=
 =?us-ascii?Q?78uKsekEgUKKy0mCazLfRIQJ//iglM9fy+PDShFFH2QyD0CxCk48efsJCU5S?=
 =?us-ascii?Q?IN3BAKAZ5rCrx8gUsm52oyYrFfQz8SgTJ1qSHSvbDijZ6jbZdNJksrtziqRc?=
 =?us-ascii?Q?ZaVgJWqJuLvXIQn/tIpv56Axs5EhrXivrka8q/k3zqcc9bTpAcbPqEF+TU+R?=
 =?us-ascii?Q?Jg93HBXS6NO3dCz43iPOeDwpHLw+W6Zxov+hNEMmEL/LmDYdsLmikBbAhtgq?=
 =?us-ascii?Q?wkbLNczQc+6cFXfm9zF4UGLTwbappbvXrEgXBzwRE6qnhr0tWo7Doiw3q7lZ?=
 =?us-ascii?Q?rgK0ZgTqB6VDw4dUx3JVUwqkjGKOHQrwL6injFHoWVtoY9/Au2XfMb55Qob5?=
 =?us-ascii?Q?5fkT0+h7NjiYQj7hGHlaXNsuSZHZKpTckiNMAwTmxij2PDq0iLaQWpdsqUqO?=
 =?us-ascii?Q?xEmFjKL+lCyoGo/WAweVVjawc7Y+O3nng0j9LpBXaM4ga4kjk+zx+QKpBTN2?=
 =?us-ascii?Q?EBnm538gpbSDRkpTyBXDSQD6l3EOJhRvKon3/R1RU4XZGNHkaoUfczgI3Ee7?=
 =?us-ascii?Q?7xjeHTp+AfIe1Fq0vvHll6lIwOj5WxF47rOd/alOcLh99/UzrHYED9miWcym?=
 =?us-ascii?Q?f8La2lIodvJe5lR+VzqSNRl55ZEHLdFWR4/x9isLpFvsjozH54u+5I8X8Rch?=
 =?us-ascii?Q?x3y9QsL+Zfb/hOgZKlIJa3NyNVXWPe/0ffS8S+hCZ1DllN4WKQWJWpKF4q0T?=
 =?us-ascii?Q?7KNijUSumZuGPjdlu98mTffzAcfhSRz4vmjCnjXSbAYfx13TV1fUzpqgDS5n?=
 =?us-ascii?Q?8WYjGRluk3yoB/BjtMwNoBMZActPxisiTwljfxTmzMyHjWBebuPnj8IDgW2E?=
 =?us-ascii?Q?SLJs46KQRBAL+bZa42IMYgBKKJb8MtGsa+rgHyJQ56+KdXOiwnPTAGXmkibc?=
 =?us-ascii?Q?gFb/GzgnKlfa9Ka2Dy+zBx5y6HugiXc7A05l0sBmWDFqohJ10gljAUp8rRm9?=
 =?us-ascii?Q?cNMVwmVCcZw5myaB/IwEdPsIpjR6hcVlBmR6+heGKVflapO+TaTrmtgQgRJv?=
 =?us-ascii?Q?h79FNSfvIJ+b1q9bBKudy8tBtk9QVeL0f3O93foG7NqDNySzmg259G4TeZJl?=
 =?us-ascii?Q?ViXWulQkPVLGFNWGMfaitaYwMw7cio6ZlzA3ZEDpfvYy6X7R3l9HO0ZeYL0I?=
 =?us-ascii?Q?18faFBFRX4ZamCFF5DMUdzil+bDQvkmPPawqn/vmXvP3G5aqMkcgTbzs3spv?=
 =?us-ascii?Q?EZ0HDjpdkC3ADGOmcQ0dcnePOqsAT9gOivpGvOYJ53mtJksduhw96rV9Q9+G?=
 =?us-ascii?Q?THzu4WI1S+x8BR+WvVpf6ekBLj/VDqcLOAnAtIg/OMFfMOTV/PufUkKPaWPw?=
 =?us-ascii?Q?RpFOMb2S47Xkgk2uoh/o1qGxwoAft+4q6oFphfX4keT6DY8KDWKIZ27zms3g?=
 =?us-ascii?Q?IT5HqMvxzbIsYuNYkfDsTle+paH8BOlDU6GxFe7CgR4iXRZB87uR2Ep8x3WX?=
 =?us-ascii?Q?oLVscLUjgLHctQoAQAlLkWbwuFKvPWA1tIjyXeIvTaZcX2mJwxRjXzGvSa8v?=
 =?us-ascii?Q?v2QV0C4sJ/PC04EVRMTE4CC6eRAXm0O8//YNs3bZnLZTKIbskIvzl5XXkrW9?=
 =?us-ascii?Q?xxL/Dd5BHd9mQD7x8l9kyiFyz6nqr5sTxkAuVpShPDpgsROmXcK/o6cVQXD2?=
 =?us-ascii?Q?4DeJ9rIm3EkS3Crt+n8qKT3aAdRx/4jRyQcBCQGDxtQyMQyQubx36jvbWgX4?=
 =?us-ascii?Q?QFqvgIApdA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b93b2e-a519-4898-37c4-08df4763810e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:08:00.4092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZHQeS59Nf/fw4x3qCKmVdX5eg1+Nbu7KBPUR4kQ3OT40T4XKLoiwZYevLv7n6iv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446

dell-laptop relies on the SMBIOS calling interface for all of its
functionality. On platforms where the interface returns all-zero
buffers, dell-laptop reports bogus battery charge modes and thresholds,
and registers mute and mic mute LEDs that do nothing.

Don't load dell-laptop on these platforms.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/dell/dell-laptop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/dell/dell-laptop.c b/drivers/platform/dell/dell-laptop.c
index 89e85c7f7132..7bf51b9cb03b 100644
--- a/drivers/platform/dell/dell-laptop.c
+++ b/drivers/platform/dell/dell-laptop.c
@@ -2464,6 +2464,9 @@ static int __init dell_init(void)
 	if (!dmi_check_system(dell_device_table))
 		return -ENODEV;
 
+	if (!dell_smbios_calls_functional())
+		return -ENODEV;
+
 	quirks = NULL;
 	/* find if this machine support other functions */
 	dmi_check_system(dell_quirks);
-- 
2.53.0

