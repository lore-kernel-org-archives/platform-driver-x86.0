Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BB7231A3B
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Sep 2026 01:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790473238; cv=none; b=kZJpdKfsNBu71RhkCruH8uAPBwsEv4iGDz2JIStNBz9YTJ07+HgDaHgrzupOOApeUQPRtHXXJGuqFBzXZFdWdLugVJ2LWOFC6h7C9G+qm1vIP2U3XtY9UVUohDu/Jjl420wlfDcC9qWv1WqkQFHW4qEwxKW/TQ+B/IGxmdAJHVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790473238; c=relaxed/simple;
	bh=sn9KxYz/2BdaKnu+Jhkc59jJONIG3fW5WlAbi6N1UCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpEnEYTmWy/h4eLqXVGQxHOFS5u1S754BSqbmqXJ7/qDH3YTWotvOsymduq7BRcuGU6NOli5NWUrBKa1vYP0vF/8zoipI+PZgYl+P7umPD1QadVKLL0AY4WowlEptuNuVallLTJXXWHkWGcgdNCgC39swL7EXhwSwqlY+S+5PSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hh2HeTQt; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hh2HeTQt"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso1144427f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 18:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790473236; x=1791078036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VyCHyAe/qKsy76Ruxzse7e5Pw3SyDcowOYYvNkiQsc=;
        b=Hh2HeTQtaa+bvhEgRWPmvqd6vnVrl3mrdqHckSKllQFLtsswGcOcKg+8MKYzIjb1aA
         2+cn9z1MmGkJREudzeOCASS+xRiAnX3wDXyARo1NTGO4bnaAe1Bqtw6NzuUaHXDdAIGv
         4aN/R78wnR7/Mb1G/He/AoGsSEmcHKkY4lFWvDLotwVjWz2akgTqtlYS2w0ac/YRf8gx
         WfOabypBJHqrRwnAmodrd7Cq3oS42HwTB2kyQLIRhZvMRp798TwsxZzLqs9i4Vpqirqb
         6gTmA20aIeO1wU+16j/qzSZ7mo0b5i2YJ6ltABSIxzGUHzYILwhGC8oFJOhyJYulg60H
         Ri5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790473236; x=1791078036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VyCHyAe/qKsy76Ruxzse7e5Pw3SyDcowOYYvNkiQsc=;
        b=ab7wH0MOJ29cLHS9OKT5gkqtlFll32os5KZp4mebH6bakGnGjZxF5fgzjwYBO9OGV9
         bwrQJQgD2WKd4Cg7+NQ9J6Z9sdLufeB86zJUJsEmhJWN6810YavtuAH/niLepKMVCfoJ
         wJIcwUczP51mJA+SMyTR7+MYKxmwktudes+VoxZ7vO3UO9K+wuo+6HFauu9f8kfqOqJo
         wtqS0nFJ9jLO8vVRE19ya2uWMsEE7m0usx2wV0Wcnt7684QfKcbW4zAKZU2+nIbzITw+
         sQaVWGGFCl3NxEHypc4rSkNdT3nZqnukmSJw5y89sIJLqHDRt7Sfk31voqq8QyIvoDzB
         +CJg==
X-Gm-Message-State: AFuF++kmLqYqoC6dn3QJBq1bwBZnusXZOHBfwFwN16u3j+3yZhX123Uy
	EyRrJ3atkC53RI9f1Koyc8gkeyYIAb3+fH5+t6eCmg4Bjb5XpWDtk+ih
X-Gm-Gg: AYBFou2+b+QTD/PB7jqQ9oqVNDg/ymvP0VvKse9QBlgcywovU66EjZenW5Q45nHzd0c
	rTQmYeJf8Ahyyje1HAxPe5RMLEjm5ERMcKWeMI0v+fE61tT0dIb+7YJTGjBf60NMBsMJZMpYHh+
	fNDZGrEhNyoUeCB44U3nHzQtQDkMnZa4MQvVnjgifhKWJm9rR0qxEd6sp27MSI4ovTltd7PJVMC
	uqJLMlTsuQeSIcAH5YllNPmG1T7c3vK137xO/v0E+WEommrnAKk/EVtu+z0y7EyLaFthHN/RnFA
	bl2AWPupAPw8JBtwjUZya+GvMzu/zFqk830UaEQz4SP13mUc8KnUIEml+LCIadVfjo8ivp8s/vr
	C6d5CxeR3S1y3Mfy96bhXX6kGKssw31+4zUurtg2OkCoz/igc7I2m/UMo6id8vmUJ6Y6Jc7UPoL
	UiYvDOrSi5B2mhMJJG8CGib+ODKG1JyWsiVduuJhl2dfVIoLcfbctpbQ8TeiR3WnrOXpu7ghEhx
	D1X6dKkVMbAHNgBgYFucg==
X-Received: by 2002:a05:600c:4ec7:b0:49f:ff6b:bc82 with SMTP id 5b1f17b1804b1-49fff6bc143mr26410215e9.20.1790473235760;
        Sat, 26 Sep 2026 18:40:35 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee9203f0sm114736595e9.1.2026.09.26.18.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:40:35 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH v2 1/2] platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
Date: Sun, 27 Sep 2026 02:40:30 +0100
Message-ID: <20260927014031.3465252-2-amad3v@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927014031.3465252-1-amad3v@gmail.com>
References: <20260927014031.3465252-1-amad3v@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
but reports sys_vendor "PCSpecialist" and board name "X6FR57TY", so the
existing entry does not match it. Use the Stellaris 16 Gen7 AMD feature
set.

Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
---
Changes in v2:
- Use the existing Stellaris 16 Gen7 AMD feature set (charging profiles)
  instead of a separate descriptor with the percentage charge limit.

 drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index eeead0159..7d39e97fa 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -3268,6 +3268,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &tux_featureset_4_nvidia_descriptor,
 	},
+	{
+		.ident = "PCSpecialist Recoil 16 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PCSpecialist"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR57TY"),
+		},
+		.driver_data = &tux_featureset_4_nvidia_descriptor,
+	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
 		.matches = {
-- 
2.55.0

