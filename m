Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C5F23D7FF;
	Thu,  8 Jan 2026 16:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767890862; cv=none; b=T67S5OyWChz0mVMj3KxjT/K4daST6sJvFr8cNuMNwpu7sD/Zrn+gd88PuK6VLVQyMjApbEhdGq+uZrNa8dV1+qxrLzFQnYfBu2Fr69U0jDEhttzIjL0XKIzUqQRWsl1+48THtQ+/sCmswr9CmzqD3zOsnOZ2bJN635ge0ewyu/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767890862; c=relaxed/simple;
	bh=NlDRPeN9lKTc91Cq6thzLZzrL7qLI+Ik/ZrUvw3iG5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlcCSD1LPn5Lb3OzFBtrKC7Q0CSUjGciG0BfdkvSqxa5eMk7eqUzW187+zjbsACtraGJL0mS/MsWgKO7rLw0OYlK6LAjFowuyfXe61lF25UhWA35N/m4f9BdeckwjSvXWLeXx9CHG517EH6eDk9n2cMeKNHTyFgkuzZKgi4egeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pNOII8Nk; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pNOII8Nk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767890844; x=1768495644; i=w_armin@gmx.de;
	bh=sfmHSIJtyQQ1ACJsskxFlwQMmiW1tLlVcQfMuXPc3zk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pNOII8Nk1mLppFE+EZ1KxAxS1VTN6PHGHPFVeFlSAmwI/enpaC/I2jIW7j2TJH2f
	 t2aZWC4G6KXWTViQgTwHUU0rHFDyg1CR/YvL4U2toetsamgFgs6TXcBFwh/5Tlrt0
	 Hio4x+fzG4GbLIKoFs5XyCgXr0YVjLPh8gvXojyRUc2j28PXefFayHUxmus06IHIh
	 wL+27PW0B3BEzy2aEYByg5D+kS9IgWKPS9elvk1RZL+b3xNJ/YRAN/EmxpKdEbLBI
	 tKhG3ypunHRbYUFBXxdGn77FDIJuEAOLI6icSM3p3m9urjH3HoUafYztWxT9G9OE3
	 6BHzP+VTpJFfoMeMsw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from edr23265.dip.tu-dresden.de ([141.76.8.161]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N9dwj-1vyJlh1cpB-017DVi; Thu, 08 Jan 2026 17:47:24 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: pranaypawarofficial@gmail.com,
	jlee@suse.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: acer-wmi: Fix missing capability check
Date: Thu,  8 Jan 2026 17:45:27 +0100
Message-ID: <20260108164716.14376-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108164716.14376-1-W_Armin@gmx.de>
References: <20260108164716.14376-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UO5GHIyEShGvczNbTzAf1CjvGSri9GtXcbq8r/CbBwgPTHtOTXR
 6HljBTr+agVCP656k7/zPgbbDlpm12KX5HsgO7J7b8NLc6+MTAVh6k+j7sIcEltfdo1PgK3
 4lL//ZuFYvR0DdebA8p0e9IMwLGCk1FgVXlwEbB6XbTwjZG2vBTHUiIW9aSmO1gi68s/Amf
 Cokk24HV1ciYScjACDC8Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QUEnJsnrV3g=;UQefWwKMmbY3sXHG0WXi4xgwJRN
 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

During the rework of the fan behavior control code in commit
d8e8362b09d3 ("platform/x86: acer-wmi: Fix setting of fan behavior"),
acer_toggle_turbo() was changed to use WMID_gaming_set_fan_behavior()
instead of WMID_gaming_set_u64() when switching the fans to turbo
mode. The new function however does not check if the necessary
capability (ACER_CAP_TURBO_FAN) is actually enabled on a given
machine, causing the driver to potentially access unsupported
features.

Fix this by manually checking if ACER_CAP_TURBO_FAN is enabled
on a given machine before changing the fan mode.

Cc: stable@vger.kernel.org
Fixes: d8e8362b09d3 ("platform/x86: acer-wmi: Fix setting of fan behavior"=
)
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/acer-wmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-w=
mi.c
index 54ca3edf532a..e0eaaefb13d0 100644
=2D-- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2070,7 +2070,8 @@ static int acer_toggle_turbo(void)
 		WMID_gaming_set_u64(0x1, ACER_CAP_TURBO_LED);
=20
 		/* Set FAN mode to auto */
-		WMID_gaming_set_fan_mode(ACER_WMID_FAN_MODE_AUTO);
+		if (has_cap(ACER_CAP_TURBO_FAN))
+			WMID_gaming_set_fan_mode(ACER_WMID_FAN_MODE_AUTO);
=20
 		/* Set OC to normal */
 		if (has_cap(ACER_CAP_TURBO_OC)) {
@@ -2084,7 +2085,8 @@ static int acer_toggle_turbo(void)
 		WMID_gaming_set_u64(0x10001, ACER_CAP_TURBO_LED);
=20
 		/* Set FAN mode to turbo */
-		WMID_gaming_set_fan_mode(ACER_WMID_FAN_MODE_TURBO);
+		if (has_cap(ACER_CAP_TURBO_FAN))
+			WMID_gaming_set_fan_mode(ACER_WMID_FAN_MODE_TURBO);
=20
 		/* Set OC to turbo mode */
 		if (has_cap(ACER_CAP_TURBO_OC)) {
=2D-=20
2.52.0

