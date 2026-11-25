Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643888;
	b=odxO2lYz+e/buelos1u0PtWPhiDkMY76sTMkqlAjM0Rf4KbPWwGyaOAgH3aKbH70KAOq
	 ZEmQMxmOV9kwqrcciXnb3p2HFSeSXsv+6a1luhBloEZ6Nja4qDhjhBKmjIJtWS5LWx/U/
	 5cF4HpagiqrfMfd0uJRDbiZDmegdKGi0dGA365hh2UY5/aBPniFU5TZlWI0nBr4VOPodd
	 NwqmzgXAoy8iey/S0LGN3+cFZHrCeULtzTB+YUopYCVkJLflUOoarnyG9RqMZuPJpvYr3
	 Srh/TkO7zrGpwY5kLZ4ctXhRaArG6E96zbn6O5MdbEkfSHT/jlNbSHXLLD4cVrP6Nzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IyvqgKo2v6BVnDcrFL6Wvc36wm6DoPtZFNiMkXU3xrc=;
	b=V9suIID1eE7DBaaDwZp3UBf/boT/IHQKHH7mviRIApzbmypw+8gSFG47yTvdY53rWinG
	 QBHEXMVHMDFctFVVi5RmjxfAkTT3EKvCp05ePgFEKskCg5+FmIgTqI+gcVlpq0fqMnYHl
	 +QS6dnvxqNL1zrAjB5bAU5hV9QtGomgD2FLVJO0avVgsEp0zj9OVP9sGBS3tewHrZkjO5
	 axIE/eZ8YzYoFU9ar4e6HlZdeWVHfWAzoTT7WMFXxfmQTb5hjXRAi3N7ciSCTKdo5G8Kp
	 LpyNqWYNs6VcKbL2u5Kq+Rfy9X6wqCFVWYdrwEgRMKM+rM1rr+COhnmlkRiheIjjE5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r/Ybxl8q";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B4C606A323
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 21:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B4C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r/Ybxl8q
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9ae391a05so44502755ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 13:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643887; x=1796248687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IyvqgKo2v6BVnDcrFL6Wvc36wm6DoPtZFNiMkXU3xrc=;
        b=r/Ybxl8q3Wc0ygxh7eeEgZmgmz3k9BuYIGmmAFyMinBlLuTVxGadBtzd9nsrULGjwm
         0VFCOKNNyu5H0nKL0ACWvrdzrycSn6oudMciLnIRNGsKty/tdpXsRM60Z+ty33ZXJyDX
         sEUzMS27QkI0kFsgZgo3Ppqd6JU+eaZ3g5rhFeYoXk+C4uaEFF078HAjY87lPAVhKV8Q
         +Jayyp1myy6TVJV42ZYbuw6PXuXmpGgevNxgssW8dHJe+dkQO4sokT321R9Grnzy15/h
         rpEQ6fZoJJdNr1SMjqCroZi+sQpJCTT5PHJnEhZkp8HhjgnIjlbg7bJmuUbcjWqMhwzx
         bMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643887; x=1796248687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyvqgKo2v6BVnDcrFL6Wvc36wm6DoPtZFNiMkXU3xrc=;
        b=CzgrcrBRQcrL+/tA/oOv7uxR1xzanynli7nOxaN7ZUyYqnpEIkXjcbt2qfcBOHLBTV
         9692ODlR8RSTF5PAHPdy2pt2MHRsXQcdVRVGPNtN8floxOuc9Gi4tWQe2OT9mtql2s2g
         X5cpFMZKFliKzpxq5e6kOuYNIc/NoDNbJnkID3bZ8wZAhgB6yYMBmZD3+xUAoJudLAvS
         nXkAQJdUImJ0xlF4Q7yRo+7gxJbdtEheKMCWK0npToYyEqdkZXbM3MkrPpWNyxtiMv7e
         MnQitVGKUbmoQncFquN4ZaHXXP3d3Zr0vyjiPTFlOOaEMvhvo5OkDJK9dKbZVK6fU/fZ
         Hsiw==
