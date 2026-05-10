Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6475C2D0603
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387155; cv=none; b=grqOqICVpn9JPA05ywFG4B4f5P8ydvo5NES2GMcGkXg9D8O4aVv/BDB5heYgL1JWXGtb99KNBsYZ/VpsgVkMcGLp3gv4xb9kIg5jUhhry2F/mYVXdDp5Sfit9q0zyl5v1yqkBdM1RRAhOtcquYi9WOHyo6aQxRxyObpD9A+sVmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387155; c=relaxed/simple;
	bh=Tk/2aJhhC1s684/DYFLDntYmRO/aqAyYK0+/EXewrns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nneAnxfkj52dil5c/Utx5HTRUpKPZ4TWRDn6TCoaElgI8S292+2Oz0mS8ZfgFz55DCoJRV95CAmNgTu2buV6LQXMoQ+cNamfN3RIo55+4HviJMIqrEyjedIigEAiKuLlpxh498CNRcQQXmtx+FE58QgjyhJ93qkPHz+tXctiPQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4yqSHb5; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4yqSHb5"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1329507c387so4040288c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387154; x=1778991954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+i5mv8Vqi4F1/QxRhQ01iidaQ4oFBJaEVmCvLgpSXI=;
        b=F4yqSHb5Ndk+NeL4fWDRY4HOAtYUIex+1HQVhZWD0aT29e82OxWT1kZfVPLQlnwygG
         YqNhjI37mNkXdHWM/tjcQlA3Eppdz5+R5oif22VqjEnDfC64LNQmOVFdnclWJDRShHpO
         AdAWQQelW2+7qcXDkvs3KifSBpPDJfTL37RI9mfo9wnEY8itVRzmZcMmwipmaE7W622r
         mCvdG5ZPxtdzXe2r1923NluYeMi6d5DSikkBQ7YyaFjwLKZdRYzqGvlkpNrG2zKap17e
         xOMfq41S0uwfWhcl5U/0kzXwVhG/wwfoKoBs58uH5ycRIDS6DhgDnFWq/eTVUtHlPYOn
         8SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387154; x=1778991954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4+i5mv8Vqi4F1/QxRhQ01iidaQ4oFBJaEVmCvLgpSXI=;
        b=gGpqJ53/++6zlp60cmMaTti49zRD1RDW5FJ6pAP5UB5f1bJqDJ6hz0qKiqgjvygzfJ
         /CEaBhXZ/pImLwKGCvzzICTzUioR25IVHkvg9Le9OR94t+bixyykNMBXlWm2z7E7cxFB
         h2eCY2UXzx4x4x8sPxNJI8E+UB/9BLSv1uUm0YuliW0auSopk0hJ2p7RzAYPONEvo7RT
         08i7jOvHqfD2wwTJ1dkKM/1UUrRrzYBIDepCiCYSHMlSj+SCPuyj2ImXvbqJX4cyNjgJ
         ugH0utuCg+IU1LdpgtNL+8a1rA2clH/YwPNebSYeuCkxYa8LSBnlWmQaNUIplVtZccba
         YARQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pIH+venZGX9rsxADxjdrwbIQOat4nk0Dlj1dewZs5suJ6gC+0h8CSfEIDeYvueZvLiF5PhqMZnB5q2VXCLBavpJF0@vger.kernel.org
X-Gm-Message-State: AOJu0YybIMwYvkXpn/n5m1UAMxeIrBITMPVwJWtVDxuAo23qziinsPY3
	PfQdYkb+raQygT5AYXQuQILhBj9FbYFuQ+tIpLyPb9kAcmA4h1OdPctr
X-Gm-Gg: Acq92OFasW3h4iA3dgIZBzkypT2SAc3NXk8sog8Hp+w2Vm7bOdLRsD1MTHohFj4zJ25
	AqYworgcs1asBGqQvOVj6EpqULKSnhX2jFEW5wRn2QmK8rmvOb4S2wb9Raba05T3Adwib5h08DH
	dw0sXYHD8hT9sn/Gs+NEOw2XoAqphyX+K8kFahbIrIyQ5SCnHvls8HVx6zZjXiCtbcc5wtYcCHu
	816OlZXeb6N7q7RugvRiQrc1rIpfS1NLkA7HAImkmdWvT7IoL8ta0ZN468IREZJqHzXfqjgGW+8
	a8l8kMBdVN0jQ8nDl2zRvUm8fnmXysJiG6vsRA683+tn5YWGZFyakvw/EU6lhBnf9upLzVd3Tt7
	ktlwAeGLEkEhu9LoKD4ugB3EL0b880mrPDbuQ6v4Zhhp5nHr58O3UdJ5z/RmoP/NStSGkKXWZh4
	Zf01zydmcVr1F5/wf+59byBiaRXHknJ1lnyy3O9Vd64N41vfUxJr6Ffh0PVVbffi0S894zliieb
	pVF5R1EWiyPKiQ1k+86WvdSBg==
X-Received: by 2002:a05:7300:6ca8:b0:2f5:3641:f110 with SMTP id 5a478bee46e88-2f54d790853mr9736990eec.31.1778387153587;
        Sat, 09 May 2026 21:25:53 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:25:53 -0700 (PDT)
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
Subject: [PATCH v12 05/16] platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
Date: Sun, 10 May 2026 04:25:35 +0000
Message-ID: <20260510042546.436874-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
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

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: stable@vger.kernel.org
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12:
  - Drop fixes tag in formatting only patch.
---
 drivers/platform/x86/lenovo/wmi-other.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 1e06b894cfcc..50a03f5fd6ab 100644
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

