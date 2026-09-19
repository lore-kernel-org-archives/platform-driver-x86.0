Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012052.outbound.protection.outlook.com [52.103.66.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA13C13EE;
	Sat, 19 Sep 2026 01:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789781205; cv=fail; b=NLJ9Wa8ly9m5r1sB47g8kh1JNZsXdNSmMZUeKQV8KyV+GhgugMnIwI+59ZttD1bBCUIlMGqKG84ovuY7A2Ea56Wy8QecEQTV9t+0f93Me1s0DYV8fE5r4z+ewJPj2jyNp/1Aq0EOM8XRvQScEoWEZQTTu4hsgk241V3zd4MMTL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789781205; c=relaxed/simple;
	bh=aKyg/WHO2otJzihpJDmRmI0Es37egZBaVUCjuKPslZU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IlYe/Aj/f7PTx9xhXFk52UjJoHrr5k+3urCthenKBWpybPbPN4nvcVCJJBD0XZ+TAtxkTW68kqsG8QfepgowIbPjHZBzO+70ryaNklwgr6SdYTlYINle6B6ePiufGWOtSIw8bQZVmA+z0CMlbamCppqMbMxRAUvi0Ia24+qQIH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=iFxDUA3w; arc=fail smtp.client-ip=52.103.66.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="iFxDUA3w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afsUUa8VlSkEBMea0UqEPf6hbb1SuWJXV8jpWPP9t4l4nbnLDRjVIAGeI1ub8CorFWp9cWb1Q6w7XcBIc+lZVMJ8gl8obnp1fBObtQUQR1hCpFgjyVUUTiBo1J/5VaZD3HEDyNi/siQCNxeVe2iAKYVqmAyXAH6vHvwne5bXR9aQuNyThttHLA3JI0nJscIjQWV1KUdJy8QEflL6G5mCoCzr+RfRCo8hBmxhWraFwMLJDmqLbhIp6QlPiDZ2UmIWq2CfSN8pN8zaTVmJoJMu7y6rDerDaG2JtaTI+8af+VwM3AqIaaLssYYeMaVDyQ7tbwFTQtZSJusyQ0c0zTsMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWgec04BtzHmHaRoOjR1HC5+JJq2CR1Zv89dFnEL7fQ=;
 b=rr4I2jwyHT1//XsLinwdqcam2MDqVRyBWGv9RUauQAnWLP8un0d8WjbZWx7reIFW6mjFgCBvx8tq+FXf5n6bRLTdUV8js9y/5+NirCKId8BJGJ4exwC6qkDEc5LJO2NvYTNmWNi9FsU3QupY9eJFxd5fy8EViYuudliY4Ebq+2t/S0AWgd8JWuw5kOenoopB6yHkQPMagJCqwFUGjYomWCrvZFVnj4jcR+RCtj1lHEg3xNSkhBppNWJ3BG6j4+AOz+9hIzJhqEML3MKueLa6cltOFePgC5S+ojZgivv8W0a6X3heCwEqTgH2iAGCgOID6q2TGm72X4nqmJX+DSZGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWgec04BtzHmHaRoOjR1HC5+JJq2CR1Zv89dFnEL7fQ=;
 b=iFxDUA3wv5N8IB0fuFJMwOSbSWbNopXfE+oDJ1eYSSYjx56x2UECCiPF47B/o+T0BO+4Dwyv9W9uzX9Vgxe0sc+pfkWF0WiOOp8Zt9L4VpAA9smyf32/CwzU5JQKlB96igXLooFMsyHQTW+ZbsVZg6gK9IixQqVMABkBFnpzzEUoGGI2/DF60LgnEvzmy3LeWa6VGfEIDdvTsewGApkebQwpE94wmmIha5xa1E3/mYAjrBobQ9RFcmvOJA3s/Kwj/zv3QaC1aBOtmqJLtLebG9Aw3KuzWhYhiaJIFwzWTLO5nIRCPKwJ44vQHnLofxpQh0lgfCzDiIAt8bZDAaiYzA==
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com (2603:1096:4:1eb::6) by
 SEZPR04MB6624.apcprd04.prod.outlook.com (2603:1096:101:99::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.14; Sat, 19 Sep 2026 01:26:37 +0000
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9]) by SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9%3]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 01:26:36 +0000
From: Shuwen Bao <baoshuwen2013@outlook.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>,
	Emre Cecanpunar <emreleno@gmail.com>,
	Suryansh Singh <technosfan14@gmail.com>,
	Radhey Kalra <radheykalra901@gmail.com>,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuwen Bao <baoshuwen2013@outlook.com>
