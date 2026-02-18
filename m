Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A74284896;
	Wed, 18 Feb 2026 00:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771375887; cv=none; b=R30uomwBbQFKEQW7x2SWRNAmO20FQsR3Dymd9eXw/kIQfs+kSJu0LZFOyJN3mBCz45CR6ylbYyZ7bGIO5nZ2FnShic7YOOoPFeCmGe+KJimRxlLK5WAYACOhIpSkf31U2U8vBsdXnY3gQHMcqq5OqSTv+u16r6ZzSrro5/KznO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771375887; c=relaxed/simple;
	bh=SgGEJ6jGJjrH5W4N+tVNl14inJPJDc0oBYU7oFEuoSY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CwauHu2uiZQI3T2ulDvPzVW3fFAtYcpGFiAW9B9HcP35YC4Yq+G+mBnUS0m23iJYwxxdgtDwkexe3Vpz3fTJ8akXEkSmjpyQ2PEg/CnqF5DbuceABoNzr0PlPz7KvLIKdT11lshwckruvPg8mB6kdaqvu7j9c4Xw4r9ej20lDTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=GQa08jz8; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GQa08jz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771375875; x=1771980675; i=w_armin@gmx.de;
	bh=iCZ4H5tfp9GDmZ6OSXzwWkL5qGUUcYyVBsxa5S1FiI0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GQa08jz8T9J4zdrCM5qw1GEcvsQjqZdhb49dg6kY92143ygPYY96ZSNc+M+n0Htm
	 9CfOKYyNMboWUvRZOYn809+Cz1dlgun6AWT+5ylQM8vj2mDDhcxyiY6oFgesZlqsw
	 ++NfJL1Y/H923wcaXWDkneokrTIyvfYguzoTUTP3m2TBmPzMPEJrg4dZHCv1i6xOY
	 eqgGgpxqAcJQ8UTYQhLf2je5dFC7mQNuHiQzQH7T9Aa6yekuCuwAGVayZO+o8w9N3
	 5DX3mIEbYKS5C546rh4n0LHLk20NJvhkCb93mMI/gQwr3T6roWqNLwQ9f1FKiQnED
	 JrocfdJSmaHBqXyaDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MgNct-1vGQsm0Cxb-00ljhZ; Wed, 18 Feb 2026 01:51:15 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] platform/x86: uniwill-laptop: Fix crash on unexpected battery event
Date: Wed, 18 Feb 2026 01:50:59 +0100
Message-Id: <20260218005101.73680-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260218005101.73680-1-W_Armin@gmx.de>
References: <20260218005101.73680-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2TxVjy8p+Tb79gyd/6QnwJc7LqVjiFCyCUJ2kj3EYluecyZ3HS4
 RymK/EdE5lKlOm8c4f2CR2MIHvUB6JsosP+YB/b4HUgJLw2GE3GHwueftI7l1PwoZQThxXE
 1URPWf1yKivFZjrOlmV5dvBgR/JYpBlydRf/kgXdfwfBc0gkuOfvwNHPhR6MAHWJh5GlF3b
 4WQU9B63EZeezpMWjR2Jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4BZcNxsq2p4=;bBFV5SzmhlKBPGPi2Pf3PU1Oe3/
 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

On devices that have not UNIWILL_FEATURE_BATTERY set, the underlying
hardware might still send the UNIWILL_OSD_BATTERY_ALERT event. In such
a situation, the driver will access uninitialized data structures when
handling said event.

Prevent this by only handling the UNIWILL_OSD_BATTERY_ALERT event when
UNIWILL_FEATURE_BATTERY is set.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 2abae9faceb7..03694e51d0ae 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1359,6 +1359,9 @@ static int uniwill_notifier_call(struct notifier_blo=
ck *nb, unsigned long action
=20
 	switch (action) {
 	case UNIWILL_OSD_BATTERY_ALERT:
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
+			return NOTIFY_DONE;
+
 		mutex_lock(&data->battery_lock);
 		list_for_each_entry(entry, &data->batteries, head) {
 			power_supply_changed(entry->battery);
=2D-=20
2.39.5

