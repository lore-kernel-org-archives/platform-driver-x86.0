Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC0943B4B8
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844157; cv=none; b=hYWul+lwEKiEdM+Y2un7wh5jNAiau+Rf/teLCe/1YMNTf5vWfZpGX+fpMBtOJRSklVBlvr6F4qWkFBLoJEpY3ps/Pxsqgxw+hmhUd33rWYjar9M3T1opfjz3+6elyPLOWVm3bTC4kXCVlDiZxpUj9VAgYcB2p6//EgMkRd79KCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844157; c=relaxed/simple;
	bh=yXX9sw6BwVcjhFNvqe2Dgpc6v4uC7YguM0b1qU39ng0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bP59m22w+N90dWO5YzXAqHpJQDtnp/u/dVdEFolu0lNUBwi0SVCs3M/xa6cSde21Mv99Vj2gPLKxyzeb3c5JPwlKi7QmmNT0bK6g7tFXuLf/fmUdxhpoBPT4FiNoDEWSZZugrGYjPTXVS+lzsapWZBqE+fS38Zgpxlv4YiYd7aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLITOOpz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLITOOpz"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e58034d05so63287a91.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787844155; x=1788448955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yE7H5T0qY9MPYjfzcvpqEX6uXmQI6Ezkf1TYa2yy6w8=;
        b=GLITOOpzZ8RpnTpy7mWf2AEBYhPLjGy+U32ObXLF9ANy92dGURQPhlgD9n/OfI2sxr
         PZRwutMKsULW3gOOjTeqz0c0738EEtdle7lgjzZsa9ti8EsdXfIdj/dRE5USIh91qBe5
         b02fweyq6uZ566e1X7S8x1xMSV8mpwdDfIsX8visapMlp2OUGuxZ+W4nDjdTOLttEMp+
         oOLh8hVMk1q1FxV1vTduYSbNv9vRu+eHM3//Dz7kihdlA9wxwb6j1UHFy32NqD8vQ3hh
         nkVVZY67ZTqfHC9qKVBAqy4L3jc4G7LFYDYdQ7vw3Uy1qEQTMjFcW4Cfab8+PRqvtFuR
         oVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844155; x=1788448955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yE7H5T0qY9MPYjfzcvpqEX6uXmQI6Ezkf1TYa2yy6w8=;
        b=KITbBwKh3PrffPpa9zQ47+yQed+HZrBLXr31V/IEJIusG1T155Z+klidCAWg13cT4F
         I2PCy9iJWzFRbYeucylOUHn56U+DzzvVZCnla+FF2igxiVyOmLn2jRimm/opFZOf+3wy
         wwW5kNiWrmrnGCY6F3oUKJgcGk+ZJi0xx3edUSr2ji6yksigTcjkFB5734uFCDWR+tLZ
         ErJvo4jI/B9ttKz4MoTLqlzv5lKSozg2lLpUAtR3DJmFUPbQAnbcFwfnyCA+Rg2YIf9N
         2vzNcjcTb6YBAd/c7KQ2wsdQWwfIT7rrjGSB9ey9feCk3UiYi3ZwUjTGYJjfXqbM2Pld
         CToA==
X-Gm-Message-State: AFuF++mmMa+VpcAmSUSc2BbDHciwnCOO+MYnhNPh8muzfVZmP900Y4OA
	gnAgfPLjeVqMCiCq98hDqOFv5cywa0IopJw0p/jVcke27qh05F0PXgsk
X-Gm-Gg: AR+sD135I/aIzAZ3Gp3KYkGvNwhjzmPRWBbvNabJeeWNm6F4yMqwCUndaLJbLecJsoK
	yi2vmYqVXGyjtuPVSzC/AribNxqEuJUbhzBwfHtUTX2OtE6pv6ZQ8ru80+IpCnissBQURU97rf0
	qH404ISxrS4RK9o4gFUWLz6NjLcPIGZJX05WfBYl/hJrTHHx5+cr3qI/t+QLy7nofXBxCur2JVc
	TgUIsUjm0WFC+faHlrTl4dzy8uNn1uKgJlf8H3M+O8i3j8BEtAChRi3nw4XADE4IKttgM023b4o
	upcikMmmvX6H43394fPZtEzWmIREeS8lSjerUSXVPB8BkWZM2VT/XNWWhzorcHmtjsPdhmYsh7m
	EY7TsocZf7ug0cmPA5T2LWduASMSCz3uHD+9DQ/4G1981cqq8/xF1gj0avHiboQCXKF5x4GrWMq
	mNaml62avQK1tsf5Ob1ieTROPw7/s+qb2Ay8aY7j2h4fMMBR/wnyWZjPFm56khrFW7QDgufVbYu
	nU+pOruqRBQ80yHanmfJUuq
X-Received: by 2002:a17:90b:4b04:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3966d5f900dmr31667447a91.8.1787844155377;
        Thu, 27 Aug 2026 08:22:35 -0700 (PDT)
Received: from archlinux ([2409:40d5:415:fb30:8fb3:a7e9:62b3:e2c9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9035ff1sm16449505c88.11.2026.08.27.08.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:22:34 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN board 8D40 thermal profile support
Date: Thu, 27 Aug 2026 20:52:26 +0530
Message-ID: <20260827152226.35186-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN Slim 16t-an000 (board ID: 8D40) uses the existing
OMEN v1 WMI interface but does not use the standard EC thermal
profile parameters.

Furthermore, it is the closest sibling of board 8D41 and 8D42,
which are already included in the table with
omen_v1_no_ec_board_params.

Add the DMI board name to hp_wmi_feature_boards[] and map it to
omen_v1_no_ec_board_params.

This enables the existing board-specific handling for 8D40,
including platform profile and fan control support.

Link: https://github.com/CachyOS/kernel-patches/issues/157

(Tested-by tag not included due to invalid email address.)

Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 6ecc033e5af3..fba6d202672a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -323,6 +323,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D26") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D40") },
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
 		.driver_data = (void *)&omen_v1_no_ec_board_params,
-- 
2.55.0

