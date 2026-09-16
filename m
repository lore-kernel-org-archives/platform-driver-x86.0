Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazolkn19012023.outbound.protection.outlook.com [52.103.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66646514760;
	Wed, 16 Sep 2026 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566495; cv=fail; b=pt0ZdDu1DGaUnCQpzT5gDTIm7udg3M4MVxmzlHD2+t9AYMrqPwYvp+2/lQXEgM2taIK+Jhrvr50HypYVGQB0nZ1ZbFRdaLRx1bm282OxE01ApVAjz2cYrkhU/uzxfY3izAhTOJnRwyxPjCszo7qlstxzb3sQ+I2Vfwr2wHS605E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566495; c=relaxed/simple;
	bh=wKiIuyArMm3dzhnFBAA22llY2cMTr//nvuQq7RqBmsU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LebGiZW2rehFwRwc2me3Hbx5XDNZzg3HFY/UePApnaChbvsRCxjiCXjVOY+i25I2QDe7YxBqgF812KPoitKwExOfXBIdRgPr89bSDJ4r3o9lakZF6lXf2ZK4aJKZs1iP/6Iu9bEee+0CWPILMV4kVKVEsr1AT3KQOebE0EMBn6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=hK3WHKXu; arc=fail smtp.client-ip=52.103.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="hK3WHKXu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOTmO+KobsAPsiGLnRz/9KGvt0WI5uGy/gX/JdEnsOknUEE6BFPRMll1LI/5X8a15wa1JGEpg+rmu6NRyykMoPJc8vz4aA+QCwPTj95NsjOtUG4UQbHLKXYLE+QlIYVINxhAxjdHs8mMbawWW985HXrqIVS09pyPGFpBxtavyrQDPCCrEZV+C+Ds7v4Gc4I1dE2GQ37p4MBI5htSXy55IEP9zv9EDoQ03iVxGinuGkeXU5rw12DEeS6wDrcOGVuM/Vu2Vfc90imOhyj10x10KHeQBhTipbYVE3zBFmjMP0JkchXdC/iRV4TRyt9s/28xr5iWArVrX86kxQLht8lonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbQ5aTkpB+KqUBEb1B1kJqKbtbGmhV7Q0h41BYSWzxI=;
 b=zFr5vxm9eAY3GcqENm5B5VByVpz36Mg7vKqK8soouTCEambcRyVUWsOxzn3u1LD0qNPCiUuEYddQcoZyn4HULEyHWXc10HotguniNj/HkdfK1bKqlxL/DsSZWIepNFIplcvvMSRWFpEn/k/jTRYbPkI9GZZdai3YDk4xTkXE7TeqCptpRHaW0uTvgsLmLByviMJEhhkzZrCvocAJ3o/jEL/48w8YWz2HOz7w+S+ObxOQmtjZC+5/QEjph/0UvvKZEt9rOu/+04jnmqWPmfCoG/qO1JqL+ccqGLZhqNjEO99lwRdOlZnUmQfCkEApteaaqTyNb9/Eg1za7OTahB8GwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbQ5aTkpB+KqUBEb1B1kJqKbtbGmhV7Q0h41BYSWzxI=;
 b=hK3WHKXujDAl2Cr8N7wQtOF310imX+zy5U272cJalOTHmhlZNxvhJR6HzU6u6TQC9H3zkC5MA7y4VIaQE+qiNayLvwCVSBq7o1NyHbtR9GrFJm31XZPpvzBeUtxRw4m3bv3kmeE+QF/NCuAjUJZW+B1sBGoYhnOMbTGAIRaviX9/elbpMNJ/37ZF53M+FMTP9DkfNHxiVzlL1Ahb7Cw3ScONKS2Qav378KOU/yAHPsP5lfNGX1z2Qh/Wpla7CnabiKIjNCSZenkofiuTEyJOMMu8vI/plBN9qPVhcmX3ty+sCsKSX88FQqlrN66mwemgC7eFFxKJ376ivUFlqdMdCA==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by CH2PR19MB3880.namprd19.prod.outlook.com (2603:10b6:610:97::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 13:48:06 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 13:48:05 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Ike Panhc <ikepanhc@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH] platform/x86: ideapad-laptop: Map Smart Connect hotkey to KEY_LINK_PHONE
Date: Wed, 16 Sep 2026 15:47:51 +0200
Message-ID:
 <SN6PR19MB2303EBD5288E51BA50D904EFFCB92@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00007534.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::4c6) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260916134751.16521-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|CH2PR19MB3880:EE_
