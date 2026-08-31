Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126844B5410
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192498; cv=none; b=rMVf4UDtISwey01DWH2L+AcKldD5o8B4MKpVIX5qbvN1l0dxxI9ReP6QKO7N5op+Au3xYzTwR3YfbjVreqfgHFJUau4CAOTs1HaZG9+1VSQRZrJrOTBMUgpcTGfQ7N7KJgl4YEsAZb0u2mnw9xW42p7JYz1WDisMyYGu0CciH40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192498; c=relaxed/simple;
	bh=kDEPBFj5pAGB5N+7jdeTU/cuSWAowl3r3wbiPhwoirc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mn8SrVW7qY8sAnyJ2azlWCMbLxkmIqjdnpJH/ESMnjwompNrjCIkNPq/v/R7Vf+KPklu2RW4hZTfVlC9myzujLKHmPd0jmThjaxj3qTLjrq1KGrsCv3WWT+TBy+IXT3KrDSWW1qcqLROpvtghHOYjGEBaFq7IhwYrlgtbMNB0sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3zVJV8C; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3zVJV8C"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4843f205a5bso462199f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192493; x=1788797293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=br+O6W1PXpNwwortFZ7nTNortOZR3mU+RseHa9TVJXM=;
        b=e3zVJV8CUbwa4HMF7Yk3KReX29LsOiCHoIjlTHuwV4KKaIlMIxpyE3vVbEyCIXLDAB
         9m8hXkjbeEc7902Q4IGiNNaT1bhc5dx8hwzN8hQhzgB0zYgWfl3VkX+ysMA0jGXBDFK1
         aGpWrHYPo5mqP6sUG0G0BPYc6juoYNH33NDV6RrDEJwhc/h3bqjEouyzxj/kgUk8ochq
         psf2hwlw2NDXZks7sRT4hDpTxA3J1Lijq46LIx8jXvaCvLNlZwtO78WHp/nnm4XKh1OO
         0VK0Kr0F6kh3O9UJNVqvtt/o7qbpEHkmk4D/lWhbPceJKhgrxNDpQQ/mrZ8RhKAB4zQn
         6Zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192493; x=1788797293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=br+O6W1PXpNwwortFZ7nTNortOZR3mU+RseHa9TVJXM=;
        b=QzlSsE01q+ontYnI7WkHQZUZTMJlGTOg2YpSQhHW5TNV0LagyI4AIsT73sKknNww9M
         UPPrLLbX+H8MTMCS5pG3lJ2WvHrNN6iiphJs8p69mF3mJB4yzZJ+ZSCzOOXw3w+gP90O
         JdbCYYeSJQPFOCEcNLtGd6jhjqoWMOMUP9JnsK8ficaqaX29Nuoqhur+NaaYgUg1LQqG
         BSNhH8lMTKTRgKNmquiLam27vEMyfMXY3eX+3ZOr+Z/3I5xTyfv57aTb8bzT+egd2cBL
         2WPZV6Nzv2HuRJH7EojqnmAjViCcoKMgoVEvaaVCcqF3XKjXViFI3Bh2z/+lVkmlp0Es
         uJGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUoO//w8xeiaY11Y7K/FuVtlkXmX9FUR2X7cXXIwGlZIVvIyFFjJyH9gE5ElF4qISfFW9Bcb5x/OzuZ2BahEcCiYkZ@vger.kernel.org
X-Gm-Message-State: AFuF++lh+qxq/Y//9Gpgaxu5W7/ctQttsPllJMqeTQ0712aKRIf8R7Co
	cnSDCJ3U2aWtfuJyxHPSBrUD+iPyIHiN0DJLg3OWWSBAhyNGsib7vl0d
X-Gm-Gg: AYBFou2Alzl7yLwiByWDbt3fjgcIKADebXWgAufbj0E4REr1E30ld5Duxm+DORS1j6u
	3Wp/fJ6yPxcWBE14uPFEqH0qXV1VUOvdyYJXskJt0U9KTKlgtJf2lkBCfqRf9lE8lf80Cisz256
	08uxCAvm8CX9iNj6tuaHF6D5BjQpddx860dvy5Yg7Bk6gOeFQWOCY418ZdVIM6hPxseubpwxT8f
	QmDqEodJicNBVTZx3IMAU1EwX//uV/voypVgCtf77e4JEP5kL8NkPfFo2r5sSEMjYtqN2KhYFHt
	5jzY0LOcPnwWKQ4ObQ+LbOWRoln+MxOwe743Nx5VmnS9KdBd3x/kOrCstk37Tt92KSYpfgu098d
	gh95RPwcJmX7ghkQsOxNiwr8zsdnHIp0cJDWlOqyFirTjyW8Fkq4uT8EBdd35CL+l466p0N2hf+
	8T78mIjG2UGw9biDGfuFdnoedQyaWAjg8CRJdxGIL7j6hBDqXTerOihq03
X-Received: by 2002:a05:6000:46ca:b0:482:e707:f5e8 with SMTP id ffacd0b85a97d-482f79b04d6mr32035532f8f.10.1788192492936;
        Mon, 31 Aug 2026 09:08:12 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:12 -0700 (PDT)
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
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v10 7/8] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Mon, 31 Aug 2026 18:07:53 +0200
Message-ID: <20260831160754.9857-8-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831160754.9857-1-tchatard@gmail.com>
References: <20260831160754.9857-1-tchatard@gmail.com>
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

Assisted-by: Claude Code:claude-opus-4-8
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