Subject: [PATCH v2] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
Date: Sat, 19 Sep 2026 09:24:25 +0800
Message-ID:
 <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::7) To SI2PR04MB5895.apcprd04.prod.outlook.com
 (2603:1096:4:1eb::6)
X-Microsoft-Original-Message-ID:
 <20260919012425.32668-1-baoshuwen2013@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR04MB5895:EE_|SEZPR04MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3e9eac-93b2-4115-9dab-08df15ed0c2b
X-MS-Exchange-SLBlob-MailProps:
	AZnQBsB9XmrTkIzDOCxR6E7nJ4I/6XZ7SNfM9dEvY0vt488imBSxeakpyzQ+pd1HrX7xYdjcn1ODmv9awblyHUHXcg1CD08dpYB+29fRNgz0DdoQyOmRG26kXi0ZhdzPC8FJ7tmrrTLvXHnu+/k/t6xzWQykMtexDtlN3kvX1EgXvq3Lq3zSA2GklZxUHKjrhzX1N4rHmn9BZpPVuyfTsU8mZjdPDLtqtrzrSuD+vb26SqBOJEL1WIHo6uNbOjLlK3yvBuoDOEP07nDoxnvlcZhAWOFbwHqnjhEpTZWn3c/xx6PUN3nVdKQi+t1KcOYiLFxV3D0pxTS2ioDX1MezbUQZ8aBNQV9oCm5cXnO8nskgVm4fe7zNO+jHKhfrqVAU1rfwZ4w7s5d1V9rsFMaladR7kr8aLjI+tGHEMxPKYAyT4Zu8c0tlU+/UmM76qDLreiytEmFMeakoExeSRcEQBbF4aZ/JhkXImpTwA5I+iDXqOJPbjISROSYHTUWJjPvPZfCJ7+W/0qILrYOz2M3qmINhIhNktyz+Qc+y9gy84kN4wEmwR0SM4yX3jZwyny7NePx2nW4/TmPgI38G/L3BuVnrE0xzB+3gT/2r602oDH+zP8uz2BhxAGktNutQ6cKMMT5OGaL7JR7raN9jvfS3QBBi9f14yKCenopASsFgJcgyDatFeOpTmK7P0dA2/ronqc+746sTGJKCUc62ewQbFUlEtj3B7b+8yp2HB2yFaQSIy7qMOBD3YK2YtHJn1peFHi6JxjcbVhw=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|5062599005|23021999003|15080799012|25031999004|22091999003|8060799015|19110799012|4140399003|25010399006|24021099003|16041099003|440099028|3412199025|53005399003|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?//apIjtzCVUG8OYEdUToLYVVKs46vot9EGbocrLk0gNfaE1gHPBFspqieTBi?=
 =?us-ascii?Q?befHARYGjelVI3i7rbi2DsGxKHCVPt9y7pLukxHYWEh5s2TqhUe0EdfDIpN1?=
 =?us-ascii?Q?Vlgv7zS2cDcoDTSIGfprgwbJ0YCTvjMwChi5ZlwPvzCqwRZo2nQuaKcvktHB?=
 =?us-ascii?Q?S1Eafnktg5IDAXI/kYRhUBOKGq3Npt+kffizEfgLIht4QO8RO4lEZEiZFnzj?=
 =?us-ascii?Q?DrJJcWsx2FiuQ/nE3ANbDIYXmQmAPN2YfAMIwxl1Bgiw/HlNCl3FtkhqYhgn?=
 =?us-ascii?Q?HimeNgs64M143FzBesv2vJOqCEGdsDGIbeJBFYi6++xIs/DVJtWwusxWAuje?=
 =?us-ascii?Q?Kk91ET1sq9B+WocxFTFOsDPN42QRrVMR/+J1Dp1yMyf526KT2BHo2qHTgzvw?=
 =?us-ascii?Q?n8DCAAlpAfFVSRbrvxAhGBvHjgCa/vlqIjrLiDsGPekDwc8EM92Cx76FrUNV?=
 =?us-ascii?Q?9Qw45hMcZ6DrysR+lMJMpqGfe7intrwtU3scTGBgGUIaSZ0rPq0DyjZ+vIcp?=
 =?us-ascii?Q?pdinVeOyUfMCDTTuH2xm4SWDmDN5Ht5Nm5sVUE6cIa/wNmoNaN9b5wEwIFY7?=
 =?us-ascii?Q?pBRzS1t4oysgw1uF8ko05QJ+UVeAisNAYiy8rOabUXgDYyTw/CpZCe9Z5xbx?=
 =?us-ascii?Q?q1MS9IJmZtwsUTrbc+uPAXtCx0EFuG+48PoSNh8ysfGVleYYAth4mwdXmWst?=
 =?us-ascii?Q?P1Fkzt6jg5o0ea8ztUL69d1J9oGYM1A9p/6IbjxlSHG47GUqIjiGvAYEmi/q?=
 =?us-ascii?Q?JNISxUImwtTTtFSv3Eax6GvOuMTBew9A61pbAPx7EPisRhTd3iCO0eZQaZ24?=
 =?us-ascii?Q?Z1uy+DbeLrbJ4l2IcLCtTWPxIVqjSbl11WClGwCSC/D1h3yoXFjcqM5TfmrR?=
 =?us-ascii?Q?i9tLVPgIj4H5DgyeefTbBa5jThNRizDn4ZButxt7wVaMIERrhHSRMfU025Ds?=
 =?us-ascii?Q?LMXQVHDvwrCgLuKWs5X5fWSrJt5MM8sLNIjVe2BzG49AVmZkWafmzD4K7kvY?=
 =?us-ascii?Q?qbikK0yzru+b5tHk4865OGzqqgLtYWtDvCCu0Xnlf3mMQwC//+zpqZeGY9DW?=
 =?us-ascii?Q?8cg2hnXTVqG0dhP2nQNCUwm+zVc68A=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YWWqJL6IcJMqQlxDj2ztUUJ0hRnvjW2E1i3tLwRwoTPSPGfEp9k00bsVdUWX?=
 =?us-ascii?Q?PjwWSAbo9JmWJYHYxOMTmxubPLv6PM8z7d9zeO4XUaOUoC6k2qGHUDkqe8AI?=
 =?us-ascii?Q?u0eZRyhaF6NbooKRI198K/pdun/xoPE2AC8TQpFbXiQHpyas3K7F4Sjuiqr9?=
 =?us-ascii?Q?Q7GiI6lbeKg5q2aIMCeNIisZ7luoS9B6ihreh8ipFLdkpYC5+rxslkhKZKxL?=
 =?us-ascii?Q?ijn/Cf6+jtCogk8uh2XX8+LdSsecY/Li/Z23IF3zzjA/QuGVcIMtLtZeEN6s?=
 =?us-ascii?Q?QkNRuwjg5+im1UrCsjdgoSBS2HnyoVHWwUk7pV5TB0ksOCbvPDFLYM1g3FQC?=
 =?us-ascii?Q?anaUrj+4mi96eATaBcmsmKWwgnMFtH4fF+LZpnvnhKsRbaoc+iDSksUh0NSu?=
 =?us-ascii?Q?aNooqRY3gLv/L0LNs1zGVS5RllsgL7RBRgcF8lADbpGFP+HNktOfyH7puNPA?=
 =?us-ascii?Q?oGZ08sRIOjT0zWPk6PJha7mEuB5hR2l6u1NoJ5e+3nyPHk4ciYc6NculmkgU?=
 =?us-ascii?Q?ks4QUhQG54uLQ/LqMO+UDPEjY54MTKdUp9W/nKj0KUqNMPuB4Da7YSaOLUKx?=
 =?us-ascii?Q?+8F12YQgWlzkABbUM08ksQPnQuCaNT7Af9UQd9i1t0yY2aFDrpCYAOaVHVLs?=
 =?us-ascii?Q?ylm8PLVZTeR5diI8BiA0FD7Gl/kQEkVORDq1gvEdg1AtZy778XnFN3DtAil8?=
 =?us-ascii?Q?kOocNsaFm7z4q4pHAlBAhNcNk0ZaW/Vvq98mZNRayXfkDbELtRDnZPkD9809?=
 =?us-ascii?Q?Gd+JhTzzTJYXfa6SVx9NTA8revpDCmZ922VvSonb5BVNzQ6Gb5g4cHQxodmf?=
 =?us-ascii?Q?zhnXr47OFM2laMpCFJk/7Lj6LPmCQBr4G0RKBbIWsXwFOpMATMcKmoN/VlsF?=
 =?us-ascii?Q?Yrfr6ugvoig1LdBtjmqjs1E76TRui9mWjBkj+H/mWHL8jORsNI7l6UUN6Y6A?=
 =?us-ascii?Q?/LA2D+xy8iK3di+pv+8ypqUsnHafrw+H0hn+OtEmW69fgoHNgb0Cu4ElRqPh?=
 =?us-ascii?Q?8R4MoErJoIZMIznAjsGCyMokSmVbyRslzk3pmhxQPc4JyPaqO74+RXLWEnLl?=
 =?us-ascii?Q?SMU9HUjmljJjhbdMZiElCfLN/BtC7v5KvqW6Hg0csLxsp8de2wJbyR04Jns4?=
 =?us-ascii?Q?C3zsiVaUFiKvcRXimFV6GUp3ldcN7rcRfMzsTXqWnsdqJ9y0kgNzGEbBk3JQ?=
 =?us-ascii?Q?OkijDzNI/3hKSg/r89Gk9bQNJgloz2KXcqE+5atCTDOnD4O2RsIC5NV7yyCR?=
 =?us-ascii?Q?1qtrh3uh/yIk02I94cs/MqAXRL1qSH6byUZtRLLLP68MakpmR2QUNZ3g1+3s?=
 =?us-ascii?Q?A4cgy0YIjkeeEL58s5xTTS91VnwbqKGQlQnXuAEj52EHkhnliTx/HBDEmqxq?=
 =?us-ascii?Q?R3/Tl683OOK2A/hPbO+qptVBwODl?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3e9eac-93b2-4115-9dab-08df15ed0c2b
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB5895.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 01:26:36.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6624

