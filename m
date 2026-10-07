Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012061.outbound.protection.outlook.com [52.103.43.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8D82D3A7C;
	Wed,  7 Oct 2026 03:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342543; cv=fail; b=aBR1Z26HvXcoP7lci2HpODLZGTo4Zz7panHbs7RMh9hu3D0ifN85kOz6V2THYijRmD2mlr8krJlsk7QnPmMW4N5wGUDPehkYERpBl2ircGj6tBhK4oq5hmSjsGJLOfQSlVAOCz6s/BogyDdOROiWYdR8vlNwJ8XG/ZbCTOsEttI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342543; c=relaxed/simple;
	bh=bYq0jhKLp9hgswhcR9fzusdAY1R2w4Jyy7rfz6StwMA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jrqxoqagyuuAxj0ngQF/vfpukA8deJmI2uy98hjoRyRuwdArMDnCUHBJL/QkdJDQpZHpqbvePDgvSGTornhDnV9AbdMeqeasOKoIjbrPceWDl1G3sT7sqSfb2seDMfS0jhF7Sy5kAg+FoASeXKcBdUnPbMZrTi2idMboSw7+Xqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=MhP7F0ou; arc=fail smtp.client-ip=52.103.43.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="MhP7F0ou"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmPsMd9qQCb9ITnv7XqzbpiHJZ1/LYh0CnifXFdNiEtsrZKgd55Vq4nmW6DCeod96cjTiSOqaeKGl1A62GORRmPeAyhkuO4Tzgu9sTbfkqO1oZaCxi0odLnEMuv8ldaEor9FW1a3UFv2ajFp3SOl1P6srJ0N+3tp/74BoTI6dlyNQXGaeRLLiXMy+bgKJ5CHVHRE1DjvP4d/WUGuMEN3Sg7I92p66V1yb2Ah7X0dIPSg3ciCLuAkJQdHSNn/ThFgSxvFysGKPAWtY48X65xeuwCsXEEt8CHg0vrf7BDvVr8/A/+FSaUfgANgo6TFQUWXQz+gJuwm5SveK2u/Wbp44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jFUMbBwPGYu6qPEXLMTP/pLNmVYD+7FIoGX861hY/4=;
 b=tW6gFdZiO9z5L9V7oNoiIeinH30OuKfGDV9DQlwGKrqq1KZcxqUzTYbiw5fTJTfKMYBZjN0dhQQj2p8A+QZESEV4iTEu1dUXDr3KoFzJPXPFiKLt2921FhjI/4xyk7sqy/oBnixUfeP6FjUaCRcqPZQ/uESqD85Km8LbBOkjtvCOLmCinOmaxHFj0kaOjENr346b5IbubXOaMc7ClkKexgr2dJOvZUwcQsXm87wUMYihtmkc27444Cxx90fVhOFuitv3QIfYO89u30WlfVbxzsrEDZF9kXQiAhrpRpDfHmkGFHezUbOiHL9nMiwkzE8tnFTeIQoyQd+s5Yjjrw/Mdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jFUMbBwPGYu6qPEXLMTP/pLNmVYD+7FIoGX861hY/4=;
 b=MhP7F0ouOfIMaoS8JFAHn9nodrtJVR/FLsdcDBkg7plyZmfwyyqSmg+wnKrYB0LZT8N3xn1hV3SNF93gPiM4lKr3XNA/rGBsBs2upb6b1fyghS4KNuxDaNIhNpbL7jqhrVSh5H3eW4yw3BzJrg89pbgNrLAiD919yPnT0fDLK7p6ngsl+TmUwOgLPMAW2cWexCyR2/3sr3oqSxBl8bNFTfM6Y+r5rPBz1uLbL4j59iyV0XF6UhBKFl8cgr5r14Q+b4gAPCcHQBf1g5kCBK8FxLI++M//5ymhJAkbNcYrxusvKCHmq04bfY9qGxTzwu5IwCLjHIB0fAqRrzmgLFpYGw==
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com (2603:1096:4:1eb::6) by
 TYZPR04MB5853.apcprd04.prod.outlook.com (2603:1096:400:1f3::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.20; Wed, 7 Oct 2026 03:08:54 +0000
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9]) by SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9%3]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 03:08:54 +0000
From: Shuwen Bao <baoshuwen2013@outlook.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Emre Cecanpunar <emreleno@gmail.com>,
	Suryansh Singh <technosfan14@gmail.com>,
	Radhey Kalra <radheykalra901@gmail.com>,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>,
	Shuwen Bao <baoshuwen2013@outlook.com>
Subject: [PATCH v3] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
Date: Wed,  7 Oct 2026 11:08:36 +0800
Message-ID:
 <SI2PR04MB589508E55CCCD8E26E53E4DBA2942@SI2PR04MB5895.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::14) To SI2PR04MB5895.apcprd04.prod.outlook.com
 (2603:1096:4:1eb::6)
