Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871BD521203
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866083; cv=none; b=gH3XKhLdfmXxqQKCnkTieY6P/1Fkw5eJ5Z21BcUIA0Y8pG6HBicT2zHuCrTwwZ4jKxZghdBt1HzY5NhCeAg7er+knSYJPaN/mCcMJD32JExNkDK8a8mPlICIgCeOGx5nmr4Ogn9rTP0/Z77qFC0ng2uAOjK1ji2GGvr2FOCTVec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866083; c=relaxed/simple;
	bh=rK0uz/KSkFjE1x+MXlOe6fim8a3tw/1d0l+5isYZhlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MS9tO7Au8GztKaGB4B75glbhvqagDeMNemKn5NjZE1UK/koAokCJ0p8GrOnJEwdDXq/4uhDPJj4qLG8/aV6ZbNmSZIZxDhewBS+TYrwBbfbZdWMF5LGekaCgy1JTycsVgHVzUNUFz+4s2qXRyXh2q2qt91rED712qGH2wj4+r+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfoPka6L; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfoPka6L"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso59395751fa.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866078; x=1791470878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FOj1RGK/mRk1UhJU2+5CuBy3GqPCpS4tTpMqltPtOA=;
        b=CfoPka6LNgH6fX3A9a5+O26ytPhKIxp4IxTWSsjpnkAKmmvQ4CSyTtp2PJ7uo5dQHo
         hzZ0ABXnIy0A2UmgbrA02FXAEgTBktGheQ3LYD0CI/VualuSksb2ZBKLVqYRo1MpcsBa
         ZshPZIs+gkemwLZUqVcnxeX2FUliHszyD2jmAIEmQDt4mOAbfDwh/nLmmKUETFTXATRd
         LZnQfLF7BWLYiBshtHx8CfRz7tgY48/T6hzqGqEDP+entcr2ZSDRiGgCV7bTDkTS9HxQ
         Z1MY1deL2KOUEg8CNHllPcsS2ig6ZyufCsqAGPDgcwdvjWlK3kHairqD/NXsWAsNqedj
         MORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866078; x=1791470878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FOj1RGK/mRk1UhJU2+5CuBy3GqPCpS4tTpMqltPtOA=;
        b=AbjgtlQBzRr0d34POucDi6b4KYItOiOetpa9I/a9ldeXo9Xx0PHqEepi2Kad6e+7uX
         O4wrGeb8+5wQ9wuyrA29Qg/4IGQDN1g8mtTwcE0BhxC0byG/K6aLpr41RrYFzl/vWgVH
         tktb9+PPl6Cp/pWlQCWIIqBzyMTrzPhKg48ULMTPMGrbeJZNAWhSJH7P5whpgq8UxsNZ
         C6dvJY35JGjcSzKPrdRrFM80e7hUFdTT/nQXFzu0JhHduFLavLUWoPFc5w3tclHgx5rb
         qNk+THjgjY0CDwtKUm2KkH9NM/ZgEs8g3ZugwuHoRDRKc7E7a+kr3YSR060+Q8vYHqLn
         dfFA==
X-Forwarded-Encrypted: i=1; AKwUvBw+tnIUWDQaO4pUREoZ+iC9WPgVALv43uNo6hID1jNp+X7I5AireAxWINXVSBUWB12Zj5P6S6VWOhqRAcf/kRwyzb8C@vger.kernel.org
X-Gm-Message-State: AFq9FYL2CcbrqY0LOraeoVHYqcGIh4sZzbYjyttFc9WWHMeWYQf2/tHS
	/H41wXrF3Ep8V0ri25D4tTtiJtPwJGHSiDHy5T3Ss3Ie3cFRwJyHo1mM
X-Gm-Gg: AYBFou1HchS5kUV+wP+kB+mGKRE33zuyEmZq/P++gSh5RptSEAhsft92txUnYzuR6xJ
	zORQqEe2YJ73U3iZGVw7ZWwFjhQAygx3SU0FFpzo4wvHZobYH3eCIxsmKtM2OAAz/sDTLRf/nKo
	S5qTHCx9OyaPShNoazOkjVoCHaPsJoaHkIo/dJpjsZr5yJhaC/89miRwTD6jntcKxODpqTYwl7P
	JXYAeVjkkDvITMg2Xs6c9sXCE0iXBp3Sahmw8ONHZ/IzKHOdlBaJfmWZ3JyqCJNCl5tspzhZdoc
	1NAifqU2pgmopqqHy+uv6GiZbzlmpkB09V7U3MIeyPZVQT+V4kITtuV9ExXtd9Ks2vEU684/oun
	88tDPMSTpzbq3IT0JzDMGcKG6lChTeK25gxl5V7hki7eX5ZkbdoBhDfaWY+8atgMPuJ4QSwGOw1
	k7dsIxs3Mc++EII83qccuK5dYaA7FeHNh3WK34PXBQC8XzO8nukIMvotN4P+Swf8gm0BA9mq+wy
	Fid9qMMznc=
