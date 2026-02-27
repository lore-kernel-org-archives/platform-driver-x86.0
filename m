Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C346AF30;
	Fri, 27 Feb 2026 20:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772222955; cv=none; b=O4DYYaREeDs5uZXZMPUzKpF3RTGPRuYF5kP5qQLTYWoWtQKUlJmJGZGFKUST9uQcqo4AIBQ+sReYLUYQ8ajYpdQlzGrxsjDQhgMSvJQHSD6y2rpcXMmoSWy2vM1o40hrD/pG35uurHY1oQmU4mtX1P/K0lD2Inzx6bIX4WYiZe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772222955; c=relaxed/simple;
	bh=EAaOXPyqmqUhcKP/oFE45gbdUh+zHhzi//bEmNmP/20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ja30ZK1ndYis5THlKj4GA4rkY7z3y6IwNB7xHz+iOaRBsWWc+p0F7PqscezbgDdcOgjPZoANo6Wox+rvT6HHRJrKIyaii19Jo9x55Ia8ESbEQOc3zbarqA2EVaI+LuYHejRGjMMQ7TaVxIBCT9rXPvyj4fXOtpNaX4/yHE8P1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=BogyQmnp; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="BogyQmnp"
Received: from wse-pc.fritz.box (i5C75F712.versanet.de [92.117.247.18])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 054492FC0057;
	Fri, 27 Feb 2026 21:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772222952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vLp4brTcqKPguCCOAVct3VOIP0KbOI4TypSo5vsCp4=;
	b=BogyQmnp+nDhUIF6xDOpzjhyUC+QZyHcGuYRjXHtbfqGBzQX6/DF4PJOfzUaxnAjFn4cqd
	yKCbGoYKeDMeKk8lNelOyMguWlZ8EIyIBq90l1Sdf9plMiWj9fpzUewzHSJU0D8/uCK8PY
	wGKMYgNp7l7Nzkk4eoPkNsh8HMbhWy4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 4/4] Documentation: laptops: Update documentation for uniwill laptops
Date: Fri, 27 Feb 2026 21:07:17 +0100
Message-ID: <20260227200906.514928-5-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227200906.514928-1-wse@tuxedocomputers.com>
References: <20260227200906.514928-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds short description for two new sysfs entries, ctgp_offset and
usb_c_power_priority, to the documentation of uniwill laptops.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
 .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
index 2df70792968f3..70b4bc97d91a8 100644
--- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
@@ -51,3 +51,28 @@ Description:
 
 		Reading this file returns the current status of the breathing animation
 		functionality.
+
+What:		/sys/bus/platform/devices/INOU0000:XX/ctgp_offset
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	Werner Sembach <wse@tuxedocomputers.com>
+Description:
+		Allows userspace applications to set the configurable TGP offset on top of the base
+		TGP. Base TGP and max TGP and therefore the max cTGP offset are device specific.
+		Note that setting the maximal cTGP leaves no window open for Dynamic Boost,
+		effectifly disabling that feature for the GPU to always be prioritized.
+
+		Reading this file returns the current configurable TGP offset.
+
+What:		/sys/bus/platform/devices/INOU0000:XX/usb_c_power_priority
+Date:		February 2026
+KernelVersion:	7.1
+Contact:	Werner Sembach <wse@tuxedocomputers.com>
+Description:
+		Allows userspace applications to choose the USB-C power distribution profile between
+		one that offers a bigger share of the power to the battery and one that offers more
+		of it to the CPU. Writing "charging"/"performance" into this file selects the
+		respective profile.
+
+		Reading this file returns the profile names with the currently active one in
+		brackets.
diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Documentation/admin-guide/laptops/uniwill-laptop.rst
index aff5f57a6bd47..c89b8b3756f84 100644
--- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -50,6 +50,10 @@ between 1 and 100 percent are supported.
 Additionally the driver signals the presence of battery charging issues through the standard
 ``health`` power supply sysfs attribute.
 
+It also let you set whether an USB-C power source should prioritise charging the battery or
+delivering immediate power to the cpu. See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for
+details.
+
 Lightbar
 --------
 
@@ -58,3 +62,11 @@ LED class device. The default name of this LED class device is ``uniwill:multico
 
 See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on how to control the various
 animation modes of the lightbar.
+
+Configurable TGP
+--------
+
+The ``uniwill-laptop`` driver allows to set the configurable TGP for devices with NVIDIA GPUs that
+allow it.
+
+See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
-- 
2.43.0

