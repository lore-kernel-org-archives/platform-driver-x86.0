Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748023;
	b=hbh30F0cOuhXYwxd49UiQum0TQkX5S7qbCGOva3TAZfh38avu7+uVbCZHyNZDvFQVW2I
	 H3kBhpHntJF1w8AmvSEzvYj7DvM5sZWH3q2HGAzmnh4aLAZC8dHycZAZg9qolNVTb/TOl
	 W3ki6e/XUjrLZV3dzU+2rmpP9nm6I7vWBPVH0qpsXyvgBynNOfdUrHn4Q+JbxEjVXbKF1
	 qvt8ikp17eEauoAcNwdOvamAXOkrLJVP3+UJdH1CHqM4I/N6GOqEe4gpHBN8B2X498mJ1
	 0HscDZdgl13+fEKESqncPa1JZeU30W8YcQzDgO+BTI0tSPwbGm19w92EM+1xHYGFuXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=51qG27bZ1ggAX5pcc8kXdn94EdxvlcxhzAlR0LoGtcs=;
	b=dqozKMKroBaHEVhAuXlSJSef/AwxvgeH+lN8ArkrAYaXIXppo8arCGPXh5nqAPTehHpU
	 gAgDjposCCfWltFOEZQTDrxRIqOLFM8c6ajtts9FIAU/ekgNCU6AlK2FgCg2K1eEk4f/X
	 0cbRxXrpIe1p92pMTuLgX2nvhxEWjxvOlat3X4f1OHGdve9gUwGU3PAovaEQlcFx1jME3
	 JMQZ1AN3w4aWuXMkNGD3+Ge2mRilM1DtC98OVZzIdgmL4qBD5aU/RUjDpzglyrf3soflN
	 YA7z5ijJbR5izS+wbTrYwhoRql+HwUauwhns06DV7VukC8XTyn6i1qAbC1dG1bYEyRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsQNNbDG;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072CA606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 02:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 072CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsQNNbDG
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so4319781eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 18:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748021; x=1796352821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=51qG27bZ1ggAX5pcc8kXdn94EdxvlcxhzAlR0LoGtcs=;
        b=YsQNNbDGSDx/fyuRf4JncIK203zn+vKVHPF9D0Hpj6OnoqPsidG+O3jxh33HTuQaWv
         mI7Ut3fLSVJ5U7Bb0Hr8237kckAFy+Q+pRcessuqLnw96I7/1ESY64tEPFTp9GgD3k18
         s92wuvgCVJB/GTXM3fzLktjIblFPaURlLog2tSpocwqZqx8N8VbytgCwCuUK5P/kbxWB
         5XdcxXQfx6eFPz5aRMuB7x/51kUJ+p3E9i+rhBs7Ep+TFukTcv4vLjh92Tia+eWEBDpB
         v9ySo7czkJphhziLVet8gRlJNt4GDWxlqSe71lDrT5TpLs2sPv8AIKvCHapYt9fc9VYQ
         FLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748021; x=1796352821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51qG27bZ1ggAX5pcc8kXdn94EdxvlcxhzAlR0LoGtcs=;
        b=dW6SY5bvH1RwsbQyIhin3lzfqTpKRvydiILRLsCoP3x6xIsgopTN80ub2fnagC1HMB
         EiI91d2Xj8Eg8K0jI7lo5goSJF4jTHaxGwsfFbdjKJhkFg0WKcFsZZdA+ZApz3FDfDvo
         QYrTcQbS/oQZL8/37H3JsreRL7Vma1BOE6LzVjNIEN4qdj1NiruRSarhaeANn9Ch3SOl
         jQ2Yh4Y4TjCreSW1Nm5sdammPdOHoGTBRuKlOeDmfgDpRz7jIx1yMyNrr1Zd2fAUSfnc
         IE2xhhNBTYvzNjv8UWnQh1ACz4ahQmhm/DWgVevxTevrNtiOkmYhCV5i1+fuZEQh2MTI
         4sZg==
X-Gm-Message-State: APuU4Z9U96NkdsR0TzLLvvnTwSww9BAro9Zs2uH0lleXRV+WbRPHTF3Q
	U7wXWLghnsGPn/4943BUAYJ7PuziZL9Ds/iKx7qubmF5LMNDw+3bc7NH
