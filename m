Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E4521FF26;
	Thu, 12 Feb 2026 07:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770879777; cv=none; b=CqhB6InOYPo8og/4qTsKLz5MU5hCfs8gdjdSfZN7DhZi8iB+pkWHcLtJoVbskddCF3OQe/u1UGfswgAg5Ef6RQ7z8zVOVMcse1fzHB+cqNCaRkFpZAY51rkuLbGaGOH7WBg9L5loRAIhywQn9GbEnn332ils6ykIKjt/BJcGlJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770879777; c=relaxed/simple;
	bh=SE7gEoZ+dEfHGRInNcKWsKvv5KuSq2wDxg4nC8t0YGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mhU5CNySAar4aHL4sB4bQtY/XeYHU5aLda43gw7HU+Cm8R8zSwZ2F+oNQnL4yqMh34ekjZHlq6rdFaKBv3hVhEwS38RBBdgAbZqYwEV28r8mZN7BzkXMT3ISojxktszgHGmhFK1Mh3oXuLcox/Y8pzAb8YfWjrMHY2nmNxpdTz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=i90FMVOp; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="i90FMVOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770879772; x=1771484572; i=w_armin@gmx.de;
	bh=bJB6e1RTr/AUgGx1Y0uId8bipyTX8qUIJ3ZoRPdGMIk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=i90FMVOpkmHQtiYlc776FzbKTZnC7cQHXQ4OmCl3z5Ns9oRqsMoQszrk7SIijWdz
	 vuNxGtqnjHXSQlBq09c6e6WjtN5LaxxPNQ6ZrSZUhyQ+o8dw8xViWiK9qZ8pVrTMi
	 rV+R/6XsEqqHcEVVXhquRdYQDVxqZ69Q97rZRyNjHu7lEmpsdCwmFLcqyriqnjWdF
	 3CMqohMoxEs+fmHd1R2AP5FdN8X5JsKXHmv9zWeHffjo897JhuPZfIjZknOwiw7vK
	 HbZw7MI/4wZYUQGnb6zTvE3IpMMmyJP1+v+vpWOgngV9RwxOCHROIUbk91oTuvAvE
	 FWKQME5XDKAcfJh5VA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MOiDX-1w9JJb1ru3-00U3wb; Thu, 12 Feb 2026 08:02:52 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] platform/x86: uniwill-laptop: Handle super key enable/disable events
Date: Thu, 12 Feb 2026 08:02:36 +0100
Message-Id: <20260212070236.17296-6-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:eCZgZe47HOrai0k8sf5uFYscLbk730RWg6T6V9+qdnglY0N/kwG
 dcceoiMR79ur1oeHzJezRZdi/syoF8Ps7KJ9SQIn9MTuzigP+U0F6yAaPvddEXaPzoKHHiZ
 U5QcQs0rX/G+qLoQl+IWoAyGaJJFhu0KLefidDRcMGcmz//IvLwlcovuyjufuTztYYPZ6Dh
 kx29lwH35WPCyjatGjRPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MRmMSU8jNR0=;HiNiBruWviORm/SEPyo71FSoNlR
 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

On many devices, the user can enable/disable the super key by
pressing Fn + F9. Forward the associated events to the
super_key_enable sysfs attribute as a poll notification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index afa534da6d57..d97a1e050740 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -378,9 +378,6 @@ static const struct key_entry uniwill_keymap[] =3D {
 	{ KE_IGNORE,    UNIWILL_OSD_CAPSLOCK,                   { KEY_CAPSLOCK }=
},
 	{ KE_IGNORE,    UNIWILL_OSD_NUMLOCK,                    { KEY_NUMLOCK }}=
,
=20
-	/* Reported when the user enables/disables the super key */
-	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_DISABLE,		{ KEY_UNKNOWN }},
-	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_ENABLE,		{ KEY_UNKNOWN }},
 	/* Optional, might not be reported by all devices */
 	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,	{ KEY_UNKNOWN }},
=20
@@ -1353,6 +1350,14 @@ static int uniwill_notifier_call(struct notifier_bl=
ock *nb, unsigned long action
 	struct uniwill_battery_entry *entry;
=20
 	switch (action) {
+	case UNIWILL_OSD_SUPER_KEY_DISABLE:
+	case UNIWILL_OSD_SUPER_KEY_ENABLE:
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
+			return NOTIFY_DONE;
+
+		sysfs_notify(&data->dev->kobj, NULL, "super_key_enable");
+
+		return NOTIFY_OK;
 	case UNIWILL_OSD_BATTERY_ALERT:
 		if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
 			return NOTIFY_DONE;
=2D-=20
2.39.5

