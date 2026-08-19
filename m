Received: from mta1.migadu.com (out-52.mta1.migadu.com [95.215.58.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B336CDF3
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 20:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787172840; cv=none; b=gwPakCbjQVfbyXGvqKYzuJ40j620A5mVm/LwsVjUWCwXS8KxzwO/JZLBTYqXDy2pKA547QwKFYAWNj3JaUoeH02/oVXTGMSTM3JvPutOEwFve1UQbKzCZv/cfZhNZLIHdBwUJ+Uumb72LjMJT9Btcn9BQ6QnPjY/Pc6GTNGmAps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787172840; c=relaxed/simple;
	bh=+9nrHU3ptpPAj0tbwXOOwPG3+DSQ6FaHyUVEern1YDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ABQn/hKRs56qCfY62JUPku6UwOrQ2aQn7NPcmKzgtG+CIxRnFkEjPl/iyFWreCdewqXCsafr2sU9Xm2I949J8Zm+HHwbfv0MjmX6FiU+dkrj2zp1d4HLLxctqUUjoeojQ3o2dVZmSa6X14wC4E/8rMvbpKDjNwXohQLUBvi5jws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oyHE3JU2; arc=none smtp.client-ip=95.215.58.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oyHE3JU2"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+9nrHU3ptpPAj0tbwXOOwPG3+DSQ6FaHyUVEern1YDQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787172836; v=1; x=1787777636;
 b=oyHE3JU23MoQMgLIq4Af0r04IDn9GNU0qIC53zrDL7xviIghmaLfvwa00PqeHfSjQoEXdppo
 s0HQrEAGjvQED73tYxUXxKIfrQZ0GGafsDprOGEPXebVvfJMP35Du6D18PRPXAYUpRN/4CpDKmA
 HmJv+d209780aO10sdyUN/gQ=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: from kernel.denis-pc.lan (151.61.14.130)
	by smtp.migadu.com with ESMTPS id a63a645b830a3e85;
	Wed, 19 Aug 2026 20:53:55 +0000
X-Mizu-Trace-ID: a63a645b830a3e85
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	=?UTF-8?q?Manuel=20A=2E=20R=2E=20de=20Or=C3=BAe=20R=C3=ADos?= <deor001@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Salvatore Bonaccorso" <carnil@debian.org>,
	Ponali <ponali2k@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-wmi: fix unclear usage of bd->props.power
Date: Wed, 19 Aug 2026 20:53:53 +0000
Message-ID: <20260819205353.1651888-1-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bd->props.power is checked in parts of the driver correctly comparing with
BACKLIGHT_POWER_ON, while in others with a raw usage of bd->props.power
and !bd->props.power, moreover in certain checks the logic has been
inverted due to BACKLIGHT_POWER_ON being defined as 0: fix both the wrong
usage and the inconsistencies by using proper comparisons.

Fixes: 130d29c5627c ("platform/x86: asus-wmi: adjust screenpad power/brightness handling")
Closes: https://lore.kernel.org/all/178362762638.911488.8564892548331679884@eldamar.lan/
Closes: https://lore.kernel.org/all/ea9c63d1-4776-49d5-9dc4-6c09498f99c9@linux.dev/
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-wmi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8610663b8269..3600dddd8f36 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4500,7 +4500,8 @@ static int update_screenpad_bl_status(struct backlight_device *bd)
 	u32 ctrl_param = bd->props.brightness;
 	int err = 0;
 
-	if (bd->props.power) {
+	switch (bd->props.power) {
+	case BACKLIGHT_POWER_ON:
 		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
 		if (err < 0)
 			return err;
@@ -4508,12 +4509,17 @@ static int update_screenpad_bl_status(struct backlight_device *bd)
 		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
 		if (err < 0)
 			return err;
-	}
+		break;
 
-	if (!bd->props.power) {
+	case BACKLIGHT_POWER_OFF:
 		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
 		if (err < 0)
 			return err;
+		break;
+
+	default:
+		pr_warn("Invalid screenpad backlight power state: %d\n", bd->props.power);
+		return -EINVAL;
 	}
 
 	return err;
-- 
2.47.3

