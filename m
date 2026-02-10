Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2D3375AA;
	Tue, 10 Feb 2026 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713804; cv=none; b=nxBzf6QbzcHQYqHoP55wPE6/4raW6jc//sZyBKhMNmTvxFlelMtyLul/Nyb+fT1KKWjl0Zu7kikolCMAK2FrGHobbOkNQWhpf6MesckJs1gEEuJjdBb54cSVnXr5afbdIeV/hIOKvasMkYbuGv3d8u82uGceTGKFQo6ONSnMp/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713804; c=relaxed/simple;
	bh=ivJ5+UsFGsqT0C/3r/DKn+KMqeA79eDBfsZLUJBfcgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcdHlWoBFx83l1CM+vQx407lTqa8LoHP67tzssfFTATMPAA4BgwVWwc879BnEC2rsNjtHH0PNqmhKbjrFrlQucFP3VAc324SCc//CiUpuJTI35VRShosPpopzdI3wEIvDpwp11KgEqEpfk/D0EZGyR4t69d4y42DHgYZqNEoDms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app; spf=fail smtp.mailfrom=cohunt.app; dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b=tt6J24h6; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=cohunt.app
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b="tt6J24h6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cohunt.app;
	s=protonmail2; t=1770713792; x=1770972992;
	bh=JaoEVFCwEd4HXaq+2z5SaJdP0sEWBAPL/8mv4fSCrZA=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=tt6J24h6Ml/ig9FMJ/fTbfFYgoDa93ERfJZTbb65mMgUFCQj2hWfOmuMRHxxCZM39
	 A/VZ1r9xcSR6QgUayya0CgRWvCOJhY/Y2E+KF2C9G0+0BqEFFgl9amg75N+6G1EdNH
	 usukLuveP9YKocXawwf43l/HNfSyhBN21rZBvHxRzXe4jQE2ctYfl6seDYNKUMjSUj
	 dy0XQbWgAlccrDbeQTKhmJq2wSvC9HUtsVbKCP4/notBihxCzZ/hsWp8arGH7kROZd
	 sIrE5U/bvwXgvIzh25HUNR+r9HMW2lqg8ywKrSc613OmT3QymfKT2R9CoehzW9bd9Q
	 BdA/8J/GU7kBg==
X-Pm-Submission-Id: 4f9FmC0P3zz2Sd4d
From: Leif Skunberg <diamondback@cohunt.app>
To: alexhung@gmail.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leif Skunberg <diamondback@cohunt.app>
Subject: [PATCH] platform/x86: intel-hid: Enable 5-button array on ThinkPad X1 Fold 16 Gen 1
Date: Tue, 10 Feb 2026 09:56:25 +0100
Message-ID: <20260210085625.34380-1-diamondback@cohunt.app>
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