X-MS-Office365-Filtering-Correlation-Id: d959c0e2-db07-4122-88f9-08df13f920ae
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|19110799012|8060799015|23021999003|4140399003|25010399006|51005399006|55001999006|24021099003|5072599009|5062599005|40105399003|2607281247196008|30101999006|19061999003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IXBzk+D749+GEahEKubkk/W8oMC6Dln1pa5sPVv5eVsME08slHnURrJh6tH1?=
 =?us-ascii?Q?YRWxWPKOBfINQ0ZWX6S2E212QJwlycmmLDHBuBZbgwzGeXEBxKlKA8SkAMly?=
 =?us-ascii?Q?usGMOT2lviumyGtNF+8uVKaCRDhOGauQTFm01hvb0ZM/ik1daBxhLOtZi6/0?=
 =?us-ascii?Q?m/54+z0Ruc58TXM5OU302Wcl3TEyjXyRw1ziegCW7Ps2SfYjQwIYJ1HeU1b6?=
 =?us-ascii?Q?roTGAg03xsk8rnqu4ci4ijxN5Lfzw2YhDKNhJtc28Fdfg9wZqBOzuyg+OBrR?=
 =?us-ascii?Q?QBTdw89HIX2x6mUnFxBTMxJBMkXDKl4efjAozfTVBRpVrwTGtH4bf25K7ptC?=
 =?us-ascii?Q?az/b2Zp7MdCHsy2SS7eBZVyAK8Q1noCK9hHvv8sbZiTTGMI4S/dvRNu0HM2J?=
 =?us-ascii?Q?mjnexTTGM0EVQZPPuVhyB8woPJ8MNPB/F1QZgSmOJWH9Uy1vIX/fa2e/3Q/0?=
 =?us-ascii?Q?FRCzTLezXHSgKEtNkDSF13u7j5iR0BhVO7GORVYicdkKgCVY2qJEVIK07QFv?=
 =?us-ascii?Q?AJvWTMS+31NRTLn1XM4P11oREVfqfsrfcnjFxDTvYUz/mBWM06IXs0Npskj1?=
 =?us-ascii?Q?Ljhac7gez2KaZaiw08ol0XxIQht+RCqHgyEwDrMoEfYeFAvX/rmDw43vANzB?=
 =?us-ascii?Q?/wthsEqlEWf12nMFgjug23uc/4KTsE2eBACFXjAdsFevoQoox2lC+TR+erap?=
 =?us-ascii?Q?lVEmMbfbTOaH/X8G7KWcDLoH4/ed4+3oJhyQZG1QXIrG0ZVSNjGgGUxqD41D?=
 =?us-ascii?Q?+JR1QAm/Hi4lhvVOlgfzx9OBZjLjYPiQDzRf5LRf/0Cr4BvDYktiLCPU0GWt?=
 =?us-ascii?Q?w+AUk3rCixBjpFUbVuJ0nDzxsW8u9JUjsacqc79nGHfhhQoccdZFWiWDvaB0?=
 =?us-ascii?Q?TrJVUbwqDjSCEwbx/Mnv+xD2AQn3P8YZR9kPgul8d1PFOtheYo9lPAVx/DQ5?=
 =?us-ascii?Q?Hk/6WZ+xwrF9DFu/7BDKVgfoQdCORwtojHmWsFW+nGzpCKwmahlim6i8B4Er?=
 =?us-ascii?Q?LbI1VngopYK2a21bMmEdY6WZCf6/PY0suGVOMqORR/uNEuFHqVmZDRCLGIyY?=
 =?us-ascii?Q?bNv+oRlvx4srfs+Pf/ECQbnrEkb0Sg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XM5mJ/nxO7Cupkl7xzEYflvpCaCjs1FkAttNh//t1gsKgtcQLYX7A3kUx7qp?=
 =?us-ascii?Q?xgGELR+1qAOjIqC+vH6tkZfwb/C5EaSOeGqWisQyaxOm6u9O6cS1VgsEBGcB?=
 =?us-ascii?Q?DCwmOgLnDizl04FLOEaCN7cyPpMVP4RjBLo+mXoH5QrJ9KMJksA9g1ygER9k?=
 =?us-ascii?Q?KrRnBfX0PcQofMo1qHjsinsPdgRTmjya1vQgrgEsvcOLm0vtq076k8sj8N8F?=
 =?us-ascii?Q?k0mhPf9eO5Wp2XA1qNTcqFSyvr/ObXP44D1c1dIa6AbICw2GsSO6OAG/oPPh?=
 =?us-ascii?Q?M6qSMYAila9WbSK7/r+jCIyJxMOlHxTo4CTJPqpe0vhAicps+cj7+W1hZrV8?=
 =?us-ascii?Q?nRDpOUeB0geYJb2a4We8MIpjFcPRQkDWTWsRZVDYGw/z+/BHRzuxjkeiiKwf?=
 =?us-ascii?Q?3Fre58CDVZRZ6NCYA3g2sPgwNEy4NTFFadoaybLIhGbCCc9BAhAdEC4I2/eO?=
 =?us-ascii?Q?2a4L3uwqY58STHYmEVAcQ6lQTr1it6iK1zVjD6+XPaGDZ1ktLDYetQlMoK2g?=
 =?us-ascii?Q?BjocFFPnArg7Vob7V8yW9kk+pQllf/AlcQkEW31WMJESfwPqI0yJ/kx7UwcX?=
 =?us-ascii?Q?vsiWPd24AbOPEFtI6XB+OE4rR8PCycdnFfGuPwYduR7yoIASep8fKcNEJZRt?=
 =?us-ascii?Q?UQrEd+9Ox0G5+lrnJgrJfQUNwKNZRubAuGTmEman7FIkg85H7qEcPiNUR4Y3?=
 =?us-ascii?Q?afwZetFzh1vSLDcEPaOHDbfLceeC1JMdKp3jeeQIj0Am2JccIFqWVffP1n2s?=
 =?us-ascii?Q?ClUkGQObGq3AmibMPIiVFCP87GnV0aI0Nf8Wgzmi/eqvgEL2Gy72WMnkgHkl?=
 =?us-ascii?Q?vzIalq4jbmzFabN0RGYFRun+6YyYm0Rf5w8twA3BO8AlVobUFGirkSwxRr1p?=
 =?us-ascii?Q?DQMIE7BYcV3I8bLwnX+EBdGZtQmTkKOkvxOSfyCGahs/l4SZCB9L+Sj9lZs6?=
 =?us-ascii?Q?0QtqdVC9jE+D02FfzzvwtFZnPxwbY2niXpQtId23OXjT+T0TjbkM4IjpYlv9?=
 =?us-ascii?Q?eNMzCmPe9LPxO4cQVsNnAopjKSBnv56XIdh9pjI2fyyzcmT2k6nFu2CoVOik?=
 =?us-ascii?Q?TwD8AzyqQjs9WCSKSze3MpXoArZCC1WPDb8PuSCXZ26IDFZRLWkka8DpTnoP?=
 =?us-ascii?Q?D/Fm5Hnlwl6bQUKfPWyTISlSvLO81PBIfc6fV83gGQ8sZFG/UpQIA9T0e98V?=
 =?us-ascii?Q?WmYIWqG05iPhs9wdMqcXkXhOGZF0fR5m6FOmn+uYOxZ4WuV5EEbwdra/owow?=
 =?us-ascii?Q?uS74rP02pUujKqMGxSzWsmef84zpCl/mTo88AH8WBvNF/d8uj1w3I4ryrre0?=
 =?us-ascii?Q?3HbN/+wU7sIWBX5txnQhM++NnUGwE1niK/UJPnG2aAX7LhDm8aQFzNEHu3io?=
 =?us-ascii?Q?03sIBC6rPoCg/QFfjzjS0788Illo?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d959c0e2-db07-4122-88f9-08df13f920ae
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:48:05.5762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3880

On certain 2025 Lenovo laptops, such as the Yoga Pro 7 14ASP10 and Legion
Pro 7 16AFR10H, the F11 key includes a symbol showing a laptop, a tablet
and a smartphone. According to the user manual, the key starts the Lenovo
Smart Connect app, which connects the laptop to phones and tablets.

These laptops send WMI hotkey event 0x48 (scancode 0x148) when the key
is pressed, which is currently reported as KEY_UNKNOWN. Map it to
KEY_LINK_PHONE as the closest match, as thinkpad_acpi does for the
Microsoft Phone Link and Intel Unison keys, see
commit 7ba618e893a4 ("platform/x86: thinkpad_acpi: Add support for new
phone link hotkey") and commit b511bbfe4242 ("platform/x86: thinkpad_acpi:
handle HKEY 0x1402 event").

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 8213524504ee..94ffc565296b 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1358,6 +1358,8 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
 	/* Eye */
 	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
+	/* Lenovo Smart Connect */
+	{ KE_KEY,	0x48 | IDEAPAD_WMI_KEY, { KEY_LINK_PHONE } },
 	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
 	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
 	/* shift + prtsc */

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0

