Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E5E28CF49;
	Thu, 12 Feb 2026 07:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770879781; cv=none; b=M+mtODiLue8nfvihvcSO6dRYVLnm/AqHKRV6MZP5OPFvYToZDwke0APPo1hknx6m6KM3kMhcUBmrQ36ig5NdOAC5fadWQUtbjUfzw2yRnmfUQA7oPhHt1Ikuw8ZUoeAuMH5b3m47rWX87Xj0TrBc5SHMjxgdIoLDKGruk1vumNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770879781; c=relaxed/simple;
	bh=iWoz/RXFyu0qvw2iBlfsNazFTR/zqoX6Mt723oU44+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bgw4k8KPT1kmd3YldBxvnW430PaVKqreIfV8ZCk1gfhTVW+Nkt4WVocw/aLRZc+LCiuV6PYwFZizBBtWQ7RIittundasm7ZPN+G7KZ8qUJFOEYIaYfFilElwQxXdKUCpPD5Mh/aUUtSsLESDbZfy7GBKaHKNJsHbCSm50EycJy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=dGZQiHPc; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="dGZQiHPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770879771; x=1771484571; i=w_armin@gmx.de;
	bh=/T6LXWJKHRbPYRiq/9MejegjR5c/zSd6mMGoanPYgbQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dGZQiHPcURFHjAIMb0VKmbmI2CvUFnvBeBtQkPHtiahuhH0ay1Owm9eioZal9RqH
	 Ww3uRE5xtRxlBTe6cht2LaTmvuyOhIQtUoeFEM1m8IxJV781ZPAB3TLg9zaphlvID
	 SPK6/UejOEpYrtiNmsnnXqEySCAqK9DKo3NEHTp9Dhp0W8rZ/AblXLdufYLmfte4D
	 Z8g4VUGPNypr7wh6SG8ABNL635LtcdpEHB3pabIjljEbNhGnhetsNzJ8SBrVOFYhL
	 EOIGP+lC+lJ73Fo2uQNUOKVe2enc4t88Ir2SLqy6HBPX1tMzCCPj5YGiwWbK04FRi
	 PGr23PtPWEoNGojNwA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mf078-1vK5lw3ODi-00cygG; Thu, 12 Feb 2026 08:02:51 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] platform/x86: uniwill-laptop: Handle FN lock event
Date: Thu, 12 Feb 2026 08:02:35 +0100
Message-Id: <20260212070236.17296-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260212070236.17296-1-W_Armin@gmx.de>
References: <20260212070236.17296-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CGJAl8fOSHhbBRzZUDfoc+hNnDOokLGc1H6Rkh5aeRSO58GlNxj
 2V8HIhyBlP0XjKTUNrWcEpBgrGOfYa21sFSX0FQO8MVGU+EdwSLGJJvNzJ2C4UYbaxyMJFe
 sf401p0DDyLp7CAMcBZAKgrOjm+b+vCpe4muvQKIjBW32Ou32oODmqmBAntzww023W22POG
 9YpQn0d26WjQdxDYRlEMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AcJD6+e6hCw=;pxmkDOjVPq+avaQhZbeGNlW8c5S
 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
 qGN5/8jwU6EzM0SPOJrETAR0cEtZM

On many devices, the user can toggle the Fn lock state by
pressing Fn + Esc. Forward the associated event to the fn_lock
sysfs attribute as a poll notification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 5ff8fcec9d9e..afa534da6d57 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -402,9 +402,6 @@ static const struct key_entry uniwill_keymap[] =3D {
 	/* Reported when the user wants to toggle the mute status */
 	{ KE_IGNORE,    UNIWILL_OSD_MUTE,                       { KEY_MUTE }},
=20
-	/* Reported when the user locks/unlocks the Fn key */
-	{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC }},
-
 	/* Reported when the user wants to toggle the brightness of the keyboard=
 */
 	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLUMTO=
GGLE }},
 	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL0,              { KEY_KBDILLUMTO=
GGLE }},
@@ -1372,6 +1369,13 @@ static int uniwill_notifier_call(struct notifier_bl=
ock *nb, unsigned long action
 		 * gets implemented.
 		 */
=20
+		return NOTIFY_OK;
+	case UNIWILL_OSD_FN_LOCK:
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
+			return NOTIFY_DONE;
+
+		sysfs_notify(&data->dev->kobj, NULL, "fn_lock");
+
 		return NOTIFY_OK;
 	default:
 		mutex_lock(&data->input_lock);
=2D-=20
2.39.5

