Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02DE334C2D;
	Thu, 26 Feb 2026 00:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772066082; cv=none; b=sCE+hpgx6rx7YXMCq8Za98830B9cSTfgX3Q7CoFoHBKmBtygPw6KTtGYFHhWIrApiEQaIJ3eAptTAG6OIhzrxvQUhN1Htb/K7QiseBSytTzeEtMeu99Zg3Unxv1vTuKqXRjdR3xpsyMSQQS2x3VdyPOPGhdR2AqjUyjVfRibpDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772066082; c=relaxed/simple;
	bh=FMGMHoTjwPt/bXU/4luizA+S4f2sU4XiJzepCTV3gvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYY8GWGHmg69nzifHEyradyt1i1dZZ+riNL8x3CL4nrglcQGnTpLNcHS9IbnqQJ5mwZ3WZRS1DMd8+7HEE/IAHFTujSdIQJULpWt6sjXu1juCrQzeZRkSYVomdyRK0Za3ZRenHyjyXFsxL9DFUzxN2WkLlAgLnbN3VvFMnsTVZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=B1X76Oxj; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="B1X76Oxj"
Received: from wse-pc.fritz.box (i5C75F712.versanet.de [92.117.247.18])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 717002FC0057;
	Thu, 26 Feb 2026 01:34:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772066071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wPaY9YcUS0IPBOJ/973YSQYOrjPX9lejzk7xilUKI3E=;
	b=B1X76OxjEyFb4tzmiYU64Qzhc2eiRNXAjiia2LGRKdSHRuSND3SObxqxoiAb+cPdCISU5J
	tqLnyvMrLI3X+wV75PWGyPoJkFk+7bkf2ygjDcnTSonb94dSTeH1zc/xLPi19/7/z/mOv6
	vlQNNe605rPsr1Dy+FLyO21NqCx/AA4=
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
Subject: [PATCH 4/4] Documentation: laptops: Update documentation for uniwill laptops
Date: Thu, 26 Feb 2026 01:31:40 +0100
Message-ID: <20260226003408.1623547-4-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226003408.1623547-1-wse@tuxedocomputers.com>
References: <20260226003408.1623547-1-wse@tuxedocomputers.com>
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
index 2df70792968f3..55943252f2ab9 100644
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
+		Allows userspace applications to set USB-C power distribution profile between one
+		that offers a bigger share of the power to the battery and one that offers more of
+		it to the CPU. Writing "charging"/"performance" into this file selects the
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

