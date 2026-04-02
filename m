Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44D235CB60
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100273; cv=none; b=CTPE/hjsCxeRTrnB5Lz4SgdYqvZgCWwqpd9dXwFXfba90qvFNfU7Yf/cNoeym/1+837xoj2NzLXr1GeaY+5cOn7UkGEQst4Ylv9HB6UqM8Mn4IAJKF9MyMbJdQZYslfhMP6ekYzNfFbyI6Htk2UT5nM2KmRByoBLIFavs9q1PA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100273; c=relaxed/simple;
	bh=rSDmCCEiDg6H2odhJiDoxieO0TKl6hml/thK1WrMGBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uylz9JJXUaBh8crzyHADaKcbDHZjZBnfltFKfrvZ9SAdoyD6xQdpDjM0JsVn7dTsRr5OTpTmllhdPhkQyGgv0bHlrVQzACpMrHmt+GitP9qTCCctx9o/ID9FsPxnA71Eanzp/uw7wwq1zIPnr6rOLy4iakf9qiepDlBFgdFB1Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIMwCmcF; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIMwCmcF"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b4520f6b32so598379eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100271; x=1775705071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN+fnLwvwAoWFMaejyWO9zQ/OWEWR+6r67Ac0CIVd7Y=;
        b=GIMwCmcFZVUn+ZFqa8Qkf+N8Ye8N01raD1qk5FSjyxB/u/QF2zfPP3wUrr9jJSEsd2
         mgdvL8vKFK/gJaYTjOYtIagfSXpfU0IVv2cmNhEql08H7bG71EcNTmJaVxtdoA7lA740
         e2eawrm4uOn+okigMn3UWbHzY7MlJCmHv0wN01jfGBCtgWkmF764TaFQb5NcadtMQa+Z
         NFrCPFr1mxy2BCAj8JpRWOyAsGv4SHWLsQCbfgtCrp6bQr9Pewju7IapnF2D+ayMoaVH
         +Tty2eBtuUpZq+9xwgrv+X3k+5lAXqMKopp1TZpsw2n0z0+sboTRO5M67q/Isxtq1YY0
         aEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100271; x=1775705071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VN+fnLwvwAoWFMaejyWO9zQ/OWEWR+6r67Ac0CIVd7Y=;
        b=E13f8Evdziq1/0a6QvtLXY1B9aDNY9AnChQpcRNbukgHWEH+ghKWI+lzvtVAy49AT/
         03roUJuXnPJYRA0gmXIjYS6wcde4lROX+jgMoplooj20x9eyOlR1yB+3of1I81SPqZx5
         a2BGXhqbY315YkePev/g/keKvnrh00KcXNqTfCMZeRQvnX4gip7vxIPOjd0Kn+BN8wm8
         f/yZ3ugUpQKJJxwluzIYAyxGDtvhiMLYGYolx0PRLFznAnxXfeA9A7dc4PC8TfxqpSPG
         mTJS3YRu3NA59I7ecpsmo9GIN9XBnGnXTFPsV0tlq5abJywcP8l1toy1+/95BSKVBk+Y
         nKdg==
X-Forwarded-Encrypted: i=1; AJvYcCU7jK+lDE1RIOMaH97Itvw4S0FpVAHP39BLwJeupOyfP5wmhqW4GWtJjWMTMMYwnbDv3wpLR0d+9TxdSVeTHgOCT2vd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84quVsM6OxBOewSSkw5kJvHqSx86JqXXG7LjeWafb0W2yLTN/
	nk/jcxdOeryMC6fAiRppR3YLdB0Xpsryqi+wz+1nHl81jgtviwj8McMe
X-Gm-Gg: ATEYQzzPrd/pVzO0JPpjAhqTPjVRXfdIyWVLeDiE9STz0TFZ8b/s0tK0b4jackehsjZ
	j7eIdLJD1BBTXI8zQaZP592VHAEdXkF8GqAbFhh3k6l/h+8H8X8pftT51YwaQk0SgFBaovW7TLq
	0Zcd7U5mY/mlmfYzvYhZQqRllVtxcik72upXh8Zie5PPWgF30qu/UFmFk/oNfZXVcBesJUYZ4zu
	tAw04fvoJrqxuVGerzlLRDv0YsZIgyk4Ff3s/rn3Kky7dZIkGFJLDuTHU39AXhWPGUJifmYZ1Ag
	ZkNBoNHhCMwcT/m4k3xzlI1B7qIWbeGI0uoTqD82QC0cIAn8xXXJaCpujTf73oN/xry+GVONRdH
	BA0seAO+in9Vdn6sJG3zqi0uhkh3p9uFus73X7XR6++s0wcHwXkymGWnpiugKUO1Zr+Ww4Y51Hz
	j9iHRtmKn0LM4wLaWhgxn16CPfAbVhPeV7Af1qtjSBHovn3yD6uBflGY365lP3smnyDQJ3+c446
	bkK
X-Received: by 2002:a05:7300:e613:b0:2c8:b5e1:6b03 with SMTP id 5a478bee46e88-2c932ea9d1bmr3195433eec.23.1775100270860;
        Wed, 01 Apr 2026 20:24:30 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:30 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v7 05/16] platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
Date: Thu,  2 Apr 2026 03:24:13 +0000
Message-ID: <20260402032424.678528-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402032424.678528-1-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In struct tunable_attr_01 the capdata pointer is unused and the size of
the id members is u32 when it should be u8. Fix these prior to adding
additional members.

No functional change intended.

Fixes: e1a5fe662b59 ("platform/x86: Add Lenovo Capability Data 01 WMI Driver")
Cc: stable@vger.kernel.org
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 985cb9859b44..0e8a69309ec4 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -546,11 +546,10 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
-	struct capdata01 *capdata;
 	struct device *dev;
-	u32 feature_id;
-	u32 device_id;
-	u32 type_id;
+	u8 feature_id;
+	u8 device_id;
+	u8 type_id;
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
-- 
2.53.0

