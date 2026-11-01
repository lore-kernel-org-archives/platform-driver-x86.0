Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793496410;
	b=dLdD3Q/EDgIYExrlhaKfFnVZQHMPGYJ2oMsf53DQ1ZsI4lvDD3QpJIt/qr5zvryQOlqB
	 mLnhQTSPPja6bsIa6oTDb+9SRiSMEieNeIkHZeqszhpi68w/N+aU7h3E/S6FVoT6AEPWU
	 mPPH+JyJqEX049zgVGuL2GbXXW9/sW1k9TRIlhBfOFp4o/r0vVfPQcr31tPe7GMbXubNp
	 7pz6EUatS7rDCDi1KmmphbNeBefO4dQ3LZoYRtA5h0Lc/PvinpHcPkg7BfB1JUZ5WgEYr
	 FGC5i9ULSwNgDJGR061aubR9vkFuEHRkubS7E5icSo3ByeHTf57if0VZ1HGAN150P+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793496410;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rAFixAvi+95MOlhfZLeYey03YNWt1baEcXJC2CbKc44=;
	b=5Oyr72njxsOcPbwXpHRkdvo32nj8G32z/IUeOzBVZrW8kez2N2uMKpANb9lu3jLcZSdd
	 CJTPNGs8n6qd6wQPq693+fPZGfSJJaRGRwOpeVUIs8RJm04x++flQYBqWAj9mbUhDfHqF
	 95y1Op1uuWCe9zNjfWlAeFoM/O6HTqDN/Q9H93MZWbh2va65v/IKzeGcuMV1pD3h5fhSt
	 jR6NezYFceSe6otOVPOKHtuPG+dsP/9+PdLhc92Me9QW/6w07chMTH5WIzIY5VDgMk2dl
	 fozeqQRv6FzieYkV7pMon6qmu+lXIMzTpA84aDSFSsmmbjoJVfs5ZhiXrMUqDjve4rQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=DDWwdPzk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.6
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010006.outbound.protection.outlook.com [52.103.43.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC91F606A31C;
	Sun,  1 Nov 2026 01:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC91F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=DDWwdPzk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gX606ypevU8BW0evL+f2WOHbRiNJyFz4IBBfapGJFFfaESQ8CxhMZ538aeP0CANt5iRpmLcrdD4ThXyuhcw/eNFmC5POVGqsdrrk5Evz8jWv0RGLB80AjObrdatqTOXJ++FqgcVjDwnA49tZyOrwJ5CMayXitmzhPh0B1bizpekg9RUahE+L8GehZLlOdwrlK9cH0QTLywLUyX/luBLifmiZxCHiiSgi1PBNFo+dm1K1UANZhcdqDx1IkGK8vNAh2r7MoL9kO4B3wtyyZfGHJIAWXffbl7bOXTiH4FrGs6KTITVCAAF25hIdCluTfjcB/78cEPNWtyHfHCVUMeSZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAFixAvi+95MOlhfZLeYey03YNWt1baEcXJC2CbKc44=;
 b=Sgqe2yGcik+v1tJBHt43e+TCFq8kX6oEGD47Ok96PV6+h5oJrll0BPgJotWxA8aAncMhE1iXQog9IxKAQVwQhqmBNKKIXV/vUrl5C/b+mj5P6qKa9TzshqSL9tENPECQRxEub+/99vhTxhmC3ecbw4J2lwbuixCF4vetdYAMqDjpnWW0GWfMarH1NHhlbRXmb/0p+MLRi78KF4GRmiBegOlzD5McS5u0XIZ57wdtS2EG4Dny2hxvamUf2M9M3mPru/FUI2kvP/k8i3UwriQSv6o+ehTXRSU/dtHCCuLB81AEKwMsUdoe+Huhs05y2sRz6WZPZywuvBiz6/fUiKTjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAFixAvi+95MOlhfZLeYey03YNWt1baEcXJC2CbKc44=;
 b=DDWwdPzkpM2cYrbLKjhmaI+Ox0ivOUDNbSdY06ngy5dlzQPETykqqIh04FenmlfZUr9F+/6ylngnZ2/ygcIquNgTWJrAWwL58cgYx/rBT0B1e/AUSkFPfZni1DBccJKh65o1UVTAoxXCW+991W3OQsw/aVRvmbkHMs4yzyWEEw4FsmUqb1xI3WB+TStnQWpv54GH2OJ7HYIX+OhdlKxZlJfQW4phCkwUrMYcf7D7TUXytjar/+jBVD/8K52WQh3Pl0cTIcOo33xrwx6EUXptgzouRkWvgyE+eaEvekfEq8ZrmqAe9uqSOwxC0bML0coP9c4RYOLEX0ED7tUEE4d/JA==
Received: from TY7PR01MB13746.jpnprd01.prod.outlook.com (2603:1096:405:1eb::8)
 by TYCPR01MB10589.jpnprd01.prod.outlook.com (2603:1096:400:307::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Sun, 1 Nov
 2026 01:26:45 +0000
Received: from TY7PR01MB13746.jpnprd01.prod.outlook.com
 ([fe80::a4eb:52b:9f18:eae0]) by TY7PR01MB13746.jpnprd01.prod.outlook.com
 ([fe80::a4eb:52b:9f18:eae0%6]) with mapi id 15.21.0569.010; Sun, 1 Nov 2026
 01:26:44 +0000
From: Jiajun Leng <adolphpi@outlook.com>
To: platform-driver-x86@vger.kernel.org
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Jiajun Leng <adolphpi@outlook.com>
Subject: [PATCH] platform/x86: oxpec: add OneXPlayer X2 Mini (G3E) DMI entry
Date: Sun,  1 Nov 2026 09:26:33 +0800
Message-ID:
 <TY7PR01MB1374656B7810521751CB248D4DB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.54.0.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::15) To TY7PR01MB13746.jpnprd01.prod.outlook.com
 (2603:1096:405:1eb::8)
X-Microsoft-Original-Message-ID: <20261101012633.408-1-adolphpi@outlook.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7PR01MB13746:EE_|TYCPR01MB10589:EE_
X-MS-Office365-Filtering-Correlation-Id: e60acd9d-ce70-4ad0-8183-08df37b730bd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|260925184616899003|25010399006|4140399003|22141099003|39105399006|5072599009|8060799015|37011999003|25031999004|19110799012|5062599005|23021999003|15080799012|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/T6KOnCGMuRCGCHTaRI8KwxP52njGkcAlk/Z8kcQCcg3pC48OZITHNnXesFN?=
 =?us-ascii?Q?gteqh31STQbq/bSxf3BrgRwJwwJVYjHPfPr89sqYTXB4RCwuCg9Zz+JKfSem?=
 =?us-ascii?Q?0xZFVLyojIXcgTVc6zFLMo85GjwBf4C//uWhwLxKWNbb4rGS9MOqNtM8th4v?=
 =?us-ascii?Q?kTiMFTLy3UAyb3ptkb0gtdH1L4q3RtPQZmuSOsbzLJYsqBjjJdCeVd5mynMq?=
 =?us-ascii?Q?p7hPGmsHPLv95HdAUBUsKwYIr2AZgMmLGGpMpbhDREHDFQwSi1Ty4bRdhTNX?=
 =?us-ascii?Q?VFC86Ic7ZZHneL5b46dLsiUXN6jkjJuCREnLVPQzIr0/v+70ugC7uvimBWfN?=
 =?us-ascii?Q?sDvSd28mOrge+cmDmUk/1OKh1NgpHy/DW2VFauHNsEb/iVQUevv0oxf1G8Vi?=
 =?us-ascii?Q?KRb8duffxbX7YyDXFh+WjDrSXlikK0IRkapJj2jqs2aCMxdZ4q8P8tI5iG+A?=
 =?us-ascii?Q?mrpVeYHJ9pTr4yFr69Lw4q8pP/EVAUJ46syEEBAMPw1Lc4K4ngv7ArgjXP3n?=
 =?us-ascii?Q?3TdaOMXZp7+E6QQOM1/llOKjuit/70YTrUbTaSckxGWcOA2TH7Y6r+8Ll9tx?=
 =?us-ascii?Q?OTu42595h1xmU/ns3g7uLWazgLMLhjikp/bfyXSEa190Yfph/uQER5w9nsKI?=
 =?us-ascii?Q?/6fJt0Le0WAyIOdWCbQ9rh5mi0kSdGCO52BXi32U5Li969tbJ1RmE7E8RTmB?=
 =?us-ascii?Q?xO+yu339fJfDyqqTEa3rMlnZngYI04ntFMZzboIgJfu32HxfudloC/+QA5Th?=
 =?us-ascii?Q?jeT9ua9qMRyxuT2WS9ppIU1VoF2dXxo5fsHskCZ8iCObXKza+TNRmIjEGwu4?=
 =?us-ascii?Q?a/iPyEb7wLOQ3xdmLLxRXYRXJmG/twQe+OWj8xj7l3h4Cp+9iOkqcb/1hFBw?=
 =?us-ascii?Q?5xBMS5/bjpMO0i2vKrHR97a+0Roq960t9X+7az0qjhkKz/Hg4qRj6YTeiRM+?=
 =?us-ascii?Q?VqpQnJ6o8/oZ1zvmQBur5T3nCMWgHOmztAnNHlDr42ULb4nlgphmyRu6GFAD?=
 =?us-ascii?Q?mqxuC0dtmAG78YLE1hscFbkIqE4WupMKemDqw+WdOkqSY3mTkblw44VO2xhk?=
 =?us-ascii?Q?ClchHDMYSwFSWCFGucNbYZIKY3gIdg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fkfq91+ZFYKWNBllbw/LlgqKNPHuZW1OYkl6+88A2MZMtDPzXe6oAolYLWw8?=
 =?us-ascii?Q?bVYC+UxvrOr/xybglbsHCn6oEbndJgYrRek1o96Rv+LcPjieEX+yLkdozfhF?=
 =?us-ascii?Q?tU0bI8/l3oxF7kTpsEZjzteBiCmoLsaLACXGoTv/N0wt/Ob+wYn53wSlUBR9?=
 =?us-ascii?Q?rOOl3DNpCwplEQrZrNjh6dlQs1ICKwjx+S0rVFQdGKTXSOaiQGpitheQfWQ8?=
 =?us-ascii?Q?eYUhhydJ3HVmRZH4VZaiKbaMZGt6xeRGojtDs+Setav68FCx1oFbLEVI5GQ3?=
 =?us-ascii?Q?JDx4yYzvzhf1p/KYHyKuO7IbmNmKUNsqzLQNge07zHObJByUiGde4qENkhzJ?=
 =?us-ascii?Q?JUs1QT5tDFBK2fKM0xy3zHymWB+p/IyykArZ+HbRq/lIbOyOuvqLrywf1otD?=
 =?us-ascii?Q?j8e7WLNJ1fQ+HR6hsHsVM8sWSCS35V+38XR4xgkK/IKVE/ArvRgeBNLt2G96?=
 =?us-ascii?Q?JISQ0weVZeyvSJnvFOScy1LRjLuqHaBfJFvpxntsC6djaxAGtcsgxqeFjlg9?=
 =?us-ascii?Q?D9VkCVYhjqz4WBCd3x6KUrKaHxU7jph6mGyB+XM4FigJI8Gog4v6Vhl3FYVG?=
 =?us-ascii?Q?qfTM7TkbixSXQlnUPnvQA3L7QaSN66p0TLO/845yW0LXG1etDxx8pOnxmt6v?=
 =?us-ascii?Q?Q0xmnYzmiXKQBf1yOUUxsy1zbZuEHJibOr8jVKGomRqoCLOqqelxfcA1lj7F?=
 =?us-ascii?Q?9xkJC3kzf5cU2A6C6s8ZhJUIuMWxv5eOx12GL0SiKeAes3b57udeDabF/8K4?=
 =?us-ascii?Q?MkvZg3zHTmV9cZTwgn7++f3oXUU26IMR2maIhQoABIKbN516BC7t2vppeZtM?=
 =?us-ascii?Q?jSCG2Q42P6ciDxJNxrxPvrd2wvxyzsKHXr2nSjZOC9po8I2fYf0CBbTLPwhQ?=
 =?us-ascii?Q?YW3t1/MML/HDdm7o5QSWCHBhAocSPJMs5Kgxbr4L4cCKu5ax+rYNdkKR4IKE?=
 =?us-ascii?Q?h9gevJY+0ivdIlMRmLQwQdsXpm9ozEL3dAPDYPj+P8N0BJGtcdgEJzrXYMkl?=
 =?us-ascii?Q?AOG6zlVwbMTGBny/0+l52b8ZIkvSZ9wl37Zz0Z99YxLArCDVy0uVQh+M8bhF?=
 =?us-ascii?Q?qZiY21tBRw2LOG5O6HDjVSv6LGSKhIkEJx5vCuDA9pgz9FKtGg4blHZP6PLY?=
 =?us-ascii?Q?E9zDfrVBtCc9tkL9FdMwk4LKUVvUYQo/Qkw022Hmk8rzJCCYPfA7i/suuJpb?=
 =?us-ascii?Q?7dg8B3877/zN/vbIce2cOQSBbtx/PWW3josNaiWsTt0yQkJnIJZDJ7uaS23a?=
 =?us-ascii?Q?xKNyeLDQeZMeOBRuqSBC3vNZQb6Ux44uY1v/uP0SR1rWbyQZekd++yRBfftp?=
 =?us-ascii?Q?MABBIUdOSI/EohwSbGvNKoVrL/w8hrISSSvPIen4BjXsOHvBOIlvaNMl64PI?=
 =?us-ascii?Q?CNumuHkXXr02eclzwf+p/n+0Ady5My/dgOXXg8Au6+XjXQCRaMmjZtgDlOSf?=
 =?us-ascii?Q?sPHrMu9tOC/UAadeKdco7qgJvp/1SnOo?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60acd9d-ce70-4ad0-8183-08df37b730bd
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB13746.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2026 01:26:44.8423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10589

The OneXPlayer X2 Mini (G3E) is the Intel variant and reports DMI board
name "ONEXPLAYER X2Mini". It is not covered by the existing "ONEXPLAYER
X2Mini PRO" entry, which is the AMD board using oxp_fly.

Map it to oxp_g1_i, the profile used by the ONEXPLAYER 3, which has the
same Intel EC layout.

Verified on Bazzite 44 with kernel 7.2.11-ogc4.1.fc44.x86_64: fan
reading, manual PWM and charging control work.

AI assistance: Claude (Anthropic) was used to draft this changelog and the
diff. The submitter reviewed the change, built it as an out-of-tree module
and tested it on the hardware.

Signed-off-by: Jiajun Leng <adolphpi@outlook.com>
---
 drivers/platform/x86/oxpec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index c4c4babe8e30..50d169302fc3 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -230,6 +230,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)oxp_g1_i,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X2Mini"),
+		},
+		.driver_data = (void *)oxp_g1_i,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
-- 
2.53.0

