Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747583BB40;
	Thu, 12 Feb 2026 17:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770918247; cv=none; b=TbX85N2oHX+6R67GLRA7MvUbZyb1fHBOeJzv9UmGqmI0DdbFM7nU5Qlea8pXCI8qZQvL9VJDe7ECHL02+MANKss6/tTqX2jOnpy5JesBsQzKIpP7wPk4VJNLIMvVPr5YVvudThUz2oQqO+WtlbLER5laxHKjvfplGOwaeX3Mz6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770918247; c=relaxed/simple;
	bh=SgGEJ6jGJjrH5W4N+tVNl14inJPJDc0oBYU7oFEuoSY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pGe7Em3V9qpc11J/+UAVxUAfk+i32yv+77PbhD7SgATBASOvFbzmo5I5ea0KZeR8rr82skBevrzs5IVQwvEZL4l5Q67UBkrSs4y4Geg8msDxFA1J8LkQ+MTQswALFRmz6b4Y4rdhtRlqLW/j9hrI+qWrjrpmvpwzy2iMIJm7WeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=eOQ22JdP; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="eOQ22JdP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770918243; x=1771523043; i=w_armin@gmx.de;
	bh=iCZ4H5tfp9GDmZ6OSXzwWkL5qGUUcYyVBsxa5S1FiI0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eOQ22JdP+N43h/uL8b/4LExa7kptFvxAeCW5snQObzGb5LpjD/afhjITODzRnNki
	 AKC+rvxeSRg4/Vfg5gKOEGeXCS10U15CWVyAOk3wMvhfVJCmPTNJuDbe9Z6neJWpM
	 4cqDBdtigbTV8UrQL/NWjAUAYFDUa8nPKzerr8xOCg/gtj9+8bAvxdL8rRGSYaXoU
	 TE2KyVfvoFGdjRBMG8k63/NAcdZR00rOk5TlV0uo6DV7otnfF2PVnwSzV6iTIYlfy
	 477VkT+jRRFBYJHIibhwkZr20DYgjwGND9Pjz28qv+/aBzwhGgV+8wu84ZWONA8DI
	 yV7KK8VnFh9Wqk4oyQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mlf4c-1vPokj0lvO-00dloz; Thu, 12 Feb 2026 18:44:03 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] platform/x86: uniwill-laptop: Fix crash on unexpected battery event
Date: Thu, 12 Feb 2026 18:43:52 +0100
Message-Id: <20260212174355.23965-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260212174355.23965-1-W_Armin@gmx.de>
References: <20260212174355.23965-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NAhX0Nphx75F13ay370CpqVsHTA1euAojaREyqICigR2PDvhhLM
 QaMSUEALlCz+tQownteLl7oGYzpDJlN+5JdnFo58F+tXQMWWzeO5QxgLCiMkHrK799kENTs
 EXzfvDVxVI9WKKykMNTsZwfJ9IRB7B1Ps+xzcUQNR/y3AIuoaS5T6J8BhGHCFuWLLhqn/+3
 QD3XN0HxZErGaA/tgACTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D7RR4/LUqJw=;1Vh6h4TmYZTUAviDDrO0UhedOvd
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

