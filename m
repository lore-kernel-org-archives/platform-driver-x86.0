Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6F4F6462
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958865; cv=none; b=a+Sgu+47LqRQiByhaFrrgjXalNI+uu9G1wSk9DLDyqEupgjwagj9ZFVgzQ/xfwlaUQMhIMSdBY08HN2CBos5prp3rVHzWQFO5hwTm+thudcp5IC0pIiqSOxCV8RzdfL+h9J+zjLrjJlOmzNpf5YQ2CaCDaF4HdnELQdYeoYuNMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958865; c=relaxed/simple;
	bh=m0Y2yxA83IjCU4lcgcTTOLdhjbOrgzsyfgNJo8uL7PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrXgCWRb++bwXzpDpZ98LEvTqQzHpA2CIfQXaOvgNJWp1prUERMXnQIrcyGIBnr+nMkO9g8ChJBg0QMG9Ix6n7Heitabpo8+8/GyyUZTgOBeZMe7gw4mUVgfcbBxvzhgom1Tn2rsWLq36XG1JiWPo4M38ZdAm3EHvJePgdI3rdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGX8KaUh; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGX8KaUh"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-888e95f3e96so1508110b3a.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958863; x=1791563663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkzL0mHS4r6KndnbWbOo2gH6IBD27/Wy36I0mOZpCSw=;
        b=jGX8KaUhJjXGcjA4SQLqZhVC37S4Lz5Y6Vf1CDWoD+YtHAapY28LOaPxIZASzuo9AK
         vMMWBvW+n+ktJwas9XsjeQWwYKxmZkVOddOqoZMSjr31kOVGEq0C9KdbI8j+FyOqRKP8
         y13+/7gZkbmRKMtqE9PrDxm1gdWY3uY1fgmPO+vuHV5SN9729EPWCWen6g7E3UQuGCrc
         w/kIr/nRPvt4qcKGkB64fdbli6m40C1ZShBCB1MZdK42+rutLh1tqopf1ALaoW8uEwVr
         nuqDIoS7gvazd/YAh3qahSUpVdQICdU7JdsBKPZcQ4HUEEsR9HxFT9fbY0Q6tWfNh8Hr
         Dx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958863; x=1791563663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkzL0mHS4r6KndnbWbOo2gH6IBD27/Wy36I0mOZpCSw=;
        b=aAP3pf3JiSjFxweUxM5sPJGJkBdnf8HD3z8Qf5iNkgpvGTMhb0yL9CLaTJAD+dBKLq
         P3TthDqZOguoBChAd+hjgkumxbFMfhMx3dXl/j11vCW3Tg0yw9wQK9GoMB/etJZUsstZ
         ND0Ka7Hd3vQi2n3JALcuYUfFqnjZdWBGbgcH5QzwSBM5HcluG05FQ0A40W/fIx+8wF+4
         MwzF7H7KKeitYBHxQzKLKwJ0HOJrQI6RquZFk/kWWZottwOI2fy30UIDIqFbAj4DI6T1
         OGnmjqJP/kiyyamOiua3TN94Ff2oqwfc48E4YT+CSuG6DwHQ8PUSspwwZgKp6FbBwyPI
         DlGA==
X-Gm-Message-State: AFuF++mL2jUU/ioqKGz6xGiYuIgiXD4HysQ0ZGjDm3a/gA+QZp/fco2t
	9hVxZA3IFqcHTbcK6fbqLCmgvURn9w74IMtKVaRUw/u5T3mgMXmTLYG54sEn8aM2
X-Gm-Gg: AYBFou23bdUfuaF2dtTumi+XEJxOw8s1EA8Nk+WuY5+3Wz1g16OmGYZvsDFvWmv+W1T
	Q7WtEhHKxC/gSb+/ZoWwsAiiaxGXKASjQDtJPCRThMSSoK5gPKIjVAo76Rhd43bBnRxM5qbzxY9
	hvCvMqSYaEDx7ryJwC5fRNrY50tu60vdXdWZbcpT5hkHSZU2YcYIBWJOMPae94mJN9BIoDmyJNK
	sKaTfP9GYn/aWfgboAkfraaKFdW+psVg52KyiP7uLjwizBnAtQZjrVvyXPask5yacE0a7RVcoxe
	g0nrqH3j8B3xb2qRJDQDTK4so1Y9ptXKxl+0mWQVxGF4hhWy+x7D6bV3E09+1J7ou128sBkkRil
	ZFoggt3/ZMiS8+9kF6YF40oYCw3Rvou/+uBme2HufQE0AoMZPAefUWB16XArUCv6Lpf7mthdcyb
	21d5JIr4hwmrbrApE5jzeaeMUMihzG9/cVeA6v0tNehqu9l+Csa/ZYjoR/z4iODmvFCJdD
X-Received: by 2002:a05:6a00:1787:b0:871:b1b0:e495 with SMTP id d2e1a72fcca58-88af54f744emr3544726b3a.15.1790958863419;
        Fri, 02 Oct 2026 09:34:23 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:22 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 8/9] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Fri,  2 Oct 2026 09:33:49 -0700
Message-ID: <20261002163350.1248431-9-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Assisted-by: LLM
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..15fe4d057 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.53.0

