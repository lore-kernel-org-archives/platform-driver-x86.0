Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C813A7F73
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 22:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811962; cv=none; b=ZDuFOPpCRniNuuBqcUFerxN+HEeDGH2lrj702nfDU+mxytqfF/3jMWPaaFjmwSKkXG9ZzlK2OCKcgXsvghJVe3tJv9UHlRrcc5Vtdw4RrnunoTJiX4EgG2VqDNhQkrG3FmE0q56FQxoBjlW7qhn9J1khDB8esEY6DeBkrh9dcTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811962; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuCQhEtnDJKDhRQ5W8JPCJ7W9A22a/HUZlTkxuO6QKQqhyVMLqZx6T5y155LW+373RvUsc3oMi2HDnuYOw/rFVXN89088H7ZdyAqwZ5nxtY8NZDhYxkcoDZ7RvyldKhA+4Mbd0xvsh2k4/PUGCYZFNkf5lMZ7FS2G/1p7NiyEh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbUvLWtU; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbUvLWtU"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c8ccc7755so3737806c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 15:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776811960; x=1777416760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=SbUvLWtUSO2m58+nCCX+zpd8ndtOXOWe8ks3LaMcZBaghswgkAyp0JZj7s1rtqGhfK
         Adeo43KiLaG+Z+ca1VM1my23j3YY3Sjs00BZXI4+jSKGAfgwYCCCXY5uS0kRyYVrsbAR
         U/bEi/dp3I8+ic2+SHP8imXNwdOdFQwJEC2of1QHZc/E+CpspROEYnuoNApJVeFGToEW
         H5HhrpJrXnACswTJVS4RdJjlaPzg5oy70pNzDO0vLDwTQVveNrPxN2Lz9mYqpWPo87b3
         NQtt2f/Et2qvrlTkAQ5BoveS/ENdn7l0TcdeAi75YnUFgG6LIGaDU3tyymyXd0ZzL1yT
         ePCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811960; x=1777416760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=tFNSVlk78tFQPGfA3U1bVljswhOA1BddzZx9Ap+jzrOm+2IgGOH1+BTPQ5AQMykJcM
         hqy1oOQ+6xbsjiWUVYrVJZIi3OsV6UwwqybjaCg50L0auyV88yairv9Z4HAPCp2Xtl6Q
         k57ToxFxpOpyHs897CQU1ba85OfdlkB1B2qtUPkTZgc9YjdHI6o3K3tYp6VngE3LSSQm
         n7Wh9Lnqn2LDohVj6BI5HOH6VYZy8NZnewS8HFGGOB0h9yg3pF2cpxILFpdNeqpbXjax
         01g/FAHSv0K7shp/qPwNrd32slAocRiTSsZx98X+VqUif0AfJtoJfhcF3dzFFnIfbVDZ
         3kHw==
X-Forwarded-Encrypted: i=1; AFNElJ/ep5f20F6D9VByLyA+7eoBt4Pk+uteaCs0ORwQqLGhRoGCRqQzj8LqYHAHmLbOBqhFhnx/ur5N1zS78enElZrS1m9y@vger.kernel.org
X-Gm-Message-State: AOJu0YyZUsxX4urHXzlX+cZFQK8ycvu9ZhDx3ZFMywj9Mx89CYIVrHXS
	L/JTFZPuhMZueW+MUjOwX5Q3MTCAoY8qcGgnSwsVPFAWXzDoj82/1k3R
X-Gm-Gg: AeBDiesONcwndQ2rYz9jz3XqoL/VySv0niY3L0p45BO2+3xtAnVNcUqZ1yOSCT+tdpZ
	jxeII9b8wpBCF031kBogNbFnyZIBg/FjjbpaH2AZcIPLJjaIf20tA0ea2BVkin9Y4qPh+nH8E4T
	1JdM0AX8jnJnsKFMNcjcMUBMAKbseMhVt6c0oKYVYyZXiRRg9xJVR7cm+rshbK2N9fEpBGDiONl
	Ua5LQz3m4XvxLqe99+wliY5NlqE5iWwJI5daJ3N/TkCgfavYgpwplGyUmvxwxrEp6u6rZqOPZkH
	R37OUCSCXnvn46eLeh1PJObYGoP6VjTxIGJ307AB5MTOykBmbcNnOPcwRcbRUk8WKxZchxJRMdv
	LhHhXCHbUX64b/odn3e/BDE/co10PtZ8HoQMxDKA+p0NSwgrTIZOMDTM16B64SfUIFbQghr7txM
	N3aYO/QToHEPZ0NFFnpeILJjIMHkibANn9
X-Received: by 2002:a05:7301:1f17:b0:2ea:b975:3db1 with SMTP id 5a478bee46e88-2eab9753fd9mr749690eec.23.1776811959862;
        Tue, 21 Apr 2026 15:52:39 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm26145884eec.8.2026.04.21.15.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:52:39 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v4 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Tue, 21 Apr 2026 15:52:16 -0700
Message-ID: <20260421225217.12472-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421225217.12472-1-tchatard@gmail.com>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
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

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33..f51749d0f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -63,6 +63,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.51.0

