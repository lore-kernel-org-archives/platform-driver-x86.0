Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EB22D6E64;
	Wed, 23 Sep 2026 16:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181131; cv=pass; b=BiTbVVZP7Sbjk5rFlIOwgjKeKD7O99+qyhgCn7h8kXqS2wAkSwgAJNVWe9HxQQTaGj3MRqyGUN2B5ABfPnlPjcYouSFUc5mSqofBwLokWX6tFfaoX171LdMIkbHY4bis45F6f2vVG114Rb/lDGImMwvZPwb4hF81D91K6fpiPqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181131; c=relaxed/simple;
	bh=7x6cDF+Xord7yzm7rGJJDlUElrL8QR9rKweILD194d8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eEqb+EGN65CMsIZOqcXF8Zvk1VfRUVr5gBBccCOpayn5kp8QsekTGh33MTjM19k+SAmCyo3WPVyR+taUJ78oI/ikBGRpgXxWsW4t7S4c2OowlhbMdsoseo+E0AO/4zKoeTVy+DAEchTNkkn7jY3P1CfAG67gI5FtrHgPQPji+sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=fqutHMH9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="fqutHMH9"
ARC-Seal: i=1; a=rsa-sha256; t=1790181109; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FP41fuEwQc9IIfWXCIQn/pAw5R9HUoxugJNQrb5gC1fsRyl0/CtrTCqvTgAfO2OTrgYdW8jZ19/nrq2WeyNfPSZqaOkLCHdWpjc3Q0Rx4zU7/syWlJ+TVxM9IAjWMXuPbJT0Irgfdjc3TRcvBKBpBQ4juPn/k0lufIsZVQiNLFE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790181109; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=986ZG3NHXh2Pt6li61dBFsMEeDrEvFTCznj2iLWOQsA=; 
	b=WuwNSMMreIjcY3+EcuxaNqjAaVxkrr7lnERj3O501XBfDP9prRzuoC1K6UG+vfqnFgguJXb5PS1+6dDTUfc2o98BObpgux5jhldTQnOKImJj3bK/Gh6slY9HZ7VGzs62dYYZtXTIFUlfZjX0WHY5cjIV45FLL1ng22zdXSj/V70=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790181109;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=986ZG3NHXh2Pt6li61dBFsMEeDrEvFTCznj2iLWOQsA=;
	b=fqutHMH9tgxsIfxnm2IYYXMw/RzRqyJl3gz+WbPZgveF46AfjVM+tZyumU0mi0Vo
	vE4EciYtCwgFOsuxgJwg0dNAbphXQgDvcWpStfzDdczGZCFwCIipCM4jAlzUbTo2RrE
	hsi/KsU2xvh//H1Bkl1c6Zz83NCS1SRvjGEWgZLUgNSUvcrMPFTgS6bMn8p48+IU8M5
	pqisBP2Wz2ArXOWYSMImdAKWN5rMVh9dpS6XlTVjp1DmR+HNO0bqPKmFhGYPU9QU4FS
	jemmSO7KiYKGeVIcJJb2HILNrb+XjbSPI4f6onYUpXkZ2dcZm/VM/cMwEdb/LN2MpZG
	6s/hrAwSoQ==
Received: by smtp.zohomail.com with SMTPS id 1790181108290212.98926038722982;
	Wed, 23 Sep 2026 09:31:48 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 24 Sep 2026 00:31:27 +0800
Subject: [PATCH v3] platform/x86: ideapad-laptop: Report camera switch as
 SW_CAMERA_LENS_COVER
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-ideapad-laptop-camera-sw-v3-1-922ea6a9fff4@rong.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw6CQBBF0a2QGluJyCfoVgyDovshRRQ6XfhJC
 Hu3leEZ3LuSISqMLtlKES81naeE4pCRG2S6gdUnU1Pluau9JEKCeL5LWObATh6Iwvbmc9mgrKu
 iOx1BKQ8RvX7+62u7257dCLf8frRtXzpltQV8AAAA
X-Change-ID: 8511c6da-ideapad-laptop-camera-sw-948e4653b20e
To: Ike Panhc <ikepanhc@gmail.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Marco Giunta <marco_giunta@outlook.it>, Huang Wei <huangwei@kylinos.cn>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

