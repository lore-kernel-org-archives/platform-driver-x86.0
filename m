Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793499521;
	b=wrFEvsUNvTUVWgef98UgVYJRbLg1XYSpJCnpDXZ908+E9OyBdYNDbkF++FrfCzclInof
	 W06aK7cIjnYkkCoAFD2ElKYIi9/WpLLWO4WTxc8k3h+u7lm2sInZLPLoXQpLlOxdxxlOX
	 dYzxDjW5ZxSjDxJjIGp/7bpWgTSxtNCGOa6f9s995MhDBSDknBHQMU7UiutU3aPmYbmOs
	 uSD/QlICOPZn6zR4bxCyagCbSK8w8w6JW45xUX1EpX/AbK5Tg6aTFcjX+yk7z4MsB7IHU
	 GLuLlR1/5gEKdCG1k5T9EAlZbkLvt9axOtjhL1IwwMKybZZFUE6IJTYclDbCHZNyiHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499521;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
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
	bh=ofZUZhTx+ZTWtBmYiCoU/lxOuKuJwH7OffJnZLWDQwA=;
	b=KYemm+f6J3FV/mTR90jZIbnL6E3umrtyiIXrQXfe29GIS9IjEFtuBX9L9vvri+lcK8L5
	 /lQwBGlot9NgimTZYd/jcobe5VT41kaXtcNIlElxCJTbxuUhbjHV0xkK1Xpgmc0NndnPa
	 fwW9jkW8tyVnZvgc2mUPu289BbN28qjXrdDr2vpm9xltQ1LyhZz+OJC3P6t2bqc9OPx+N
	 cfRZ0mnWoCKVrOdf9++BSrZA9Hua0nL3QISCKK1vw23BlEpnA/tRxX7JM/DbPPMhmPQK8
	 FaCq4kjXgv8hZOhcin7GdK8ipf9kXopuKHP8kdMFeZW1+8x7TQzs5EOLpy7aO9NukeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=umOOEgiz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.22
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010022.outbound.protection.outlook.com [52.103.66.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA91606A324;
	Sun,  1 Nov 2026 02:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAA91606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=umOOEgiz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEnL7Gf8i2XlEzInv82uCMUYK5byCtrrmbcX8rnHBQSTvcVMk7ZeIdN1gKkbjGn8BKENRooAahPSb23H9UvLni3gcuTURmMGg5/hP5VN2lzR31+S0otjvfVfi7RBmBXaHZYOTMq4MUQ7uSGRyr+fq0gFBAvD+GsyoT08nmhpMsP5HHnp8BaHLha0JdOVUm/2lub+kf9v2wgHOgFq/4msKq2vdvScEI+KUXrdxq4b/ksSYDmYvsmI6ubZyxT8NKI78JTu/gXdxLUtFGsKp+JgBnwUlpeadvav7sXdxT47ZRwatGN5Pl3kUtEXyAp27OFvA5oEekRtvW7VRqdDkeXqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofZUZhTx+ZTWtBmYiCoU/lxOuKuJwH7OffJnZLWDQwA=;
 b=NhIW5agJJ8ElhVn9c7ZrD5sd8oQ2teb2FB9wBM+ylFeXR2wJsT7ZVeUGccekKTol38192l+7eKs09YlUx4lB2FkG809+gz1OTW95SwjTzACoWDXBtoMf8gVdgqRrgi/t6GvO0vllZ6s7XJIaRmJeA5W4kitLL7fdBXRgzZI7jmVAGnJ3iqS4CPFMsrbnGOcRYXoLvj5bUJQ3lOdXdC4waYp2IfVyD6DSZH2yJLDw5miEMpAoJ6mQ04QZfX6z3QThd7+wAzYkIogJrJ3rs9FTmYcxPcW230jYxUvFAHS6XwEuAioj/1TfVoxA9zDpEMecNADZMZivkN5MIMK/kZTirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofZUZhTx+ZTWtBmYiCoU/lxOuKuJwH7OffJnZLWDQwA=;
 b=umOOEgizfDx59Yazh21Tdif/EYf9JGp96sytlnV5MGaWmMBlWX9IPSn8uIQIRlkI3pRgeLWW9Txtisd9qTKdPWJTtCzutTIrgPO48uytuhfGvKO2ZDUxT7OWfR7XM7HvGBXxoy2KnDnqWNmNnFGzd5WQkEXlNW9mPchsNvg3/HxNcwxqEU+34HCCcGmqFmld7+ceYipIqTP+Tnb14IuOJWasaC3jj0PUIEtc2NbKT/HuPY9t4FAkQDySNoMRR9GVsA1QrlTNOHtTvuExA4nLKlORlGmwJx69jH0il2XWbD3LMASZhvPVWLsscomed2Kl4CVmmWlFT94hvl/LzNPirw==
Received: from TY7PR01MB13746.jpnprd01.prod.outlook.com (2603:1096:405:1eb::8)
 by OS7PR01MB18424.jpnprd01.prod.outlook.com (2603:1096:604:4c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Sun, 1 Nov
 2026 02:18:37 +0000
Received: from TY7PR01MB13746.jpnprd01.prod.outlook.com
 ([fe80::a4eb:52b:9f18:eae0]) by TY7PR01MB13746.jpnprd01.prod.outlook.com
 ([fe80::a4eb:52b:9f18:eae0%6]) with mapi id 15.21.0569.010; Sun, 1 Nov 2026
 02:18:37 +0000
From: Jiajun Leng <adolphpi@outlook.com>
To: platform-driver-x86@vger.kernel.org
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Jiajun Leng <adolphpi@outlook.com>
Subject: [PATCH v2] platform/x86: oxpec: add OneXPlayer X2 Mini (G3E) DMI entry
Date: Sun,  1 Nov 2026 10:18:26 +0800
Message-ID:
 <TY7PR01MB1374600CF756D90DF8CFC37BDDB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <TY7PR01MB1374656B7810521751CB248D4DB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
References: <TY7PR01MB1374656B7810521751CB248D4DB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0032.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::13) To TY7PR01MB13746.jpnprd01.prod.outlook.com
 (2603:1096:405:1eb::8)
X-Microsoft-Original-Message-ID: <20261101021826.54-1-adolphpi@outlook.com>
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
X-MS-TrafficTypeDiagnostic: TY7PR01MB13746:EE_|OS7PR01MB18424:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a352e7-a994-4aab-cd73-08df37be6fb1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|25031999004|8060799015|19110799012|23021999003|51005399006|5072599009|37011999003|24021099003|260925184616899003|25010399006|440099028|3412199025|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gsRvA9xm1CLHZutI5N5P+1YJTENK/MT+sb2540Q2ZeJyi6OBr2UkfSu7gboj?=
 =?us-ascii?Q?4SEXD7WsGJKaSftVgKgJSjcfUfIQFImGY9cBViUqz+Dz8BMPtw3wzgYGs96P?=
 =?us-ascii?Q?tigW3GPdbhfhntfbXbX8ZuYk8fhOUn+pbD4DpmRdJG4UWOjyrt5katdJE5UC?=
 =?us-ascii?Q?qakYMSSVa9qMVDtUwO5tSK5AhoZmQCQQ1QW1I0IUTyVmw7oqyL/z/dG+EyxF?=
 =?us-ascii?Q?XkiKBNJM553L0O0kfJZlLKRtss/zDwc5EM4HNYGT1ydEDyqbv4WkcPOsvKph?=
 =?us-ascii?Q?UqkukzGELsfSd4nGnVwZMXDX4J1b7Z5g7B+Mk/p+Ihjg8iEOhXeYYq5ZfHuE?=
 =?us-ascii?Q?KKCA3hArUGDInbo3p4WxT4okDrtIr8cQvxSEG6yMzXXrBoOT9YitJ4uJbtrt?=
 =?us-ascii?Q?PGaMzFx9Ra+Rre3jhTQZXJd0t6XQ3aDzgW3qSJCYrlBpHPpVprbaeqAFO4Cl?=
 =?us-ascii?Q?kb3Rd1T1QBhzcv0IamjCrbq/9jj6ppP2F5ynbwt2NfIlb+sDPf5so3v5fCZh?=
 =?us-ascii?Q?10S5UjB9CWNIVQlIEsaFLO7kWBHNKZTl+BgfHRtROH83qpjXIAjx8WkFOy45?=
 =?us-ascii?Q?mK0IQu99/d8I/g06rJKXACcf1xbpPuviX30OtvIM7bdT/SmyWuFegB1my4pd?=
 =?us-ascii?Q?bH+tYsx1mf6XELXFJZHXs4LdQm2Z/VEO+yxHiAJ7ho3rSGUlNHqpkViNII/T?=
 =?us-ascii?Q?LSiBpGFRImy8a5DwFjNyL/xGw4tsmyTgQ0DGK4gVuKgJrTY6UWpI89e15GGA?=
 =?us-ascii?Q?5EjU1XQ0PgLZjbA3+yzTohYUJYpMAGUwmb7fVOuYHOft120Ni6nz+pGKGqK8?=
 =?us-ascii?Q?8DvjrCQb5M9Dz/C0dA6XbDqDA11QiEyOnLk45BHrQp5meYGaAa8CS2JNpWXk?=
 =?us-ascii?Q?fdVHTmiZTAyQ1z1A477e5YVGHoiIIYY9DmTrExqDPvzU+FsOUASnMNUUPhD7?=
 =?us-ascii?Q?RZvvpbzd7ZDF8PcJ/axdZFNEcGFJMJmVdmN1MaT6IatRdiVzluulLcJ4RSI/?=
 =?us-ascii?Q?XSggBwOC1+jktNr98DPJxfYTHQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lx9PV/qe2FS4eqofarWUaAkxcL/0DjbGFVecBCTc6iCy+o9qlegAANVVw1sj?=
 =?us-ascii?Q?5Ua1dWawOxSmHoWy1zBh5fdXkALVeOGG7Fu4+GfQITh0k2NrbXiRVk/AfsF5?=
 =?us-ascii?Q?PBIb08EiXJzMIK2n9pGeIeq0H5wmfiX+sTlMl8kzm0wjcndJa6LhC5ETy+SX?=
 =?us-ascii?Q?1d7U4ZCcrZICF9w4k3HKvQjTaZc7yLV6K3K+ng9haSodJSA9vOc/BHX01wwO?=
 =?us-ascii?Q?kzxYFx7rYdoXdWOhTJmDI4aFMsY8ge/COgKudZ5rMQ5NH1hoNw3VKjpgu6O+?=
 =?us-ascii?Q?O9gkkRoebdtEW1Yc8un6oQ+LjhMB5i65086oQWxw13FaEyPQT2Ot8qMBjPem?=
 =?us-ascii?Q?LfKBkFPpe1lJkVMvSPQb4naiJ3L1Fbsblxi8YRx7WlcBxgsm9pO68r5qJffZ?=
 =?us-ascii?Q?wf9aIPgeW3W55ACMRCfZ0i1awdbXm4mNYclldYkkHZDO4vZhH/BvEqy888/e?=
 =?us-ascii?Q?BE919CrmE90nMl1Ak2C4tnXik/lby0fIquLDlOFgVdnXns8RCvaR1xk4TLsB?=
 =?us-ascii?Q?8s/Pp2w4XNeOkFDjTnMcD9MZEUP6WtoCexthikd9CKvxwHZaFD3C95ZKgFz+?=
 =?us-ascii?Q?Z2VxOaRaT4+2iafnwpU0By6yxUM1v4dBgQ9A3R1GC9KRyznzaiY3wTLQX45X?=
 =?us-ascii?Q?xhyXb6kQDii0pquFidBkXQ8rokkW8b3PSZJbaLsp2e3LEosC7X2nuBJ8waCd?=
 =?us-ascii?Q?Tx1w2Xt82HsTjgT7HNwFA+m6y64II4ja/kI6wcPylYAKtJlr+1wacO3G4XEq?=
 =?us-ascii?Q?jhbqVrSBVHclsBAePZpdFW5M5CzNy9IA6xsBLhncfHQLRR8Xtf4LEOVWR6Dw?=
 =?us-ascii?Q?pKQHS2vCQE/b02IS3gKZs2Snu/9DEOEu9xc0Sf/hMcTfmTSTmK8c5DwqX7DM?=
 =?us-ascii?Q?lDVtd6qzzmlJwam7un0dzgVXY9jY03+LKiyei2OWFUoZ1rRSYn4NIXW1vd6c?=
 =?us-ascii?Q?dao71w+m+9EvYqcp4M8SQLI+TjedgzWQRhgYHHixUSGuNOby3sXx6bW3waHV?=
 =?us-ascii?Q?ydaUqeof4TWRnQQwhXPptE3g5Os47HqCAx1l9rD5qkYfwbpBt6p4S0AGixvB?=
 =?us-ascii?Q?U3UGgovh/SEnfa49kSh6iIbHLE5GbzNr/a26BLxb7nYXgAK1LoGpZyvq2vc1?=
 =?us-ascii?Q?c59HPOArruAaC2hT5go6lgv169kgbfl8bFiYTHRtQ3HjIWgjZMR2qKEFssLZ?=
 =?us-ascii?Q?1V8U536Kw7Sy20YzKWZbdjrKiDjKcRjNI92R86X3IbdUgNOujDsZwAS78uaC?=
 =?us-ascii?Q?cFuNSkMWrhZab3DSpSATf3g1bIyBne956SYGZK4s5e6k5Gzu81tZtQz2wmq7?=
 =?us-ascii?Q?htuRFxp/GcBTJfZzS7uDL/nUVeb2ZHzk6tF/wrJ31IRk35ko+Jv9O+erj+kM?=
 =?us-ascii?Q?ayka9s1dpZ2z6hZXkwexCuyhGlUNmTLbHn9FAxdnD+1nkiyzt8BnSSq4NVJ1?=
 =?us-ascii?Q?Ii8wYz85ZU8O4LIOwDIv3i+iBsks+BrK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a352e7-a994-4aab-cd73-08df37be6fb1
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB13746.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2026 02:18:36.9511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB18424

The OneXPlayer X2 Mini (G3E) is the Intel variant and reports DMI board
name "ONEXPLAYER X2Mini". Map it to oxp_g1_i, the profile used by the
ONEXPLAYER 3, which has the same Intel EC layout. Fan reading, manual PWM
and charging control work.

Signed-off-by: Jiajun Leng <adolphpi@outlook.com>
---
Changes in v2:
- Remove the X2Mini PRO comparison and the downstream kernel version.
- Merge the quirk mapping and test results into the first paragraph.
- Place the entry above ONEXPLAYER X2Mini PRO to keep alphabetical order.
- Move the AI assistance note out of the commit message.

AI assistance: Claude (Anthropic) was used to draft this changelog and the
diff; the submitter reviewed and tested the change.

 drivers/platform/x86/oxpec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index c4c4babe8e30..f4b5a35a4d69 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -300,6 +300,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)oxp_x1,
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