The HP HyperX OMEN 16-am2xxx (DMI board 8F1C, 26C1 platform cycle,
Arrow Lake-HXR) is listed in the OMEN Command Center device
capability table with DisplayName "HyperX OMEN 16" and the
"PerformanceControl" feature, but is missing from the kernel's
omen_thermal_profile_boards whitelist. The thermal profile path is
therefore not enabled and the embedded controller keeps the CPU
pinned at the default frequency cap while running Linux.

Add 8F1C to the OMEN thermal profile board list. On this platform
the EC firmware also arms its own thermal profile revert timer (EC
offset 0x63, armed with 0x5a when performance is selected) and
switches back to the balanced profile once it expires, so also add
the board to omen_timed_thermal_profile_boards in order to have the
driver clear the timer and set the NOTIMER|TURBO flags when
switching to the performance profile. Testing further showed that
this board uses v0 commands, so also add it to
omen_thermal_profile_force_v0_boards.

Tested on a HyperX OMEN 16-am2xxx: after loading the patched hp-wmi
module the platform_profile interface is exposed, and switching to
the performance profile raises the CPU from a ~2.9 GHz (P-core) /
2.6 GHz (E-core) cap to ~4.8 GHz / ~4.3 GHz under a single-thread
load. The EC then reports the performance profile (0x31) with the
NOTIMER|TURBO flags set (0x62=0x06) and the revert timer cleared
(0x63=0x00); a plain write of the profile without those flags
instead arms the timer (0x63=0x5a) and the profile reverts to
balanced when it expires.

Signed-off-by: Shuwen Bao <baoshuwen2013@outlook.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 615b4cf6fc45..f229da54366a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -211,6 +211,7 @@ static const char * const omen_thermal_profile_boards[] = {
 	"8BAD",
 	"8C58",
 	"8E41",
+	"8F1C",
 };
 
 /* DMI Board names of Omen laptops that are specifically set to be thermal
@@ -220,6 +221,7 @@ static const char * const omen_thermal_profile_boards[] = {
 static const char * const omen_thermal_profile_force_v0_boards[] = {
 	"8607",
 	"8746", "8747", "8748", "8749", "874A",
+	"8F1C",
 };
 
 /* DMI board names of Omen laptops that have a thermal profile timer which will
@@ -229,6 +231,7 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
 static const char * const omen_timed_thermal_profile_boards[] = {
 	"8A15", "8A42",
 	"8BAD",
+	"8F1C",
 };
 
 /* DMI Board names of Victus 16-d laptops */
-- 
2.53.0