X-Received: by 2002:a05:651c:41d5:b0:3a7:72ec:81aa with SMTP id 38308e7fff4ca-3a779207c3dmr16366201fa.28.1790866077663;
        Thu, 01 Oct 2026 07:47:57 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87cfec0efsm918191fa.17.2026.10.01.07.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:47:57 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: Qiling Zhu <kmatzkaczor244@gmail.com>
Cc: Ruslan Koreev <koreev.r@gmail.com>,
	sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pm@petermarshall.ca
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Date: Thu,  1 Oct 2026 17:47:47 +0300
Message-ID: <20261001144747.1167917-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aru5-aq_sPUDy8dq@ThinkPad>
References: <20260924171820.1179823-1-koreev.r@gmail.com> <20260924171820.1179823-5-koreev.r@gmail.com> <arY2CULvwXGyVvH_@kekkonen.localdomain> <20260929092238.1765758-1-koreev.r@gmail.com> <aru5-aq_sPUDy8dq@ThinkPad>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Qiling,

On Tue, Sep 29, 2026 at 09:25:39PM +0800, Qiling Zhu wrote:
> Since you reported successful plain-V4L2 Y10/Y10P streaming on
> next-20260924, could you share the exact media-ctl/v4l2-ctl commands
> and any setup performed before STREAMON?

I tested on next-20260924 with intel-ipu6 bound to 8086:b05d and v1
patches 1-3, with the vd55g1 changes reworked for v2. Before the plain
V4L2 test, I ran the following with libcamera 0.7.2:

  cam -l
  timeout 30 cam -c '\_SB_.LNK1' -C5 -s width=804,height=704

That captured five frames at 804x704 R8. Afterwards, media-ctl -p
showed Y8_1X8/804x704 on sensor pad 0 and CSI2 pads 0 and 1. The sensor
link was enabled and immutable, and this capture link was enabled:

  "Intel IPU6 CSI2 2":1 -> "Intel IPU6 ISYS Capture 16":0

I did not enable any links manually. I have not repeated this sequence
from a fresh boot using only media-ctl and v4l2-ctl, so the prior
libcamera setup is relevant to reproducing my test.

For each format, I ran these commands first:

  sudo media-ctl -V '"vd55g1 1-0010":0 [fmt:Y10_1X10/804x704]'
  sudo media-ctl -V '"Intel IPU6 CSI2 2":0 [fmt:Y10_1X10/804x704]'
  sudo media-ctl -V '"Intel IPU6 CSI2 2":1 [fmt:Y10_1X10/804x704]'

Then, for Y10 (with the trailing space in the FourCC):

  sudo v4l2-ctl -d /dev/video16 --set-fmt-video \
    'width=804,height=704,pixelformat=Y10 '
  sudo v4l2-ctl -d /dev/video16 --get-fmt-video
  sudo timeout 20 v4l2-ctl -d /dev/video16 --stream-mmap=4 \
    --stream-count=5 --stream-to=/tmp/ir-Y10.raw

I repeated the three media-ctl commands, then used:

  sudo v4l2-ctl -d /dev/video16 --set-fmt-video \
    'width=804,height=704,pixelformat=Y10P'
  sudo v4l2-ctl -d /dev/video16 --get-fmt-video
  sudo timeout 20 v4l2-ctl -d /dev/video16 --stream-mmap=4 \
    --stream-count=5 --stream-to=/tmp/ir-Y10P.raw

Both Y10 and Y10P captured five frames successfully and the images
looked correct.

I have not tested next-20260928, so I cannot yet explain the EPIPE.
Could you capture media-ctl -p immediately before STREAMON and any
IPU or vd55g1 messages from dmesg after it fails?

Ruslan
