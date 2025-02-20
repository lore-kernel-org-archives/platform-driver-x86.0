Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2104.outbound.protection.outlook.com [40.107.94.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA6020CCE6
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2025 17:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740072237; cv=fail; b=G8wLiBTqp2SL55QRM2/Nku8cha90PTMuoqKK6lxwiQ5vKd04QoqLGG2US/VV8TrL0fQFsWBhriuBLepWHcFEIPyvTDKEvxBQUEcjqZyE4agqoeGBNkWz12jwvFAs0TvZgeubGqOISZelzqaUaEwXJfYN1Xr2qpcJ8b1Fa7osN9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740072237; c=relaxed/simple;
	bh=aDU/CA/8mssccocRD+qEFybKK2ihwqXUK9Z0I6TikPs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Wa3I8SQS/BAhxZLx6bD3+WKtHzC86ll99kjWzqRCjrvUJxA1OihBKZ1aQCfWsSTX5Q7JMu+AiYJpp5O+hd/UPe+2rgLwASNaKMM/cqf8m6dt9rpC9aXKGxccwsqSBuKaQ3p0aEGIT4p2vM1QHV8ByGkgcZcZSwztbe3UQR1yIzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ipt.br; spf=pass smtp.mailfrom=ipt.br; dkim=pass (1024-bit key) header.d=ipt.br header.i=@ipt.br header.b=dLPw5/cz; arc=fail smtp.client-ip=40.107.94.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ipt.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipt.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ipt.br header.i=@ipt.br header.b="dLPw5/cz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6I0vLPcTf7XJL84KWwb/JlvZepZtuGsGE42ipz71gu8CsXzy7mcVwVC6WVf6u0YSoshBMtcJZJnLCUZH2hX9tiyuY1cpQtQs6inDmkrYKFMPMKSpeONxIKXoZJUSy20y0K2/ee9BY0CBIl4dBpQgiTRrJ/cc/W4wSDq3xAV/8OOW8FdJedWw+LFEO+EV6rNnBH92ioG0Tu0XuaLnvzYos1cc/+QpDcDDuN0LyxeaksqE/ET85u2xsf9zJfHh6f86fk0IiTvuvD/j5CHzkTv/6Izzl6caiKrH20wTpoTseNI0TeUkmYyvR75Hyz8MZNac7Nh4FMYl426O7volS8mbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jipqbNFMrOhoElzZn3YEuYEMuszK21IcDdJHtGx4tOI=;
 b=BM3Vhf/m9UwywZvmkVMRDpLQqpQV0X+61H5uzeT/yqNWOei4a7G7OMi5tjb3mo3aFqey+AjiFp3dOoSeF+A74kchEnHw1wOJacaWEYHaOgBeOZUN8GgsKknk/JYz+ADJVwNCPe0Vw/QxSLdjb035jDr4pMsaEewnTGDZjP9E+dPfZkKKzjIdY/DYYavKWkB0jt5FufySTPhLoV5NxpEIk/2fMhn4K5KorcSk2yTBKT4TA8CZqxa/VfwobWIWOErZ/HLwO4tRQBXMkSGNBQpe6TK3o/QF1mA7qazBunGj3Dpw3j8VED9RJVc2Gj1RA/P+xDKnhXzsfE5TheuXkZDpyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ipt.br; dmarc=pass action=none header.from=ipt.br; dkim=pass
 header.d=ipt.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ipt.br; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jipqbNFMrOhoElzZn3YEuYEMuszK21IcDdJHtGx4tOI=;
 b=dLPw5/czEIOJCu/cO72/SRL+yrXtGxjgxlsWtu2GsBlnL/8mJ2rELABn5h6RKE7kkh6Bi93YLCuoIlVkPBa9Rx18Kr7NVJsm7Hj9Ig/cMhGEToRGQ1EBguVbcHTI1WYbMXzJXAj5791C64r7fBfwuTmjYUvPYXVm/0WMQYf/P/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ipt.br;
Received: from SCZP152MB5520.LAMP152.PROD.OUTLOOK.COM (2603:10d6:300:20::10)
 by CPWP152MB4613.LAMP152.PROD.OUTLOOK.COM (2603:10d6:103:12e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Thu, 20 Feb
 2025 17:23:50 +0000
Received: from SCZP152MB5520.LAMP152.PROD.OUTLOOK.COM
 ([fe80::f21e:b9ca:4738:fe43]) by SCZP152MB5520.LAMP152.PROD.OUTLOOK.COM
 ([fe80::f21e:b9ca:4738:fe43%6]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 17:23:49 +0000
From: Matheus Polkorny <mpolkorny@ipt.br>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	mpolkorny@ipt.br
Subject: [PATCH] platform/x86: ideapad-laptop: Userspace expects F20 for mic-mute
Date: Thu, 20 Feb 2025 14:19:43 -0300
Message-ID: <20250220171942.1381605-2-mpolkorny@ipt.br>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:208:32a::21) To SCZP152MB5520.LAMP152.PROD.OUTLOOK.COM
 (2603:10d6:300:20::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SCZP152MB5520:EE_|CPWP152MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: cc45e726-5c36-4da7-9295-08dd51d356bb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QT5yoqA5Yv0+DTbBFbbgJOWcqb2YnHJPj3DIiJ7ejFi0rQf0RdBx/fjfPIll?=
 =?us-ascii?Q?I4TgaAO2uDJXBEPhmJN//Q6pC0jKFe7BzJwBc9/O53MPcJMXSf2JjpZFanKA?=
 =?us-ascii?Q?zwZ8nA8QBYJjSSjV3EXoyvr36vsLMu1lrhOSbWP0R24+XoyfQsnJaCHiSI1X?=
 =?us-ascii?Q?I1W55TGoF7c93HUoYx40juVsn6GuKdNx0zG/dDY4OIdrDdZbP7EYLwS3L2zY?=
 =?us-ascii?Q?t0jJ60jorBNvch+l25CPwBfskplm1Q+gHSvdBMx+8GnrH2EDbfBkKm/fSEos?=
 =?us-ascii?Q?oBXwQCeOWEHY5AbLSaveX2/+Dwm8sM5KJX4PTmhShzEsuS7XkIGW1zBc0ign?=
 =?us-ascii?Q?qOvJwzBeMN3VubPoB5cVYzb/7waGy0+5KbclWHusZQXq9e8UPAhb8tidBm6K?=
 =?us-ascii?Q?XglbxGF6CjoO2BNaqlQlpVsNLnda/oOjm0vczQSQl4UjJ/dK4GoV8B3Blhth?=
 =?us-ascii?Q?cuK1K2PomKvU59RkxsJZ+Y/WKRbsJSXjD/eguFmmbiYMCrWfJdJBIQS361x9?=
 =?us-ascii?Q?5g3r5TUwGwfmVaFcsNchVRlUpNcaXN65RWZ2Cuv1S3kiVo/p3Dy6ogigwuCs?=
 =?us-ascii?Q?A3gsBSIqImS0xu72R/63EzpOKjIEmWuK1MVEtr7reiTLjj7x+hHJflU8IC9/?=
 =?us-ascii?Q?gfysqiS0P0vWdeEfm/TnWc4EZnFDgPaogzht4SuCgAPKM+uUxGWqmmqU+msc?=
 =?us-ascii?Q?6Ujwr3g7C2tWOdaiFciLpxOEoYrgupDIplgOGudEu59xbSJ4HL3t+ogOp6Uq?=
 =?us-ascii?Q?y6x1nLKFlBkBo6BjIdbMDaiXIBS3VvyNDHY94p9UW/0mJhyYB4BDDKYZrasq?=
 =?us-ascii?Q?4aoXRkdeA5eGRVPSKkfj47K3Khr22m//rEl1YLYn/otdo8UFvY5RcWeM7CXE?=
 =?us-ascii?Q?fjrJBLsMEm19pw3CouPyXER2N4cOBrWxaHLPiq1jl+Ugf7bzgDYVP0fT7963?=
 =?us-ascii?Q?ZNk+HQ9k6VMUFhkvaLCBigOK6Y5TbEbEATylP9g0dIxpI+by2bra6N1Cjqrl?=
 =?us-ascii?Q?VR7nVJY/doBWcuNtNReBoALQn0tY/do/byMT/4soqofVWi4Jo3QSoLReswUf?=
 =?us-ascii?Q?zcNXku8YDjchvourax63sC48XOPuuJq6Dh2MQTNPRy1hLo6p1kAS17ccC2BA?=
 =?us-ascii?Q?VOUYPA3EY+moOCMamUthttu4hqyB7s4DvvxIXtMyLUlLTl0FhteFtW4yJQp2?=
 =?us-ascii?Q?g/sUQ/2totN91uNyuYtcjBebtgKDqB7n9g+moF88FSilLw6Ir4see93CG8Ul?=
 =?us-ascii?Q?ZltHW/6/QXYsqchRXZnE0NUoHKv5cB4GQFI4af0UDG4RVaPT91szca4Yp0zQ?=
 =?us-ascii?Q?EI5kYsDklAG9lByv9Nao2urn2ATtqrcywbv2YI1YQJm1lzltOnJs8KDlbVo2?=
 =?us-ascii?Q?V8vsL+LB+4mvEqzfoN1q2r+NIkP8Sm7WAveF5uz+SYzPFpW9ZWmpk/KAPR+c?=
 =?us-ascii?Q?VjBehh0had47gWk3d7baxT5SeC4aC8st?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SCZP152MB5520.LAMP152.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NheRwYNK+JESKtfA07/TlvdmRaXn6o/wx8z28Yb3LOaNVFJJMMh3QGXoH0dR?=
 =?us-ascii?Q?PRf1e9fTWJc5CE05Bpub4qz4i9vgUkrNx6n4+8hu88IFVpplTTbv/woqyJLv?=
 =?us-ascii?Q?Srd3ydPzNWH5M/26N+We58/VRTdmnqz0349SEKBPakdSxxDRCfRL0GsAlxxs?=
 =?us-ascii?Q?7XSTTc++myPA1Jn4+Albu9g/x8JzKTcoDU/IqvCxIMDjj5sjvCfjG4P4gn09?=
 =?us-ascii?Q?FIJmJ72OAxpyeRCU1J4i6F2qalgV4pYsKFvJNxbANEuloCyOQTSxH4+Zk0fa?=
 =?us-ascii?Q?Hn0Jtdp50aiBwVrqAKfbna5cIB/+vXNWRxg+0gg7NwU+h0Vz0+ZhU7Lxu/yC?=
 =?us-ascii?Q?JODlC4DbMvypakBXQdNq+iwK6xNfyP+t3OwIJ7aVmJ7HOdFBD51mPnk0AkQR?=
 =?us-ascii?Q?xMjt84epWqzFLaXRHcH4mz4B4JaKspAxb8SCVv43jeEX+Yhzx90vR3b2HPOO?=
 =?us-ascii?Q?/zMw6sdxZOjzQOJ5nQD88WzNMH21JUytsvjZ8m2F3fUNsUnvmmvzKmmVfvGm?=
 =?us-ascii?Q?gR9ZvTkAZzJPWCCDtCPWsneRvuG7V2LfHWDq9T0TQwnAO6MhNym6wrxl0Sdz?=
 =?us-ascii?Q?WlgrvKTZ/4kxBVfe7bVj8w784od984eETn2bx728irG//3yrRBtcQXl1ZB51?=
 =?us-ascii?Q?V+E3lDEqecsQbEJZ7EK0Hk3/vvtHe6ktnRx+n1CanMTaQAODhG8b8paV9tnZ?=
 =?us-ascii?Q?14BDaL/ZqcTIMwOtl17EKLUaOpaCcfhmJKz70zX30mNAR3vinMZhY0HmDtc7?=
 =?us-ascii?Q?0qR4RX5U4JLY+uaqNIqHARuvpkAHHrzZl2XDfHEtuB3Ugpq/fugXL4oRSaAs?=
 =?us-ascii?Q?wH3feHQJ5sMcCFf1ActajfHoXNf6N6upZ5V7YiphQ1gbJl3OJRMao82L3XGz?=
 =?us-ascii?Q?jPU+7/lsntSZbM+D6gDIXXGH/C8ee5CBCWkrQEJzEvI4xrULg1XB2aDYiMXv?=
 =?us-ascii?Q?q7UhKhIkPVfJ/eIIrW4bOaae3WkHWbFY6B5ITxQjh46KDQiTHxJif/qYJd5m?=
 =?us-ascii?Q?ZN3h5Lg5sflDgeCGbLc6Hu/VJNhKn/4yH7phgRiGXZTWIpNlYa1/nAj91WTA?=
 =?us-ascii?Q?Gi3ra+TRsa949IiVWQ0Fg/uJ/FbKA6BD/l7oXVMgOKhLutDixSRg2xJii2Vb?=
 =?us-ascii?Q?r8CEQ50G2BQHUxiK+zI44Nkk8qXHPrticnFil5AqIUVmkXceIE67bP5tPBDM?=
 =?us-ascii?Q?jvGKqatX8UxMGhl8jRGLWCIyUhh5dhrTUQIcmVH12C0u4lt4vqG5tacztYhQ?=
 =?us-ascii?Q?MW69tiyHocv0jdEaUxro1NXBWWv95wJYMIpScTIba9POj6z8xzjLjGWyCpqb?=
 =?us-ascii?Q?RLNQ/55oajl4p/M8aTJxO/iN/OshiRjcw/Ce07eoEYO3nKUbf3u3AL6thIE0?=
 =?us-ascii?Q?Ey6KTdBBC6UA1MhVgcJfoLijmqNDFnystECPuUZ9s+t+lbFBxlv01wARnbRp?=
 =?us-ascii?Q?f30o5FNjPD7esV0p+br2ykwqSnIE0EOC7n6gHmmmhcr1AidZN3dY2e67YyvH?=
 =?us-ascii?Q?7uttPjpI5MSEup5RZFRTzQZ3HRqR161XmpxkkoBl0lW+TVE6dt0hL/P+86aO?=
 =?us-ascii?Q?VeeeMLenP23hvA2UZSVjCoULgtSv042JZ3+vJyDt?=
X-OriginatorOrg: ipt.br
X-MS-Exchange-CrossTenant-Network-Message-Id: cc45e726-5c36-4da7-9295-08dd51d356bb
X-MS-Exchange-CrossTenant-AuthSource: SCZP152MB5520.LAMP152.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 17:23:49.5815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aab57f47-5b85-4924-8047-691190100bd7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZIQGvdh5qX2UKBeaF8RLCSN9ngAYrKwSDifazvPaDiLhb6oOJcb1kXOgSTD2N4wN8uMqZIMvcF66JnUjgv0MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPWP152MB4613

In Lenovo LOQ 15IRX9, userspace expects F20 for mic-mute
KEY_MICMUTE does not work.
Other machines, such as LOQ 15APH8 and LOQ 15IRH8, also
use F20 for mic-mute.

Signed-off-by: Matheus Polkorny <mpolkorny@ipt.br>
---
 drivers/platform/x86/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 30bd366d7b58..6420e28c08ec 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1306,7 +1306,7 @@ static const struct key_entry ideapad_keymap[] = {
 	/* Refresh Rate Toggle */
 	{ KE_KEY,	0x0a | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
 	/* Specific to some newer models */
-	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
+	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_F20 } },
 	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
 
 	{ KE_END },
-- 
2.47.2