On certain 2025 Lenovo laptops, such as the Yoga Pro 7 14ASP10 and Legion
Pro 7 16AFR10H, a switch on the side disables the camera. This is handled
by the firmware, which also sends event 0x0d (camera disabled) or 0x0c
(camera enabled) through the WMI event GUID handled with
ideapad_wmi_context_fn_keys. These events are currently reported as
KEY_UNKNOWN.

Other Lenovo laptops expose a similar camera switch through a separate WMI
GUID, which lenovo-wmi-camera reports as SW_CAMERA_LENS_COVER since
commit d98bf6a6ed61 ("platform/x86: lenovo-wmi-camera: Use
SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS"). That driver does not
bind on these laptops, so map the WMI events to SW_CAMERA_LENS_COVER as
well via sparse keymap KE_SW.

Unfortunately, there is no programmatic way to determine the current
state on the mentioned devices until the next relevant WMI key event.
Therefore, no switch event is emitted on probe or resume, intentionally
leaving the default (0, i.e., no covered) or the last state unchanged,
and let the first relevant WMI key event to correct it. This should
fulfill the requirement of using the switch events to show an OSD.
AFAIK, no userspace software queries its state via EVIOCGBIT(EV_SW).

The above behavior is basically the same as lenovo-wmi-camera, except
that SW_CAMERA_LENS_COVER is always exposed even on devices with no
camera switch. It's because, again, there is no programmatic way to
determine the switch's existence on the mentioned devices. Doing so
should be harmless as long as no switch event is emitted and eliminates
the need to dynamically register an additional input device at run time
like lenovo-wmi-camera does. Even if a userspace program does query the
switch's state via EVIOCGBIT(EV_SW), the returned state will always be 0
(not covered), which is the correct state on unsupported devices.

Co-developed-by: Marco Giunta <marco_giunta@outlook.it>
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
Tested-by: Marco Giunta <marco_giunta@outlook.it>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- Take over the patch from Marco Giunta as discussed in
  https://msgid.link/SN6PR19MB2303278926469783FA99824CFC842@SN6PR19MB2303.namprd19.prod.outlook.com
- Map the relevant WMI key events via the ideapad_keymap instead of
  creating a dedicated input device at run time
- Remove Reviewed-by: Huang Wei <huangwei@kylinos.cn> as the methodology
  has changed, please review again
- Link to v2: https://patch.msgid.link/SN6PR19MB2303E25270E1A460ABC76EA3FC852@SN6PR19MB2303.namprd19.prod.outlook.com

Changes in v2:
- Add lockdep_assert_held(&ideapad_shared_mutex) and a comment at the top
  of ideapad_camera_switch_report() to document and check that the WMI
  notify path is serialized through ideapad_shared_mutex (suggested by
  Huang Wei)
- Replace dev_warn() with dev_warn_once() in
  ideapad_camera_switch_report() so that a persistent registration failure
  does not log a warning on every toggle (suggested by Huang Wei)
- Link to v1: https://patch.msgid.link/SN6PR19MB23039910DD1918BEE3825BAFFC862@SN6PR19MB2303.namprd19.prod.outlook.com
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 8213524504ee..3e91cc1df6c2 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1365,6 +1365,18 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
 
+	/*
+	 * WMI switches
+	 *
+	 * Some devices come with physical switches. Whenever a switch is
+	 * toggled, an WMI event is emitted to inform the software about the
+	 * switch's latest state.
+	 */
+
+	/* Camera switch */
+	{ KE_SW,	0x0c | IDEAPAD_WMI_KEY, .sw = { SW_CAMERA_LENS_COVER, 0 } },
+	{ KE_SW,	0x0d | IDEAPAD_WMI_KEY, .sw = { SW_CAMERA_LENS_COVER, 1 } },
+
 	{ KE_END },
 };
 

---
base-commit: fe2ec83746e501645709761605c2464a44fd2929
change-id: 8511c6da-ideapad-laptop-camera-sw-948e4653b20e

Thanks,
Rong