X-Microsoft-Original-Message-ID:
 <20261007030836.131851-1-baoshuwen2013@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR04MB5895:EE_|TYZPR04MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: be272eb1-d955-43dc-29ab-08df242051c8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|23021999003|15080799012|260925184616899003|5072599009|24021099003|5062599005|25031999004|22091999003|25010399006|8060799015|19110799012|4302099013|3412199025|440099028|1602099012|40105399003|2607281247196008|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zNxTtxf4HFHSamLF4X+7OWG+uLV8CWUytmAcvAaBv+5w+Xujmd19j+YE6ixp?=
 =?us-ascii?Q?pHa9rMzeInBwoV5am6wQe6nah93iRcCfrczXR//EPKEHoTSkQoc/QfOkFnbO?=
 =?us-ascii?Q?h0FGK7qLssHN26uIkR+JrF8JD8PojmhaFZxtzF00NjgoUAraxEwrIqeVEv04?=
 =?us-ascii?Q?OZJgYLvPf4+CZXqTeA8+tYqDdYiiaP2nC3Li0nXmSQkkTne04w4jtOfzrB5k?=
 =?us-ascii?Q?BFHX76GGhHiRWN6J8pCPryurJQn9KZUbIiZypupc/QoPZvBqgI/4hSvl61wP?=
 =?us-ascii?Q?R9vLaCKrzqIu4v6tpgkkGnR0huSB7JdcOKBg0ZsfYmJ5+w2UUpVfnuhSPAde?=
 =?us-ascii?Q?r0+7qWj4T3kbSzGDSaQD2xpCI+uzcpouvZ3T4m+O823XN1atqCGTu5XwGCEx?=
 =?us-ascii?Q?3bR7E8mSqnzuYarDaZh4jQfzTP0jEuFp6IHG38zRFNUAjJ/8IGDjyTV2I4ze?=
 =?us-ascii?Q?SorM+2ZjBNJ+56n+LB6O0Ry9GeIHTaAp0KsES4JUdyt1K/A/Pih6DuYq0YHY?=
 =?us-ascii?Q?Tuu4bx0iARXWTQbm1B9WLv273Z+dCPSckQ0ah18/UwE2QdXacPrCCjqMB5OV?=
 =?us-ascii?Q?+EZGSJPYDCA7U8YwbyxnW69871D4Z1drYAmN4YwSWZY9IYfNlz070GzBFHaQ?=
 =?us-ascii?Q?kXP8+KdkRZMxl44fDwpnjjVCKZnTI/Tie4sZVfUia9jek24jhrJvqgb82yRl?=
 =?us-ascii?Q?kyOylmicAcswMVICzpcTKGdWs+QwnzG8TcJweJEHy3q8KPnXEBBDh2TGEoYn?=
 =?us-ascii?Q?/L4fwnSbBWM9988n3IlDPr5kYnqim9JTVa1XWH2UrB03etvD9gn3Twbk/qpr?=
 =?us-ascii?Q?UFCd1ptWn2ekTEDahoN9TLsa1HeSj4t9xsJ/HMrclxUQ+FIEzD8fryDRgB/B?=
 =?us-ascii?Q?JupYRhzf0FZkivqYmwkVNGpWe1O7ZB931NfuEISBJPMg1ZWlHyRfMnru4GIB?=
 =?us-ascii?Q?Nd1A/h7fyDIEolq71OYxwH1AkjGnocXyqBr6sXU22nyt6GjkE+CjbeMFTOQl?=
 =?us-ascii?Q?hQ/fdWA3AWXhF/KICw/Uwnnp15vSUjravS8sSXLDhE8ySlYilYZL4tlteuqQ?=
 =?us-ascii?Q?s7uBRND6qyBlWBMvAu6XD3yH5rKnaFf98rwo0t9lY6qIwlRjpuY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KSpOG5mGSVGr9WSb/CplUFKwsX/zr416js06gC9CHOKk+9rA3VdMcx2mLcgH?=
 =?us-ascii?Q?cRbT7GrYkjrBYfaLhGX5hZygL2BiPAERnQFIdUI/lI2OzWVO0IWf196b/2W5?=
 =?us-ascii?Q?13XjvUs86pvhKPW5Ni9aRWAqobO6PcJ+loWopHvjeXG03XOAi73SpNDA5ooj?=
 =?us-ascii?Q?wk3eZ/OZ4RL6OvFgbE6Ft7MDhhD/7FSzIAAyYUjlFs+BIW4OZa1Do6aeT0/3?=
 =?us-ascii?Q?jMit7rQk9DiFcehBoWB5b2E3f5fKgNzNt/oGsl2IA7l3DiLrb7T7/HtBuIXp?=
 =?us-ascii?Q?dFuqpMwGCTxU0eMcKwiaRmjniq2QpabHsC+mGjgv17rUkKxyUlM4LdS5fdYs?=
 =?us-ascii?Q?ey+6mtaUdssYSNzRUSmmUWEbew6D2tG8uFp0zpt0rn1o3KrgaNGntSOHxMLK?=
 =?us-ascii?Q?TQNMn6IB5XtcaZSs92uBaAFI1QNxoo3dP5H5jLltzmzWNXO4Yk7sZVXHvPyh?=
 =?us-ascii?Q?X4SONp3YEpTdmAvhfeuihPLy3MxLNTTie9yiFjTn9SwhTYOYQl68e+u1jTOw?=
 =?us-ascii?Q?fhmrg6vw0OIhqceMCJtDrXLWi5XAqyj4QF+h8OBg1T7AcIls9lJD5P6skdYi?=
 =?us-ascii?Q?0XcNj5m7OC8SHTEmYvMjglInrpCrK3bEYgUjEcTo+k9OfCA7y/y2sHMUBw8i?=
 =?us-ascii?Q?EPUnveHpAd+1hQ8eBpLPQYidATO/xtuK30cJ4LNsdN6pgZWj42z6LxWJbB/O?=
 =?us-ascii?Q?B8hsiSm8IVk0Ya8br4uHMEGfcjAMjrPRiyTiuY8J1iOiK8RrVxTNTvtV8/l9?=
 =?us-ascii?Q?Inijkwqc58dS0jeOBBoqdrfRA3MDL4g3LsLEzuTyMORojesPGjdzI02/mAqk?=
 =?us-ascii?Q?MWIfvvGX7eVsm64KLRLnvxBsOkMufjhGY42gbTzI/x9euPMerAqWUfRgjAp+?=
 =?us-ascii?Q?vwOqlgY5Oxy7Dm9lcbcbP64GsTKdU1Snd2cLpv1onprrh0zksnz1Q4cChWLw?=
 =?us-ascii?Q?ojFz9nmhYlMEmFMCOefpepuXainN4DiGulqpaKInzBii8A3cGt9C0yfS6qmW?=
 =?us-ascii?Q?NCFRJwka3SrUOcCWzjEwVAVyT6T3Vfiybvno7n7R3SprvuYrXuc5AQpz8OUf?=
 =?us-ascii?Q?Fw9Mys/vEXx8FHTDZBP3WBXkk7t4Pi+hhLxuzhxnNRVmSKkS39ymkAvLRl7n?=
 =?us-ascii?Q?zcWr29bDfu+d2NBZipBFbjOyXXiy58L1MAlwlEDBZmcn0SNw4j2fPiZrz/Vn?=
 =?us-ascii?Q?jqAs5sPu6997e1FwZ24KrNqDbdNrzH+DJgjBUFQBhTsdu3u6ei9i596O2qpy?=
 =?us-ascii?Q?Z51YEpziwviBF/VBwJpM2ywE/qzpFKBOBCPKO1vI5qyNTDriLsPn46p0Alab?=
 =?us-ascii?Q?FagbdLEGxcTsVkwrqAfgfDcb8Rok0U2t/pUT4F0tYN1Wmgzz1lQ+KdvaCZ+s?=
 =?us-ascii?Q?6uJgOTR32UbYTLGvZjR6Uh08fm2dkkPAOt17IKFIObYB4yQdFaiQvM9zlLNX?=
 =?us-ascii?Q?Q0kO68LZxGohxbYA1NFeiXNrQJWcUISFhPMj+4teXPfLdWPaRGmCug=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be272eb1-d955-43dc-29ab-08df242051c8
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB5895.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 03:08:54.6125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5853