X-Forwarded-Encrypted: i=1; AL+hErEwzP/bitRNIoMBPqNszVLT5y1LwKaklK+ubPlRanJaAAjpBGGSKrYjeaeOp5kpf4l+DAFPFAeyiybyDA15+6Fv/kMH@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fr/7ljICo+47r078gNtlY9UXni6uMABvRWB0HJwvpeUzz+A85
	Ku2uO0/V2UX6yeGwn5uMWNhcuZocwhgp3jHyIdorpraaGYhYcuZWYyPw
X-Gm-Gg: AZFdTZc9pObbL9TV5Ksx9b8n3U+dfvxtvWIzHJGamAMdP9QCTBfzpgEc8XV3Zk4XfJG
	e6RSYE6hdBSNtn7Y+XBJSWASlojUYWDYY5l2Ig9qxEMlVzKDPvL/y/0U7EhnXWdsMtG8ICt95Db
	cnilHiHdDy+LLLPmF3/5C50myWz/z8aMkjdryGgj7QFRJZGnjt7XCGhD+yHIPw1709qFW30qXic
	xBvVBCHKNkSxpqmBZ3/yf5Xvis6au75WNf28ea2wDauL2U+rQxMosksEPu+MHx+mm2DIMeRNgUG
	UAZCH/lYeI8M63wWcEUXtUk/dOdI2i7PC7VLW237txJPR5A4L5p/l42rQ2l7kdoMs/TRRcrCSBU
	AkOcQAYUU1BdWzIBxebB07QQuCSM4qpDTiOmur7414mlbyuG8ULHcVJD82Vs2zvsMiPBG+ejOf8
	wVaZccoMQ7jSxu5fyisV68aCJ6c8nwZvIFyJNAKZkUqyOw8nWuKgIc9hpoUSM/KzShCpPvrKhow
	AAhGUssPz2Yy6ys3Mkni3yOEyRy2SK22ZclQx3Hdpv7M1ziIrHKfFMLlfWzMrw/7OOSX9igNrO5
	HFf4cZLIiR9RM/7w2K53MFaZsI+CWrub1J+J31R9w3y3gmfM3XgAWUSI4iH7RVmz7cyA1n4xK+D
	HC0OzbfawBAOT2ycI/ip+mEqWU5b13mJq3p1LRH03omU=
X-Received: by 2002:a17:902:c406:b0:2f0:5a4a:2d9d with SMTP id d9443c01a7336-2f05a4a3812mr122752875ad.19.1795643886954;
        Wed, 25 Nov 2026 13:58:06 -0800 (PST)
Received: from localhost.localdomain (74.82.221.43.16clouds.com. [74.82.221.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm91547365ad.3.2026.11.25.13.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:58:06 -0800 (PST)
From: Nikita Ivannikov <www.nextry@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Chipang Kao <chipang_kao@asus.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Ivannikov <www.nextry@gmail.com>
Subject: [PATCH 0/2] platform/asus: asus-armoury: GA403GM power limits and a MAINTAINERS fix
Date: Thu, 26 Nov 2026 00:54:29 +0300
Message-ID: <20261125215431.120307-1-www.nextry@gmail.com>
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

This series adds power limits for the ASUS ROG Zephyrus G14 (2026)
GA403GM and fixes a MAINTAINERS gap left by the move of the ASUS
drivers to drivers/platform/asus/, which I noticed while preparing
patch 1: get_maintainer.pl returned only linux-kernel@vger.kernel.org
for a change to asus-armoury.h.

The two patches are independent. Patch 1 was tested on my GA403GM as
described in its changelog.

I used an AI coding assistant (Claude Code) to find both issues, draft
the changes and changelogs, and run the test; I reviewed everything
before sending.

Nikita Ivannikov (2):
  platform/asus: asus-armoury: add power limits quirk for GA403GM
  MAINTAINERS: cover all files in drivers/platform/asus/

 MAINTAINERS                          |  2 ++
 drivers/platform/asus/asus-armoury.h | 32 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)


base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
-- 
2.56.1

