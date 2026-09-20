Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010000.outbound.protection.outlook.com [52.103.20.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307ED244667;
	Sun, 20 Sep 2026 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789936112; cv=fail; b=eM1owjRlK81NYsgcyRcKnOo1dxidZduONFvv/BQ/ptfNFC+LO+eGUBDiiOO4xFk3YxFoMfvHItoT1KSjAiTDtmaER8w1Swf6z9z2Sv5ASebOnxcXHkYMmBEysCyHvwjKW3xcczfNZgqhEOP33fM61jIx+Hb23xx5R9ZcusRPKfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789936112; c=relaxed/simple;
	bh=KFQ6xxo6iS+KeFuqXqFeLxjHBzu8xw1q6f6oq5XLtcI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PC6YZw0UJYDph8l1GLCRVQB9sAFg/P00Hm+SGTrrwcDMPamWgX+ue9Ng5Hed0UyEGUuQgLZaTjOt2Tibv+1jOG2FCpNtsp+DWoGx2foWsZd67EOJTf9GOTpDbdmigWn/HS1OFQXGCO+1XezWoxApYIl4ALtqQpKpEw9KoS9G6w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=qQ8hZg/J; arc=fail smtp.client-ip=52.103.20.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="qQ8hZg/J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVHlB/i/w+IkXqcVLh4k86Apr17FIkVZg6e891i7R8JTSNqZtpNYOgiB/ysaKYL+V7sQhMHd0Ai75cusUmTsXIMi9DhOQQ7egQLErk7xpM/351dwx2cXNd1CqoQYu+oa1GTpP1MCYu0WpJ8oNbxAD5kMBfB8YoXgdm9NghDxhfLd7Oxd2cmRKVhJYgLI/Z7YClk+KmaocbYYywgmQdJc3MGiAyZKaSIoj0NqstkRHbrbqymvZ4hFK8JrmZidFozeZAlt0np7tnjt60ceFVVrT5wXTQpv/eQLPZQZMB/PzhB4z/+hUWBzJh6VyogTJriNXJbZKgrv8sHXjWhk44I2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIqGSKVuPxHgqh9/xigk+MGy+DFGjhH62W77G64hi3Y=;
 b=bAaQ5uIXBMQOBTZOsuI8BhID6UE279TQKvoAmHW9O8nxHZbY7C0KLXXm7eIeoKK5s3C2fsCcIcth4groc7ysKGYsZ2nej5VeRM17ADm4OthBaftJlNTHgsWneHwRwulcsVuWRADkghIJ1PnZhg4eno39SY+go/ozwFU/SOaBhjk5Gdw4Jb+v6tISxYarqDY4hcrCE1eyjnfxi8g2klN5QQQPhnN7rUVIB2KZWB5MAxYEX0cfvsyEeBwfcfa/4gRORcRiHYJjNyU1G4wlzjm41qYwctmYadTuYHEfJo9fTeH2q7741vgixnrhpmU/q9y7ehd5QS7AXNzIWCxTbmiS0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIqGSKVuPxHgqh9/xigk+MGy+DFGjhH62W77G64hi3Y=;
 b=qQ8hZg/Julr67iXoRWzxRVQMula+uJHMGrEJWz0aDO/cdc73eCgL6rqeOw3TbXahTNLWUf2UajCsN0pA15/TOkC9rkz6veRj3JXFlE7neE6gE6XT4uLE2Z4gJ96+o266wTABdWxLr5Vs+c8HMoA2gFepca7Hf/4U6pJARngAqwrvApNBRo6/neoQS0D/qWHB/18TtnCJ37WzV8H+mZD+6waWAgL7H2jIwvnD8ovD82sWG/lEPCyTTBp0+RdsmNb4+mNAFMjATn9Q4NJ2xeA0+TjaSSLnaEujm06IfteXmHl7OuF2r9bd/nUvYK24toaXd8rI1E3AcWfsRwvBigRRGg==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by SA1PR19MB4927.namprd19.prod.outlook.com (2603:10b6:806:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 20:28:27 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0428.014; Sun, 20 Sep 2026
 20:28:27 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hans de Goede <hansg@kernel.org>
Cc: Huang Wei <huangwei@kylinos.cn>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
Date: Sun, 20 Sep 2026 22:28:15 +0200
Message-ID:
 <SN6PR19MB2303E25270E1A460ABC76EA3FC852@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00004EA8.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::44c) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260920202815.13811-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|SA1PR19MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a02bc31-f1fa-476f-c66c-08df1755b9c8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|12121999013|23021999003|15080799012|25010399006|55001999006|41001999006|24021099003|51005399006|8060799015|5072599009|19110799012|5062599005|40105399003|2607281247196008|12091999003|1602099012|10035399007|3412199025|440099028|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bMb+gzXXJ48E1vih7x+N/ATszHsLEGpezJ1860ds3fVgmTtBNgfjU+CmRaqe?=
 =?us-ascii?Q?pfkJIu/7lVkytTgxCUKl2KFVsV14zEMAqotOWW60zJgrkwrYdjVaNuWJGp2a?=
 =?us-ascii?Q?PPgKIDYtIIsiYjRm3v/Y7cbSJM7YAy6bR1uzDSsoZXqTXrCtZ7JXM6FzA8IT?=
 =?us-ascii?Q?kf774CKVEvzfjP8XHg0ZmqA9wO7Lb/z0+sKb2c2x61TF1V4QVIw/4yd1yxls?=
 =?us-ascii?Q?ps9ByuV6NCrOcnLJ957AP3LbLTeqbrZvSYDgKeuxM10UqXQnUu+P/3d+K2/c?=
 =?us-ascii?Q?JwcH2AZkT4+6tqwLI9DMmClI/NIzKTTF7H9Y9Ts5H38sO8q3kdMLoncLl7Nr?=
 =?us-ascii?Q?y/YwJfZCYZ9q2InRCUzbWJN08QuxhQizP4QQ/JLat+20U0HzaOjnL1GVw6Um?=
 =?us-ascii?Q?q/++c2nk/FqLGMqg4t6FrNhCVKULZ8YjWhUt24ceDXaklo9NlfcGk/XcM+i6?=
 =?us-ascii?Q?sCoBXE/RvsM+Zssv4CeUmtMDgKIxQjqYJtxGS5YKF33+h3v57Ok8caNPDe7p?=
 =?us-ascii?Q?0ZQBNvJ1k1taJRqTmJb5cIdv3aTdcGbbd1/4KoFVf0XyO389/4Ju/JUhkECj?=
 =?us-ascii?Q?6rjK2rFTk+RIsFY02DfnQW9EKTDkF0rfBtQ7HJ21NftHeKJyDd+tz9mFLtti?=
 =?us-ascii?Q?aqJJQRSxn5hVGsoiJ8xRIC3Mr3DCOevKDDRqshuEDb3ZyjmHoWg3b57GfP8a?=
 =?us-ascii?Q?KC9zhe7quBYROceicRjMJMkYMXGqyG3h8IL/Yp2aQHgbL1xY42Vwu1QPBEv8?=
 =?us-ascii?Q?F5PT9B0IlOy+f03XGqsRa+Wuf4x5sII/0ysUEeYEev+ZuAGjHqtX86goHHhN?=
 =?us-ascii?Q?ouUHl/zSu3KuxEfQNE4CKblC/7AOMtr4tWNKmbiuqhtWJ2WXWHqbsFiKoJaF?=
 =?us-ascii?Q?IQvgMYNE1R2GNN5tz2BRW9sZ4wzhhm7L0xU4zlVuUv+j1Et6EUNxvEaMV/Wh?=
 =?us-ascii?Q?nV/TafyfbSgT39U6xJzATzvC2ivEC5Dqwfl7v9oedjJpQMELhC46RN+HBT1b?=
 =?us-ascii?Q?wXUyj1TUXurnxDoV87oRT/rx91mopeZWvDeWz+BbndwbQ+OcZYcG6XwzzDCN?=
 =?us-ascii?Q?y9hQe7xO1PHD+84ea7Fj0gH32dEXYgvmArG4zqNegAPjOpGqHRq1BJn1tz2h?=
 =?us-ascii?Q?qQ8WOu8Ss+BF4Rf5skl+qvZUOm+EMlm3UOEBqcp3BefjdtsB6ThFWMA4Sc9S?=
 =?us-ascii?Q?XUk0BWReg9djDZEqrNnOEL05wCiyko/iUCP0Mw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hZh0Y7AZ3FpEEBcj3UEkuQ4jnu4cXd7FVzcd3sbeDw8Jm59BBN+dNH2IpCYs?=
 =?us-ascii?Q?JEMgCWL4awR0X4VrQgi8MibMBFsxS+1Lxb/KYbN1y7ttjIX5QBVxm9MxIyuU?=
 =?us-ascii?Q?0RMMkTjIIdr/Bq6dte5Fyzxl3ihPgMIlPEYulwewfkh+lqDRd5tYD8N3Xkd/?=
 =?us-ascii?Q?Y717iHV3tcmX/IiN/jX+Oi4FlgAGqBBffrlFLUOCwzX7neehlWqxKtt5796c?=
 =?us-ascii?Q?85CFt4X6R29cSykYR86hSwoDFGxXYdseqDkeXJjMqmibNUObPgOIa4YWHttV?=
 =?us-ascii?Q?OA3clkSD+OX9+Ocrwy2AWsZOr85sczUfh31v8z33yYAO2m2LwmjEfs+PQy0E?=
 =?us-ascii?Q?7zl/oQrqAtr/ga7P5HkMBppauZB6ghBcMH1j4NTIuBIGgTvoIWcGVDsPB5VL?=
 =?us-ascii?Q?DNqUb6KGvz9c0OjyvD/3Lo1apkWoZkfXCn+Jsm1aZ1WY7fsXYjeZovw8CURA?=
 =?us-ascii?Q?ViBuyp0z7GDl8qxg6PuzrZkzEQJMHjRL1qTFwJQY0xHsW9kUlEaS3PdfTVDe?=
 =?us-ascii?Q?OQtjnB7G3ZUpqse9ljtpdGOZzR7caWxiwR9AXRYFxZMG8XhEsB4Do+gzQfvF?=
 =?us-ascii?Q?gdSWhDJaUBAYijkakM86VSvmlLy/kbejzuuE4j69D6Or7HwiCiLErXhEDdR/?=
 =?us-ascii?Q?0NO8xiRFrJ8ehadiJXdKDJiNlhNuxJTfq9c+4Vvydu5OxrpfjarBrLXnZG6Y?=
 =?us-ascii?Q?yhti2xwdpbfmPHU/o2/OCbquGt1ffhosxDmysKKDPx7POGqYRRyie63mZ8E2?=
 =?us-ascii?Q?SJdkpZnfeOGzsYw7DGzcvrTqvYY5kZxhh97gGBY0V46hwlK34MmcOxJ2TgNL?=
 =?us-ascii?Q?gDqQA4BtF/cfPYG79kId9f2e8HsU2cxKjLz3pS11Yyy8PtU0mxPDikxtrW93?=
 =?us-ascii?Q?MsMFJkCbsCMd9Y18+XWMW7a5cNO7eM4hS6PzcZnm+D997KcfZpZiEneKmapt?=
 =?us-ascii?Q?v9aPe+9++0OSOMdppq+9VXfBTgktYXf075e8PitaafhYC4DDYqVNjMPbFVMl?=
 =?us-ascii?Q?B8roAsZgLM8RXJR41q1Mx0kM5o/ETRQkyvSPQwi5LoREt0bCaQ8IVwlalY3J?=
 =?us-ascii?Q?BMi1+zsvypicaWjxJrB61xOmQwoF84m1Jw32BRxU50V3Inu46Jq1vpTc7+7H?=
 =?us-ascii?Q?7mgoSSgtgzdjcBu/YHihKaMd/GmanTgLetsCT+Y0MG6YkWy8ocBHU9UpfX4s?=
 =?us-ascii?Q?ZMZ9WY2zIJ7kW42qbslRBV6Rh04vixA8WRPHmJuBoi4vNcSJS7tWFkWcsDzv?=
 =?us-ascii?Q?hpL+9QgVnPyfLRKgiMMy7BuPAGr8FlOpPT/ZLFAfpMnrvK/27e2QpOhItzdj?=
 =?us-ascii?Q?EiHwp0oqiPspVBJJn0pmRQ62lfRyfBIkE+drCNI0B2Xo+LKS2qaThfI33v3n?=
 =?us-ascii?Q?4/6pLeXZWALYwGDayB+1TnsNwuGW?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a02bc31-f1fa-476f-c66c-08df1755b9c8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 20:28:27.1663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB4927

On certain 2025 Lenovo laptops, such as the Yoga Pro 7 14ASP10 and Legion
Pro 7 16AFR10H, a switch on the side disables the camera. This is handled
by the firmware, which also sends event 0x0d (camera disabled) or 0x0c
(camera enabled) through the WMI event GUID handled with
ideapad_wmi_context_fn_keys. These events are currently reported as
KEY_UNKNOWN.

Other Lenovo laptops expose a similar camera switch through a separate WMI
GUID, which lenovo-wmi-camera reports as SW_CAMERA_LENS_COVER since
commit d98bf6a6ed61 ("platform/x86: lenovo-wmi-camera: Use
SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS"). That driver does not
bind on these laptops, so do the same here: as the switch state cannot be
read from the firmware, register a separate input device with the switch
on the first event, and report the state carried by each event.

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
Changes in v2:

* Add lockdep_assert_held(&ideapad_shared_mutex) and a comment at the top
  of ideapad_camera_switch_report() to document and check that the WMI
  notify path is serialized through ideapad_shared_mutex (suggested by
  Huang Wei)
* Replace dev_warn() with dev_warn_once() in
  ideapad_camera_switch_report() so that a persistent registration failure
  does not log a warning on every toggle (suggested by Huang Wei)

Link to v1: https://lore.kernel.org/platform-driver-x86/SN6PR19MB23039910DD1918BEE3825BAFFC862@SN6PR19MB2303.namprd19.prod.outlook.com/

Notes (copied verbatim from v1, to keep the context easily accessible):

* I considered a couple of alternatives to the approach in this patch:

  1.  Simply map 0x0c and 0x0d to KEY_CAMERA_ACCESS_ENABLE/DISABLE:

      { KE_KEY,	0x0c | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_ENABLE } },
      { KE_KEY,	0x0d | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_DISABLE } },

      similar to the touchpad off/on hkey events (66/67) this driver emits
      after the firmware has toggled the touchpad state. However, HUTRR72
      describes these hkey events as asserting a camera access state for
      the host to apply, rather than reporting one the firmware has
      already applied. Furthermore, lenovo-wmi-camera moved away from
      these hkey events in favor of SW_CAMERA_LENS_COVER in the quoted
      commit, which is arguably the closest relevant precedent.
    
  2.  Ignore these events like the firmware-handled FnLock events:

			{ KE_IGNORE,	0x0c | IDEAPAD_WMI_KEY },
			{ KE_IGNORE,	0x0d | IDEAPAD_WMI_KEY },

      This fixes the KEY_UNKNOWN issue, but userspace gets no information.
    
  Overall, in the end I copied the approach of the lenovo-wmi-camera
  driver. Kindly let me know if there are other/better solutions.
    
