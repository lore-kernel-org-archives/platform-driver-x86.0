Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012020.outbound.protection.outlook.com [52.101.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225E935B132;
	Thu,  5 Feb 2026 07:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770275296; cv=fail; b=QBK6Hyuj4N0o4Y3/QZdfkH38CXCbQ+lOezrIHJwYQ/rWRgvdefoqPKTiMt35nM2TqdP8nAQfRuUB2nrQg1d7xUgZJKKjWwm96mWP1QTLMiFGNayuJs8uxarDbON/tX4SyBwyydzqsjqp36bVlyMXy7UQN4/e1n9avekeLJyOYt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770275296; c=relaxed/simple;
	bh=RDfJCO6rcc46L2wb8HfmTTu0m14QUrpsnAnbUk/mSBg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dfxEexV3UrYh1W4Ooo7F/8JxebpPKKaR25zDc1sbUZqt6aU8Z0ZpDqOn0M17rkAmLCy/fY8UcyMxopNANZRAqZMAjG1dYD2tV7PYlwTxE8x63b3fZFziGZO1JUJAjrY1yMkKBMetvlYFWTPAn1IwxfN6d3938wqIIJXDkWQ6lUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LkkezuyW; arc=fail smtp.client-ip=52.101.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LkkezuyW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZbab/m5whZCoDxU6+63En1w+TeK3EyLtspFUAcN7Z19lix1u8L1ygB7FOcBHWOPVTsg5ypxo1zf9umjoX14A6rXW58LrfK3r3F2zM6xLZmJ7mdtM259dvTde+yOtlcdEsK/eUC7goxQNSygI/abWNIfUgHAc3dcjNm5A1BkEparm+vItDCTOn5fkAnKeINaqErdX0hR/RBUsgdjjNu+3eXqfxFd6C/cD1/VzOVOqTqLdIgAe1bCO9RjeoooouIZjrTRIjT89wQAwIH0PXtg1wynSnez/rG69Ok9aWLAXra4jCAgkmr7tiSxWk+eNZ7im+yFr7OdSHMzTvFQmGWC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQpOfuaF44f2DnZ2rL5VhvJVs44pC19m+lkt/U5aB9M=;
 b=QSlreo05iQAgznUvjxpL9dr8hIzdRfvKng4TPwSU0pdUZlJ3hz4bbBSZMLfJreBh8gG6dsyBLR7D7jIGOat/q3rj3XMYQ/eAkwoZp0ENymy9QJgN1yZZB+qgPljN/QnEvcSzZWLzRapvC8mCE2p/hkipA1PvO1CFdK49/VGym4iC3OXI1qtnxwpd8aSVMs+U/gTRtHsHLOsv1JDMSdbfdyBZCcBkN1iJ9Q7hd5LiSp5Rxv6FQG2cWIMwfxAoP9F5cf6deL0h0SRUVX632BWOs93RV9skjj7/WITcIlb01FeXfgDfda7La7RuG3AunAcgKxBPrJUyDRyjHnD+cNPirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=canonical.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQpOfuaF44f2DnZ2rL5VhvJVs44pC19m+lkt/U5aB9M=;
 b=LkkezuyWgn6+F3+BPgmQgnIb9SgRWPUHdrTfU1AKzQVOkKUgB23ZmfUtViiSuV4WXx5uhbvUAeuqgBQyviZ8owIrgZsu9YSgdP99a9TwQuuPN2EsKrVNzhYile9LlT6EV9YfeEYOI4OLhDkdrm/4MNQMpdaKVd3x57X6yXk2abw=
Received: from SJ0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:33a::10)
 by SJ0PR10MB4592.namprd10.prod.outlook.com (2603:10b6:a03:2d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 07:08:14 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::b5) by SJ0PR03CA0005.outlook.office365.com
 (2603:10b6:a03:33a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Thu,
 5 Feb 2026 07:08:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 07:08:13 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 01:07:58 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 01:07:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 01:07:58 -0600
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61577qDn2988623;
	Thu, 5 Feb 2026 01:07:53 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>, <13916275206@139.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>, <letitia.tsai@hp.com>,
	<bill.yu@canonical.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Ignore reset check for SPI device
Date: Thu, 5 Feb 2026 15:06:27 +0800
Message-ID: <20260205070627.32013-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|SJ0PR10MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbd704a-18cb-4f2b-0e98-08de648553c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yLPbazetWjR+jBNuoCfHk3P6uTdOH+ZNCLrYXabkVu4Irn7vb2kN2npsccmL?=
 =?us-ascii?Q?aYusfrUZ2kvkmWdJAMEnaN1mtgGkrQpr6HWybqgXVPX+F4nJi38VeYBNikqT?=
 =?us-ascii?Q?xPV7uWE1trk/Hd7cy6VbwzvxkNx+bKLvdR73Pa6eLuVYhc1Om0hYHL5lfWoA?=
 =?us-ascii?Q?hW5ewItZs6ti7LwuppAdMFF1odHJO5Tjqn17nb2D/VA795G+0jbLhW8h4zj0?=
 =?us-ascii?Q?QbZ1DLLdDwnnmwqUmcQCBDW7t74mnA9/qTMjFc80cIY+70O1uX4uVO4Vf+he?=
 =?us-ascii?Q?KEXDxtgrLcafrNvLIA3O5G7fTqX5TYETS896/Bd2Zd0GSNBkxJDTt0TzHmYy?=
 =?us-ascii?Q?pUiHQP+ZKYYynXHimz1nPp0imLnQGVce3vRaPeVZ1GMwELgk94YVWTZDdFxX?=
 =?us-ascii?Q?HrbVfT6547UJh1jY8Jjb7DURq5YzjQOZm/+zW3RzUYDmr+sODJBOvA7mNzqP?=
 =?us-ascii?Q?oOzgXvslmhWsDFumaGr2DqpLf1kdhyPz3ffnFUj+i7UPcn95N8iWWmI8q4AZ?=
 =?us-ascii?Q?QopV2Bqy2igOZIB9JYUeJEs0ZFZjBj+7w+IRsw1dGZIxLlDK2od296A3D4Kh?=
 =?us-ascii?Q?VT6Pr4QYop5D43kYyFunW1NP+FXfzT2sczTArTPXljXCCY9KUAdQN8XP0goA?=
 =?us-ascii?Q?9ccs6zC1odRNot4uScO0uFHy2nWAdxubdnLPRFc/O6oiiwyO1NXrvPggNqlP?=
 =?us-ascii?Q?qIR4M8RmEjAin9cjRdKLsnb471OObp2mXB2MxaYgQ2s32JIQeH91R0+s+wKg?=
 =?us-ascii?Q?6v+/HFHea+TFekIZ0q1NpzjfGdeSYjpBPqvp0Refy3c5vHtmNi8x2Fzse6Bm?=
 =?us-ascii?Q?g7acBzIOZRksrlCePrE6sSIPh0XdWn2bBpU3IJ3LxyLuy9sOAGJtbBARfVsP?=
 =?us-ascii?Q?58e4z6H3E3C+SsZIPRAMjMe63+5w4LqWHyRPQHlMUjPOvXpjdxrV0EAwOY/B?=
 =?us-ascii?Q?gNQ/0n0MYLkP9clSxXqooHYUDoElhMbM3Chv5QkXKXeV67qoNGPBqgS6eDC5?=
 =?us-ascii?Q?tkeUYqrEGn8IiaOVOoR2BOIZ3kchmWRkfYSbgoObarCxs+K2wbywfJW6njE3?=
 =?us-ascii?Q?rLsp/KLj7NuLib6l5ovXQQW+YtLNKajyXdqMTo0SaSakcklnsolDvKjGdHs4?=
 =?us-ascii?Q?U3siOzOOTpDnmRi3wZMnztixBr0VJNqJWq/15ymLcJFcHgEyIfX+GG/MZhzS?=
 =?us-ascii?Q?FnfhSPDtOtSRe7CMadocxvRDLak7iU3vxoxwSggFTPiyLOZabusE4kLiJPEX?=
 =?us-ascii?Q?tLRH3K72LdKpuiN9jfAmmTr5UsOT+Dhwpvtbj1d6j+CfvqpjdiBjAyk7llgH?=
 =?us-ascii?Q?ck5wLu3Y1+2huw9EBaYj9GaeF+fVBPKid5E9dQJFXdDM2N36Xsu5rgRMg01T?=
 =?us-ascii?Q?Pg7pr6TPOqXVnmTZLU6bZIf/kZyBLXi36w6sUquSljncxsfF7wLNuLxJ8xr6?=
 =?us-ascii?Q?qLwV3/YaUqXcj3F1ZEfzkm/kBiGrrjtKHA0mg3jR/3/aa4kvHhsu4aDtQBSZ?=
 =?us-ascii?Q?sZ2yKu8gnT2XHzjSLJKfBGQxZBNVJr9cqYdgO/8siH41C0CPjGpnkrU7D5mF?=
 =?us-ascii?Q?Six9RopltWbWzbUGy1v0tSB6bIplHVzGllVnxOZyymHgHSEjdCRcWKAF1A0W?=
 =?us-ascii?Q?r0P6aZAF3oWx9PzNZMF2EH2oc68Mu20k3W3/lSm3x244a4jldFv+M/YIefnt?=
 =?us-ascii?Q?5gVhnA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3n6plTcKd5FjmexTlzCGB4xVBhl4zYM79cFCEam+ExLnOrZWdQ7WNsyiqqYygSCDgaY2Y75bU65oW+O2hNDUiAoMZVE9hCaC36NeFHIv7DxIt0dGUhGzILUVuTZ4gZgAxaoTsqiwb+CEgB9Ed151V11OVr8VV05HZrNHAZXUA3NbbrKI24eDlzH2n2+NJVkbS96AFE8KXRONWYjNSrJJ/0Tzrkuc2jLlysZLyOeIpDvJigncYHzD/UkrIYqxg47fSGJcutRUiYiGTFbiDxU+UTQkyOpawsPDJQta3xGjy2df9nbf1L5FY2JSy6MdVsTd2cxI7chlE45v06492WBhs0aL1DKoVTAH12bdMsRfpAbe8c3x17kyh1vZbuz8zbeGT5VRlJvEPiEd7XtD6ijt01ov5sPyCJ2ob+E/7GXkhqipRsxhIajJVKl1tJv7ymca
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 07:08:13.0728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbd704a-18cb-4f2b-0e98-08de648553c5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4592

In the SPI driver probe, the device should be in the default state, so the
device status check is not necessary. It should be forced to do the
firmware download as I2C device.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 .../hda/codecs/side-codecs/tas2781_hda_spi.c  | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 0c9b57b6ff55..f860e0eb7602 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -631,7 +631,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	struct tasdevice_priv *tas_priv = context;
 	struct tas2781_hda *tas_hda = dev_get_drvdata(tas_priv->dev);
 	struct hda_codec *codec = tas_priv->codec;
-	int ret, val;
+	int ret;
 
 	guard(pm_runtime_active_auto)(tas_priv->dev);
 	guard(mutex)(&tas_priv->codec_lock);
@@ -670,20 +670,14 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	tas_priv->rcabin.profile_cfg_id = 0;
 
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
-	ret = tasdevice_spi_dev_read(tas_priv, tas_priv->index,
-		TAS2781_REG_CLK_CONFIG, &val);
-	if (ret < 0)
-		goto out;
 
-	if (val == TAS2781_REG_CLK_CONFIG_RESET) {
-		ret = tasdevice_prmg_load(tas_priv, 0);
-		if (ret < 0) {
-			dev_err(tas_priv->dev, "FW download failed = %d\n",
-				ret);
-			goto out;
-		}
-		tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
+	ret = tasdevice_prmg_load(tas_priv, 0);
+	if (ret < 0) {
+		dev_err(tas_priv->dev, "FW download failed = %d\n", ret);
+		goto out;
 	}
+	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
+
 	if (tas_priv->fmw->nr_programs > 0)
 		tas_priv->tasdevice[tas_priv->index].cur_prog = 0;
 	if (tas_priv->fmw->nr_configurations > 0)
-- 
2.25.1

