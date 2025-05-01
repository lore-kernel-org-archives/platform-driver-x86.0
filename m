Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F0F2DC76A
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746105459; cv=none; b=lL3Cn85nKdw3RR+bYbLICxyC9389hDNcBHR26kZk1GHL96EDXYgjuLbRiuAQE2BZUOzvU7iXB3wrPZH2zo2ZL0iVXKqHONcS1y9RjPINsbS1ISjV1PtQzYFv+WQOO4n0Wc3bAE2BvoWW+hMV6dRdi0bTbCPXQ8T6Qq5qTksDWFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746105459; c=relaxed/simple;
	bh=n/LuJy4IbvpnToFDoZFOW75NjR0yIpsmBXo9ARE6FwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i8spfQ6PYKN5VRl2HOzr4ylKeQc03saqFrZUDhnntzl/pcZY9DOSVRJg5nhrVbkcwHH1mE45qdRseNJQI3mN8nGVzQ7DmyMlmWExAiYSVpOleEGYgl2YgYCmhd/GLwwTgM5hiudRkiZJffCM6PYERKmRZ0c0ab7zBqxScJ/eJqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZTzULo6J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZTzULo6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746105451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aKpGa+9Oigg1Eg1NeH+qbeL/8taHsweG/umwwR4gXmw=;
	b=ZTzULo6JTwRJh2P1JQtvozGttnsvAeeeTl/+OZ83HHlFRP3TRzCNPISOOsSooLN1Opuz2m
	3v73drRN0pcN2K6Wb7pZDld87olAGPcy5O2uH9fSpa3MpsdZ+ybGhxQbJ+JG5EWzcOYN5w
	is6C5oRsNularByulu/QcPCwvhHPX2o=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-iLrRBqN_PKO4mXXzhBtPyg-1; Thu,
 01 May 2025 09:17:22 -0400
X-MC-Unique: iLrRBqN_PKO4mXXzhBtPyg-1
X-Mimecast-MFC-AGG-ID: iLrRBqN_PKO4mXXzhBtPyg_1746105436
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C5071956086;
	Thu,  1 May 2025 13:17:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.142])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A109B195608D;
	Thu,  1 May 2025 13:17:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	AceLan Kao <acelan.kao@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	acpi4asus-user@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/1] platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection
Date: Thu,  1 May 2025 15:17:02 +0200
Message-ID: <20250501131702.103360-2-hdegoede@redhat.com>
In-Reply-To: <20250501131702.103360-1-hdegoede@redhat.com>
References: <20250501131702.103360-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The wlan_ctrl_by_user detection was introduced by commit a50bd128f28c
("asus-wmi: record wlan status while controlled by userapp").

Quoting from that commit's commit message:

"""
When you call WMIMethod(DSTS, 0x00010011) to get WLAN status, it may return

(1) 0x00050001 (On)
(2) 0x00050000 (Off)
(3) 0x00030001 (On)
(4) 0x00030000 (Off)
(5) 0x00000002 (Unknown)

(1), (2) means that the model has hardware GPIO for WLAN, you can call
WMIMethod(DEVS, 0x00010011, 1 or 0) to turn WLAN on/off.
(3), (4) means that the model doesn’t have hardware GPIO, you need to use
API or driver library to turn WLAN on/off, and call
WMIMethod(DEVS, 0x00010012, 1 or 0) to set WLAN LED status.
After you set WLAN LED status, you can see the WLAN status is changed with
WMIMethod(DSTS, 0x00010011). Because the status is recorded lastly
(ex: Windows), you can use it for synchronization.
(5) means that the model doesn’t have WLAN device.

WLAN is the ONLY special case with upper rule.
"""

The wlan_ctrl_by_user flag should be set on 0x0003000? ((3), (4) above)
return values, but the flag mistakenly also gets set on laptops with
0x0005000? ((1), (2)) return values. This is causing rfkill problems on
laptops where 0x0005000? is returned.

Fix the check to only set the wlan_ctrl_by_user flag for 0x0003000?
return values.

Fixes: a50bd128f28c ("asus-wmi: record wlan status while controlled by userapp")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=219786
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 38ef778e8c19..f66d152e265d 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4777,7 +4777,8 @@ static int asus_wmi_add(struct platform_device *pdev)
 		goto fail_leds;
 
 	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WLAN, &result);
-	if (result & (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT))
+	if ((result & (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT)) ==
+	    (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT))
 		asus->driver->wlan_ctrl_by_user = 1;
 
 	if (!(asus->driver->wlan_ctrl_by_user && ashs_present())) {
-- 
2.49.0

