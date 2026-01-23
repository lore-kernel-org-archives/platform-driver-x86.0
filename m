Received: from mail.glitchdev.me (mail.glitchdev.me [212.132.95.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0448821ABC1;
	Fri, 23 Jan 2026 22:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.132.95.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769209123; cv=none; b=fkeeZ+FO6tv/LLvfU0ikTytERDX2P6gukUzhWRoMcI4b0bYUb2ghZBG6lT4hKS89IwvW3ZJArwTahyhu5J1zVi4+5Wj0GmNvg0DM5UmMIVouOOaOz4ZUlkx96yRI3fma1GiWZfDqZLvTnbN0gUh2H070qzzrJwF807v74uwNjG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769209123; c=relaxed/simple;
	bh=alowgym55LG6CmPa/pYIgWNjuCxOTmuDO8BXoiAB59E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jqwQn3B5dPZ2kAOFGEf+7hbPq14qra85Qeif1lFe/0UxtsvmmizruCnwNsNRk/AsTkkja1RYeQOAyEuEuE3XkEQD8xygGw+qj9hGXBQYPrLBYyp7UuEoHUOyy0KgNZrZ0eRo/NcBpnJ2WnYv3VyaHt5Htohq2ONZhv19LQbcqeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=glitchdev.me; spf=pass smtp.mailfrom=glitchdev.me; dkim=pass (2048-bit key) header.d=glitchdev.me header.i=@glitchdev.me header.b=f2LZoRvA; dkim=permerror (0-bit key) header.d=glitchdev.me header.i=@glitchdev.me header.b=+aGnd4q7; arc=none smtp.client-ip=212.132.95.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=glitchdev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glitchdev.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=glitchdev.me header.i=@glitchdev.me header.b="f2LZoRvA";
	dkim=permerror (0-bit key) header.d=glitchdev.me header.i=@glitchdev.me header.b="+aGnd4q7"
DKIM-Signature: v=1; a=rsa-sha256; s=202601r; d=glitchdev.me; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1769208974; bh=xWpVnB2BnBzCVfEH3FHnw0T
	QtUUD3fbsQaDuH02zNlo=; b=f2LZoRvAQOd5ohttoKAsNa+P7dkBE2pWkeVirSqynnt3ZWkZW6
	ocJOWQ1UYt66eyRUc0F/sGYWt19WLDJJFmhu9XXl5qZlIhS0VMn1hbQ90hYrnE9bt8qqpSPN4Cm
	mem4IQwJD0md+e6ZTMrdd78XC6n6mtQFprsnCD5TFnLoAekGVwpMCfQGJHZ+d3Taz+Xah9roaVp
	Yvw0PU4nPqNQsQTx3SwNwFOsR13pF2QwPwRuSk2u6vteqDsOV7ASb1/45ZFQMv/wsvPWsDjpczO
	iUiJGVX0HGSqP5l4zqKdEHUowwCkZjQSR6m211SO1rTw1lL1T0lxxV6HpwGFhGq//Eg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202601e; d=glitchdev.me; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1769208974; bh=xWpVnB2BnBzCVfEH3FHnw0T
	QtUUD3fbsQaDuH02zNlo=; b=+aGnd4q7YaQapT8coN+2a5/IOsBZfQ+uoPeej2KrN/vvYP2flY
	HZAuQzVVJopLBhOf9HHuGeemR2JIa1gB9QDA==;
From: Jonas Ringeis <private@glitchdev.me>
To: Matan Ziv-Av <matan@svgalib.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonas Ringeis <private@glitchdev.me>
Subject: [PATCH] platform/x86: lg-laptop: Recognize 2022-2025 models
Date: Fri, 23 Jan 2026 23:54:23 +0100
Message-ID: <20260123225503.493467-1-private@glitchdev.me>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lg-laptop driver uses the DMI to identify the product year.
Currently, the driver recognizes all models released after 2022
incorrectly as 2022.

Update logic to handle model identifiers for years 2022-2025.

Link: https://en.wikipedia.org/w/index.php?title=LG_Gram&oldid=1327931565#Comparison_of_Gram_models
Signed-off-by: Jonas Ringeis <private@glitchdev.me>
---
 drivers/platform/x86/lg-laptop.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index f92e89c75db9..61ef7a218a80 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -838,8 +838,17 @@ static int acpi_add(struct acpi_device *device)
 				case 'P':
 					year = 2021;
 					break;
-				default:
+				case 'Q':
 					year = 2022;
+					break;
+				case 'R':
+					year = 2023;
+					break;
+				case 'S':
+					year = 2024;
+					break;
+				default:
+					year = 2025;
 				}
 			break;
 		default:
-- 
2.43.0