* Unlike the touchpad, whose state this driver reads with VPCCMD_R_TOUCHPAD
  at probe, on resume and on each event, the camera switch state is only
  available in EC-private fields, and the two tested laptops even use
  different ones. Hence the lenovo-wmi-camera approach: the switch appears
  on the first event, and a change made while suspended is not reported,
  leaving the state wrong until the switch is toggled again.

* For reference, on KDE Plasma 6.7.5, using the Legion's touchpad toggle
  button shows an OSD, but nothing on a SW_CAMERA_LENS_COVER change or if
  sending KEY_CAMERA_ACCESS_ENABLE/DISABLE events. I am not sure whether
  this is simply a case of "not implemented yet" or if I misunderstood how
  these events are supposed to be used to communicate with userspace.
  Please feel free to correct me here.
  
Best regards,
Marco
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 59 ++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 207368f5d489..0066638ee332 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -178,6 +178,7 @@ struct ideapad_private {
 	struct ideapad_rfk_priv rfk_priv[IDEAPAD_RFKILL_DEV_NUM];
 	struct platform_device *platform_device;
 	struct input_dev *inputdev;
+	struct input_dev *camera_switch_idev;
 	struct backlight_device *blightdev;
 	struct ideapad_dytc_priv *dytc;
 	struct dentry *debug;
@@ -1410,10 +1411,43 @@ static int ideapad_input_init(struct ideapad_private *priv)
 	return err;
 }
 
