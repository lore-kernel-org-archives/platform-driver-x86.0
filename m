Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3C630F931
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 23:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771023817; cv=none; b=HBe1h8OGWqS+vS9mRL7qLA41gaYlHKqDKuVk4PJ3X3mZfTAS0URLJOn2HGoMzgMDbvju1IPM0Ok9JER+cs8iGixmHfPEGpEw25pewHLS4aFngZ+BDjyMHNkP6vMj04xdc/Eo0PIH/2jVikf1Wi710JLjjJp1ObGKz0hGGgt7FAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771023817; c=relaxed/simple;
	bh=79jOn7zuIWKZbCnOjJ8/5EJ6nEOSGdC/ic23Voq/Gqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJYynK1D/hlN3Js7PYJ1UR5szB/rn3JqfdnGVW6IvPn7O4BDa6MIWY0B6T21l5kUq/SKuIREZwyOVF+Ynx66uNekMSZ7G5cMRMzS2d5GTgckJjaiLomZkRWBWR7ZlKl47e0Vmd35c5w2ODhkH23YQl1lhJmF9EGvth+IHSyiowM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unarin.com; spf=pass smtp.mailfrom=unarin.com; dkim=pass (2048-bit key) header.d=unarin-com.20230601.gappssmtp.com header.i=@unarin-com.20230601.gappssmtp.com header.b=PiAhQEJR; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unarin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unarin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unarin-com.20230601.gappssmtp.com header.i=@unarin-com.20230601.gappssmtp.com header.b="PiAhQEJR"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-895498f3819so2149246d6.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 15:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unarin-com.20230601.gappssmtp.com; s=20230601; t=1771023815; x=1771628615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klgM8kzrDwzRwxI4/IcSZIgUAjPmyxVzgNBSPEvMCXg=;
        b=PiAhQEJR7WgHhAHgh0/yPYqe0bnd8vbQb2XzEbXcPvY7AkbsejtKRYKvgyI1NFs089
         Kfqx/jappRxvX0ia5s7Bq3+lA/rrNarumoRiON2NMtVgdU8MJJ/Cukkm7T+7mb7i5Eik
         n+C06TxKB/yxvbdwZ9Tq7YiGYiCyjSyfEWJzBLjUdN0AMk20U+RZttEirkMC0eKhrNs+
         yWHdL6Exif30UPXOJpFZSH5lDcqTC7L0yfCMLjVysnYm/h16yz9EM5eBgatlZP86n6LW
         RLghsoh5eBW8McHN5NE1YC8MtmMFbGxyw2Wf1ZgvWc/P9eTtsfAghMI+BVcqaHVuVnje
         Xh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771023815; x=1771628615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=klgM8kzrDwzRwxI4/IcSZIgUAjPmyxVzgNBSPEvMCXg=;
        b=IuyJw3AXyA+PTqD4uoVbZfWocc51c+PUCqACGTvTPFxNyBnAukv5+Y5qTmU3kUPyAg
         OmQ95w8lHC7D8F1GFxOJGiQ6J3uzvLAkGIbCjO01vFX0dmaQ4Ck1OHnC953/baJDWAPt
         xfO93RNvXeIEOGEI96+Dvr3vRqqE9CoyJqB3Xh1og0OYU/Ppx0J9t1a2pskDLkFmoafb
         Bsbr3mlXo6OzTIQW+aymqBvmsDSNfoDZBctgzSENfD/FBhYdIopFVbBAbDgmHdAPVgA3
         Vv9JIZBmL/IYPEdkwXuAepAVgel1/GqxmF4HlO1e++AZhI2FIA6qgapaS1gUw361JKQe
         1tMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR0zBgWgBNW+ItPhyPmxFM38Gmt9pfaMylNeemo6hVqqXZrS55u2Hg3pFXQXGf49SRSFmJmfyddZ0eFwmvVl+Snhjk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw59HZiaRowdGAT6pIdrnoNeIcuGR2uXPW9WKM+twE4Vzgn5eev
	yUI1L7VxD1CYO3eJiCfmcepM0WP2TtAaDyotpJj1DrmnJH5povdctQl/n3YemzgrYGQ=
X-Gm-Gg: AZuq6aJkU3TxUubaL1dbMNzAgm0ZcvGt5hTrY1JmVaC2h+hhWC6xofV+awDuccjkONi
	EK+8xHOrK6aQfm6EfieZPAIXeR9PFZOcnLsAQkHi+a8O/x9ZkpQMizT9BnbBWAhe2qNpE1LKPhZ
	BbYvqa+lmyLFIBjqCfne4uuGHY37P15auB/QQX1DA+C7F8Dt/SwxPONk9kQlAQoHZdL2imFGpDI
	YCH1WpQarhtjpLALQZ7RX+LYeN/dTz2f7YcToz8E4Bz25HKW7RDtz41TmjtysyObMIebkZmRvg6
	D1oL7rF2VgyqkKjkl1TDVs9bmMCs0NtOXkBVTKtrnLI7O6RycILINZ1sS7NwMpmEFJVF5HVEU/a
	2C0AWgDSntfIuUsV2/VvZmjdgN5qeI+OwCuA//R0/768BT8OTeJrq/6nyMEqwBTMb/VM0JwwX4w
	oiP4FxxLKGDd/dzJph9wWnJaJWPrAYBAwPZIl+PedgiO/9udWs1BKsfA==
X-Received: by 2002:a05:620a:4415:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cb40876003mr417363385a.5.1771023814652;
        Fri, 13 Feb 2026 15:03:34 -0800 (PST)
Received: from samu (c-73-141-215-85.hsd1.pa.comcast.net. [73.141.215.85])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bda6fsm705921685a.9.2026.02.13.15.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 15:03:34 -0800 (PST)
From: Peter Metz <peter.metz@unarin.com>
To: hansg@kernel.org
Cc: alexhung@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	23edip@gmail.com
Subject: [PATCH 2/2] platform/x86: intel-hid: Add Dell 16 Plus 2-in-1 to dmi_vgbs_allow_list
Date: Fri, 13 Feb 2026 17:58:02 -0500
Message-ID: <20260213230310.299974-1-peter.metz@unarin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <21babe2b-89ed-419c-ac08-e9130ba576b4@kernel.org>
References: <21babe2b-89ed-419c-ac08-e9130ba576b4@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell 16 Plus 2-in-1 (model DB06250) requires the VGBS allow list
entry to correctly enable the tablet mode switch. Without this, the
chassis state is not reported, and the hinge rotation only emits
unknown scancodes.

Link: https://lore.kernel.org/platform-driver-x86/CAP3yi-BWm0LqkhfzTrGy5n-KQ=3+T8eRMoR+Z+7Ke2VJB43kTA@mail.gmail.com/
Signed-off-by: Peter Metz <peter.metz@unarin.com>
---
Hi Hans,

Thanks for the review! I'd be happy to help out with more fixes.
Here is the follow-up patch for the Dell 16 Plus (DB06250)
to address that report.

Cheers,
Peter

 drivers/platform/x86/intel/hid.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 60ce32f591ff..a8ae2dba7ffd 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -195,6 +195,12 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14 Plus 2-in-1 DB04250"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 16 Plus 2-in-1 DB06250"),
+		},
+	},
 	{ }
 };
 
-- 
Cheers,
Peter Metz

