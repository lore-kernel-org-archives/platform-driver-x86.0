Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A6A33CE8F
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711906; cv=none; b=vD3kWVbTTRnUa4MGWJij0uPlz3K1luapsBT0erkyOpku4xtAN4Rvc2hykBZvVmb18aUjTYniZScD3aiynRQJLy5pr6laKV32od3SgvJ2HjBYnTOVEyhv19WmO7GW4N0PLyQGS4yORU3cfVdJujcnNKa75YgIbqCL3tTqhozWrA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711906; c=relaxed/simple;
	bh=ivJ5+UsFGsqT0C/3r/DKn+KMqeA79eDBfsZLUJBfcgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+lHpaocaQHRBZJuwyZ2Y7DvlFo2yN8EMbOqLmnfMPUvGhWDe3PvPREk4l4yzuo5WkkwePYrswx42RMyrnGcvhZZ7weBhFR/t5BZAoIPu4aRproC8xMC5gwGqFmxP3WgK5aR4NyCuJhbRIOMmSDv+/1ismaxonLg6dCb5Ernj4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app; spf=fail smtp.mailfrom=cohunt.app; dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b=RhGTz0Yx; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=cohunt.app
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b="RhGTz0Yx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cohunt.app;
	s=protonmail2; t=1770711896; x=1770971096;
	bh=JaoEVFCwEd4HXaq+2z5SaJdP0sEWBAPL/8mv4fSCrZA=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RhGTz0Yxwc1xiXdrZAewwL/bcL8AGaf+ndBd12S3avH2tzcjwzQLaYjVuvJS4OGLv
	 Y9C/0C1j2z5cuGd1jcg95eldiT5mIDYKFUwR++qhI8KBn7wdLmGGPRqqdYTffF8GZi
	 4MHXRkzavubAKwrn7Ie5bDizJXrsfQCShugAsCEHKq0Gysx9fnAwjB458y2VsJOb4+
	 i4Ao4OKYpiM8bTo9OqrcrtBLGZ1NJd27XxXyBwKpw48x/vduZfP1pfpSOki0s/i809
	 lQeyZUkN0iXam3RomAYMXu5hA8lm/2cZrmOJfKDFNqT+O9N6cpbPdSVwgnv59vo+UV
	 e0aOTlOv7M9VA==
X-Pm-Submission-Id: 4f9F3n6yCGz2Sd4c
From: Leif Skunberg <diamondback@cohunt.app>
To: hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leif Skunberg <diamondback@cohunt.app>
Subject: [PATCH] platform/x86: intel-hid: Enable 5-button array on ThinkPad X1 Fold 16 Gen 1
Date: Tue, 10 Feb 2026 09:24:48 +0100
Message-ID: <20260210082448.30335-1-diamondback@cohunt.app>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo ThinkPad X1 Fold 16 Gen 1 has physical volume up/down
buttons that are handled through the intel-hid 5-button array
interface. The firmware does not advertise 5-button array support via
HEBC, so the driver relies on a DMI allowlist to enable it.

Add the ThinkPad X1 Fold 16 Gen 1 to the button_array_table so the
volume buttons work out of the box.

Signed-off-by: Leif Skunberg <diamondback@cohunt.app>
---
 drivers/platform/x86/intel/hid.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 560cc0631..6f059740f 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -135,6 +135,13 @@ static const struct dmi_system_id button_array_table[] = {
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Tablet Gen 2"),
 		},
 	},
+	{
+		.ident = "Lenovo ThinkPad X1 Fold 16 Gen 1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Fold 16 Gen 1"),
+		},
+	},
 	{
 		.ident = "Microsoft Surface Go 3",
 		.matches = {
-- 
2.53.0