+static int ideapad_camera_switch_init(struct ideapad_private *priv, bool covered)
+{
+	struct input_dev *idev;
+	int err;
+
+	idev = input_allocate_device();
+	if (!idev)
+		return -ENOMEM;
+
+	idev->name = "Ideapad Camera Switch";
+	idev->phys = "ideapad/input1";
+	idev->id.bustype = BUS_HOST;
+	idev->dev.parent = &priv->platform_device->dev;
+
+	input_set_capability(idev, EV_SW, SW_CAMERA_LENS_COVER);
+	input_report_switch(idev, SW_CAMERA_LENS_COVER, covered);
+	input_sync(idev);
+
+	err = input_register_device(idev);
+	if (err) {
+		input_free_device(idev);
+		return err;
+	}
+
+	priv->camera_switch_idev = idev;
+	return 0;
+}
+
 static void ideapad_input_exit(struct ideapad_private *priv)
 {
 	input_unregister_device(priv->inputdev);
 	priv->inputdev = NULL;
+
+	if (priv->camera_switch_idev) {
+		input_unregister_device(priv->camera_switch_idev);
+		priv->camera_switch_idev = NULL;
+	}
 }
 
 static void ideapad_input_report(struct ideapad_private *priv,
@@ -1422,6 +1456,22 @@ static void ideapad_input_report(struct ideapad_private *priv,
 	sparse_keymap_report_event(priv->inputdev, scancode, 1, true);
 }
 
+static void ideapad_camera_switch_report(struct ideapad_private *priv, bool covered)
+{
+	/* The WMI notify path is serialized through ideapad_shared_mutex */
+	lockdep_assert_held(&ideapad_shared_mutex);
+
+	if (!priv->camera_switch_idev) {
+		if (ideapad_camera_switch_init(priv, covered))
+			dev_warn_once(&priv->platform_device->dev,
+				      "Failed to register camera switch input device\n");
+		return;
+	}
+
+	input_report_switch(priv->camera_switch_idev, SW_CAMERA_LENS_COVER, covered);
+	input_sync(priv->camera_switch_idev);
+}
+
 static void ideapad_input_novokey(struct ideapad_private *priv)
 {
 	unsigned long long_pressed;
@@ -2312,6 +2362,15 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
 			break;
 		}
 
+		/*
+		 * Camera switch, handled by the firmware:
+		 * 0x0c camera enabled, 0x0d camera disabled
+		 */
+		if (data->integer.value == 0x0c || data->integer.value == 0x0d) {
+			ideapad_camera_switch_report(priv, data->integer.value == 0x0d);
+			break;
+		}
+
 		/* 0x02 FnLock, 0x03 Esc */
 		if (data->integer.value == 0x02 || data->integer.value == 0x03)
 			ideapad_fn_lock_led_notify(priv, data->integer.value == 0x02);

base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
-- 
2.55.0