The HP HyperX OMEN 16-am2xxx (DMI board 8F1C, 26C1 platform cycle,
Arrow Lake-HXR) is listed in the OMEN Command Center device
capability table with DisplayName "HyperX OMEN 16" and the
"PerformanceControl" feature, but is missing from the kernel's
hp_wmi_feature_boards[] list.

Add 8F1C to the hp_wmi_feature_boards[] list, using
omen_v1_legacy_board_params as driver_data.

Tested on a HyperX OMEN 16-am2xxx (kernel 7.3.0-rc6):
after loading the patched hp-wmi module, the platform_profile
interface is exposed, and switching to the performance profile
raises the CPU from a ~2.9 GHz (P-core) / 2.6 GHz (E-core) cap to
~5 GHz / ~3.5 GHz under a multi-thread load (stress-ng). The GPU cap is
raised to ~114W, tested with gpu_burn.

Suggested-by: Krishna Chomal <krishna.chomal108@gmail.com>
Signed-off-by: Shuwen Bao <baoshuwen2013@outlook.com>

---
v3:
 - Switch to the hp_wmi_feature_boards[] approach instead of
   omen_thermal_profile_boards[], as suggested by Krishna.

v2: https://lore.kernel.org/platform-driver-x86/SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com/
v1: https://lore.kernel.org/platform-driver-x86/SI2PR04MB589526A21FB0EF4E8ABA749CA2AB2@SI2PR04MB5895.apcprd04.prod.outlook.com/
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 615b4cf6fc45..37c3e94e6819 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -343,6 +343,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8E35") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8F1C") },
+		.driver_data = (void *)&omen_v1_legacy_board_params,
+	},
 	{},
 };
 
-- 
2.53.0

