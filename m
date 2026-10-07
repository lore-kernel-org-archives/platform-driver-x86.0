Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0709417D97;
	Wed,  7 Oct 2026 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360166; cv=none; b=ZTYGNFFq3WFzWBhWJHREtDHoAs+Kk9uqx/LAKBxBZW3KDoO/O06P1K5FilX8OS+mzG10WefijNU0tKda33RhmvstOgbxXDmxGI5PjhCYSRe2ymw/AdoK1ONDPWp5YN1eP+r/QI12dFIeSJG11hqlOsNoINu020hjtdH9O5foa1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360166; c=relaxed/simple;
	bh=0PIo045iiomZwU0ocejQCS6HJ8wz4VhvAqEhKhn4sog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peZOyZxzp5cMc7wzoMJOmJ+k3sYqh6EsA35GlxPhQGucwv7WyYMHq1yled3UAsNifyS3tyt0Wi2FsCzy2o4nb9s9IcpwelsnKb1acknS5XyGPspYOnJdgSrSfaPsHQCaCc/c1lBvV/eCmlGWgsY5Uev83EJq3olL5w/0GhEfbms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=HSwuu6dw; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="HSwuu6dw"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 596D22FC0091;
	Wed,  7 Oct 2026 10:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1791360138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3rILfxJa43MTsNKftIEMJyDm+VQEejfQML5dBzLVOgc=;
	b=HSwuu6dwnguao4gWFV5uboqQ5HDLO9e3bhrGaJSs9XTFkwp22JJBHsJxxV2kat0FXuP4Tp
	JS6J8ubmh9paBWpvUsDTjEtQ92IsuUeEX2d8cwu28RZVdd5L34iY+J3kcJuPofz1sfz/Hb
	Qn3VRw5CdlOY5GALiLYWb8lo++d+CiA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/6] platform/x86/tuxedo: Fix keyboard LED map ordering
Date: Wed,  7 Oct 2026 10:01:50 +0200
Message-ID: <20261007080202.81694-5-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007080202.81694-1-aer@tuxedocomputers.com>
References: <20261007080202.81694-1-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED mappings in sirius_16_[iso|ansii]_kbl_map did contain a
flipped line that caused LEDs to turn on in the wrong order when
counting up the Lamp ID.

Fixes: cfd84b3f419b ("platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices")
Cc: stable@vger.kernel.org
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
---
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
index 8f1ffca0430d..2b985b030197 100644
--- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
@@ -232,8 +232,8 @@ static const struct tux_kbl_map_entry_t sirius_16_ansii_kbl_map[] = {
 	{ 0x2e, { 246000,  67500, 5250 } },
 	{ 0x2a, { 269500,  67500, 5250 } },
 	{ 0x53, { 294500,  67500, 5250 } },
-	{ 0x55, { 311200,  67500, 5250 } },
-	{ 0x54, { 327900,  67500, 5250 } },
+	{ 0x54, { 311200,  67500, 5250 } },
+	{ 0x55, { 327900,  67500, 5250 } },
 	{ 0x56, { 344600,  67500, 5250 } },
 	{ 0x2b, {  31000,  85500, 5500 } },
 	{ 0x14, {  51500,  85500, 5500 } },
@@ -337,8 +337,8 @@ static const struct tux_kbl_map_entry_t sirius_16_iso_kbl_map[] = {
 	{ 0x2e, { 246000,  67500, 5250 } },
 	{ 0x2a, { 269500,  67500, 5250 } },
 	{ 0x53, { 294500,  67500, 5250 } },
-	{ 0x55, { 311200,  67500, 5250 } },
-	{ 0x54, { 327900,  67500, 5250 } },
+	{ 0x54, { 311200,  67500, 5250 } },
+	{ 0x55, { 327900,  67500, 5250 } },
 	{ 0x56, { 344600,  67500, 5250 } },
 	{ 0x2b, {  31000,  85500, 5500 } },
 	{ 0x14, {  51500,  85500, 5500 } },
-- 
2.43.0

