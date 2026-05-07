Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BDE4657F8
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 18:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177126; cv=none; b=Q8hHEvBd/+CwvaBsvfYQRHb8qjAJkfBmCdoziCU0byJpVzJL7uHH62+VlTdo79jTqNRduI0xvl6YnLxX/dkNcQsUzqDD9Noqjxca9vSkEM1UeLsHHbuc4US/+aHkNTwuEMVY9BNgZR7dhffumBIlB9oH3ooW6LhY9BdBs+/skpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177126; c=relaxed/simple;
	bh=Pw+ssuLutbx3g6u/jM5PMxxasbxx9jVlsAJtmVGQOkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJ31oiUrj3s6bYh9tIZUuM2iKgOBUauLydOy+YEWT8uYFTP+5n/ArwRdNWKwbeghgkQGFRgphEq7EUgXQTDyn2Z3byudry8RBiWSTK45JBDA7C7dKWnZS2eby5keh6XFlPni71atRD7mXCw6kEHNfLTqT2CNn/iJoyfEU7CzDds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7y5f7n1; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7y5f7n1"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f7ca62a3c4so566913eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 11:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177125; x=1778781925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtTcFBJ7InscTxETiiZ7Szcd4eyMEX33KwP3VapF0JQ=;
        b=P7y5f7n1h+pr4X/Iy60Gz4zGRAzIb5kycIhtxcsmZtLKy1U2Z3lrtlCA3x70FMe5em
         wfsAhlopLqLaeUFSWZ7lXq5JEYFlBwp7xweH0XB77cDq4CjhYokpW6TXRCqKE/q6PhSV
         myp3dGJDGcHuDvuXDOhxJNT5Q6rIEMZcgTw2dKlgrcD6/cJ3x3kKOqEQjd5BTDQtgnv2
         D2lyxqRDSc15QPMf5rjFxFxeshNLHt+0WQ9+GgdBmzW6j/x6DXO/Ojv17QPaOVg/JKsW
         b5d5+NSKQmVWX3RaWoROXB26ahqzhr2+JCdDuTTHpJBEgnNYKL0Wl64Fa7TZzSujBEF6
         fmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177125; x=1778781925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VtTcFBJ7InscTxETiiZ7Szcd4eyMEX33KwP3VapF0JQ=;
        b=IGiGUHYGWx7vs0v2omx703lwiNRA25hU3aQWd3cgkPJbgu6g1r48bavg40mskZTG3D
         y9bkVFO8gYKhm/d1tODDQHiumsEkU+ycK/SpKrET5deUQsxxFQxkQxx1QbBUXZTjhb/i
         sa1+kzIBvgBntsIfwiuXEXDgGzd2mV/m+vJka8JUw2umft1FEk2n4hx+BZLiGgDPQqaG
         V1TcAt4P+MtCZAITk2iabNfzKsk9t+LdwpZXqIci2JoXRGEdr3yiQImH5gbU/5T4zHUY
         kbhF/xWY6DU7Kw9XBJIL/BzA0BRjT625CW0I1IVveyaNyu5QAaZO29Z6R0O0XBNBzwdR
         Kmrg==
X-Forwarded-Encrypted: i=1; AFNElJ9Wmn8+by2m9IZ8IJw48LEv2jdlTaBqVvNBViv1CDJ07098SbU3IlAlRKPC/YIWsbQijoVBK/eG7XGlq/RPZsVBq+3g@vger.kernel.org
X-Gm-Message-State: AOJu0YyibPJHdzArFyj46LUu0WTbG1Iyf0oSFzz/Fl5+L2Myroq3QbrC
	uJ4NLCDSEbxOpjv/NVte7QNIDmxzfGpFDRMscwV/8i8Htefd6YsB/Wqe
X-Gm-Gg: Acq92OEUnYm8W7ELPN8bUFC5g1VNcfJYapO0/rcHkBXa04VMKbOk283Sv95nRRgP+Z1
	Cb1Ku22jFsWb4NlZgmUPYja7sWNIEGhanxMnhiP6Cg5+eN6WL3fUkdiLkOS0rL8oH3yLGcorJJz
	BfvZXFWsRHAYflGpp5Jl7ux7xc5z97GCvBFAahuBxvMKpTXFjlVt1Vk0YBiA7RdkN5Kd1Jaoyit
	40d5oUIvkDUE1uDLkH7tUsLRKkKsg9J2FSFyou6xgUQmxbyMk/UKJpkAGRt40KPPmb+ZXqek8BL
	50M+CIEI9kFmx8Nj0Xgd9yRwV53nBW1kiljeENku3qQAH9dVuAJ8TXGSpcaPKPk4YxmN1eMLdd+
	W+s8T6afkKS4V3IkZjtxnofp7+5lJ21Q7vZ8r1/gbZbrZBoDnBnJk8tJqTjospa+92bX8EXmmH/
	2ZFDK/Zye0uZu9Lt541lsrkbwB68s+YpFXfi9LWh09KTbqnLbNJrMsw8ScutLKuK/hPtfHVUlAY
	F0ksaODx9yfDso=
X-Received: by 2002:a05:7300:e82b:b0:2ca:7eb4:3e0f with SMTP id 5a478bee46e88-2f54b897f52mr4549823eec.5.1778177124530;
        Thu, 07 May 2026 11:05:24 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82bd73a64sm44332eec.12.2026.05.07.11.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:05:24 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v11 04/15] platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
Date: Thu,  7 May 2026 18:04:56 +0000
Message-ID: <20260507180507.912966-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507180507.912966-1-derekjohn.clark@gmail.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds explicit initialization of wmi_method_args_32 declarations with
zero values to prevent uninitialized data from being sent to the device
BIOS when passed.

No functional change intended.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Fixes: 22024ac5366f ("platform/x86: Add Lenovo Gamezone WMI Driver")
Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
Reported-by: Rong Zhang <i@rong.moe>
Closes: https://lore.kernel.org/platform-driver-x86/95c7e7b539dd0af41189c754fcd35cec5b6fe182.camel@rong.moe/
Cc: stable@vger.kernel.org
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v7:
  - Include lwmi_gz_profile_set() fix as well.
---
 drivers/platform/x86/lenovo/wmi-gamezone.c | 2 +-
 drivers/platform/x86/lenovo/wmi-other.c    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index 381836d29a96..ca559e6c031d 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -203,7 +203,7 @@ static int lwmi_gz_profile_set(struct device *dev,
 			       enum platform_profile_option profile)
 {
 	struct lwmi_gz_priv *priv = dev_get_drvdata(dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
 	int ret;
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index a6be3463341c..1e06b894cfcc 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -166,7 +166,7 @@ MODULE_PARM_DESC(relax_fan_constraint,
  */
 static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
 {
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	u32 method_id, retval;
 	int err;
 
@@ -773,7 +773,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 					struct tunable_attr_01 *tunable_attr)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	struct capdata01 capdata;
 	enum thermal_mode mode;
 	u32 attribute_id;
@@ -836,7 +836,7 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 				       struct tunable_attr_01 *tunable_attr)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
 	u32 attribute_id;
 	int retval;
-- 
2.53.0