X-Gm-Gg: AZFdTZfhNJczbIPOCcwOBbzaoguquY920WTqunDLXYn3ct9rsCgVVWEoevm/AVFWcY1
	Urs9BMURVDIQamSF8/iBOwjqNPgigrlnvdgk8fswWdrzuzwEv6CMsNFO3VMjMgjr6pEk9Bp7EyT
	E94PhfndBJFDTlsSQZz+/KGJIUt112zVUi5UTbnS244Y6+rnRiUklmkJDbaQqBZWFPueuJoQ2MK
	SqhksoF3czkhaBwve9prkqJq0dzGm2mFS73UeuOSGERlxvDhTdn6PAfGp50+vc6z38XJA16tOVD
	+aQqWx1UKcDDnxrLWvg+6vXZ27jeSR0ylGvkuqfJ4MlPKUoujxjL5b3hVBYClRJ76tmIwJi7wDF
	DyKMbqZ9ge6WPST/UpSinKcdQFSWwEJEMztsIxGtl79kILArG4EYy11IXhNnWkaV2JEmbFwdOJB
	5RR1V1l0xWfCwaD+GYtvFgjI2ECASml9Kh89JypdNpeQ0GAc5YDAkhQxhA0UKovi9ASmg+NOZAm
	anhT2WmzVFk9t0tOhLn9RwBAYL2JC+cYHdwGFiyVuJgx8Cok4ofgMT22wJQAEwhpidXnoGEpRoW
	uAogrko/3rbG5RD/foo6RFjxb1dmgMLp32+pYWUjh/mzedJ2MkMIa80aTG80jDh2bRZEkHWzAkH
	e9uamoDxCW2FE2efrqxcEp1GzwdD6TLIXMIijOGNJ9ZIkvg1hh/8MXs7oqyBxTVpvhfTPyIsRVk
	Zv0g==
X-Received: by 2002:a05:693c:80cd:b0:385:b8f4:756a with SMTP id 5a478bee46e88-385b8f47b36mr23705671eec.12.1795748021053;
        Thu, 26 Nov 2026 18:53:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm75811610eec.24.2026.11.26.18.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:53:40 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] platform/x86: dell-laptop: Fix keyboard backlight and charge threshold handling
Date: Thu, 26 Nov 2026 18:53:35 -0800
Message-ID: <cover.1795747885.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three fixes for dell-laptop: keyboard backlight timeouts that overflow
during unit conversion were silently accepted, an unread keyboard state
was used at init when the SMBIOS call failed, and the charge end
threshold was parsed with kstrtouint() into an int.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
 - writing 4424214d / 18989323d to stop_timeout set 4m / 2m before
   patch 1 and is rejected with -EINVAL after it; 5m still works
   (v1 of patch 1; v2 is compile-tested only)
 - charge_control_end_threshold rejects -1 and 101, accepts 85
   (v1 and v2 of patch 3; v3 is compile-tested only)
The kbd_get_state() failure path of patch 2 was not triggered.

Changes in v4:
 - patches 1, 2: Fixes: now points at 6cff8d60aa0a; 02b2aaaa57ab was
   reverted by b78695a71de9 and the feature re-added in 6cff8d60aa0a
   (review feedback)
v3: https://lore.kernel.org/r/cover.1795648586.git.rosenp@gmail.com

Changes in v3:
 - patch 3: make end unsigned int and drop the dead "< 0" check
   instead of switching to kstrtoint(); retitled (review feedback)
v2: https://lore.kernel.org/r/cover.1795219225.git.rosenp@gmail.com

Changes in v2:
 - patch 1: convert to a u64 seconds value instead of failing
   check_mul_overflow() on the int, so the unit selection below works
   on the full value; retitled (review feedback)
 - patch 2: don't fail kbd_init_info() when kbd_get_state() fails;
   fall back to level 0 / off mode so the existing code picks sane
   defaults (review feedback)
v1: https://lore.kernel.org/r/cover.1794633179.git.rosenp@gmail.com

Rosen Penev (3):
  platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
  platform/x86: dell-laptop: Don't use an unread keyboard state at init
  platform/x86: dell-laptop: Make the charge end threshold unsigned

 drivers/platform/x86/dell/dell-laptop.c | 50 +++++++++++++++----------
 1 file changed, 31 insertions(+), 19 deletions(-)

-- 
2.56.1

