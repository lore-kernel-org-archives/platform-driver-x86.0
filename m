Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917501AC45D
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 05:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744508; cv=none; b=XV4WYMlu9o1bhGvfgfpPbHy6bbU4/1dNoiJ2gu7vqQLJ6e/ZFffl5H5NkPyMLlYLkXSpBEFEmS4xninNsjngbqNGwuNlZD4YeuCQr14ozt4vprWrr7EY5TTcbN+sUbyOLMjm+ut8fsE+8AFOwUnb9lV+HG4FtKoqdy9g1khLr4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744508; c=relaxed/simple;
	bh=lhoiz6FiPuo8GkR8U9OsrZhP58wDWfewgXOY4y0kleg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d7K/z2BGwzy2VULCfIWEC/YKZZ0dPZMsi4UKhVzCU/LloLOwEtFHtGJWauKtjqxcRdSh0LnPx0jkXt8wzz+PiJbXwvDFwVUpRvP9Sy9qMtJAPqATRTCq32EUele12vShDCGe2UgVR372dUxSPE83GlCT/CUDKmV1LeRLZ2iB1cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbO8PJRy; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbO8PJRy"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so4708657eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 22:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744505; x=1791349305; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K4tDF58WJFDkkKGBxhBoU4IV4oQ/VCzA24mY/WFJHOs=;
        b=MbO8PJRyDQ+oWtxrMdpMqHo8ugyUn/rKt41Bh3uVVGRxbJO22CrwC9DfU6e41Ucgul
         fEYvgdQ6aAsrvYTDqXYayPV+TOQRdAyj/NG0Gten9qrJL27gJi4MTXFlnuIvRIXW1uPZ
         wvqb4TD/TO+3f0CxPZzFup42t4qthSvX6G5vnNi49h/dOpcKPQzgwWTxnU38YAVe6Fbm
         I6hfubGdCpygqyGhxG1ZkgKu4OSCF6qtI0rvTLEsVDKqYMTDHQInTBraEwjUqncG7je0
         OMc1gcjzdSzWh+f/OEZ8hdj8VORpba5fQou/P0mX6VAfNa7Gz/sXH417gPa7k4Ao7T8b
         2sSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744505; x=1791349305;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K4tDF58WJFDkkKGBxhBoU4IV4oQ/VCzA24mY/WFJHOs=;
        b=r2d9ON45TnkaUvf2PFy8OaTpE+zqOog0RYw2mmi/c8TnpSV1LoehkUFfpitlp1wSGO
         U6FKPKfHeO5MTyk5/6d1mQLzUNfCoVR47yRxVI2uf1c793FzPXYFIkZfAKMvBmasWHMI
         zct9QldO0SpMYS+eXn3/mOlRfQbXTqgfdk5AsoqKON+lUNh4JjyOqcj4FXkNemQ8zaIB
         Xd2afTS0tsVUvnmFzbaYPF2EVroWRX5NkOrIEuQXX3bGrFjOQlXmO1wtzc1ZuMq8FjOp
         e4ujvZuHSjZbRAcllwll9Gd4ibSpiujVdu5CLuzMDpE7H4W0doatrY7xFHvjkN2zRUS8
         oWug==
X-Forwarded-Encrypted: i=1; AKwUvBwtWBUyEn2BEQgj2YEoF3xkQyRMu/6bdLsTqq1qjxtExnxSrqV8uZdQPmvODBW6k0HP5i3z+AzXTz0eBEy1YCvlE1w2@vger.kernel.org
X-Gm-Message-State: AFq9FYJdY0euMTW0x5ftmFgvUApWHOjtmVei81bqijd2BoebvqdlxJim
	is6NzFS2BeIu4SqMRIITuAsm8LfzCZsBPBB4Dz/d1/f3pT1CdRz0KdyM
X-Gm-Gg: AYBFou2mepdYb/+aQjAXfzGXYGEhUjzL+BfCW02McOxwn5070Tycg8CQTRm+NPQ/Ymf
	egHNa/73uEuG+NI1M1ez+g5PaGJ88KCmqqFpEIB6YP1ZrIYQkaKJISBk/QFm/JE+pnJKyy3IyPD
	8dpX/ThGgvtDJvMFRSucsAQiwa5KX8U7cRYn4cZU6HSMJftW8/WnDKKKZeugLAiYyl77nvGRfhA
	VU8BB4+iEHufSUyiogmAO0JMh64fymThxGpjxSrDKERG4PLKb7Z4B75s/Oca/yptNjBiRxsEeSr
	tSbnIF5QJQADejFk6szixtcQscCaux2NGyUcfe7aCj3Lo16KwxbEemPNTn8bsLNHDAkCt2F8yhm
	T1wPg92pfUyu2nexw+QNI4Pkv19MUUK5ZZKTSJnFfl3EqN4/08VEVZg1oPDpKeeLf0yyTfMWfD1
	7DEyRapVafUcpo2q9VDkSp56+AZg5bM12+dKPjGzQIfX+myRBYAybPmptsD5UUETk5eymz8lSvH
	KuwjTypXJNdAKgSzPHD3viqye01JObW/XDVDtILit7czqrghsfAGITHPBJJVZE=
X-Received: by 2002:a05:7300:fa07:b0:33c:3134:f45 with SMTP id 5a478bee46e88-34cd907665bmr572401eec.5.1790744505331;
        Tue, 29 Sep 2026 22:01:45 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf613b0c4sm778125eec.28.2026.09.29.22.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:01:44 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/2] platform/x86: thinkpad_acpi: cleanup conversions
Date: Tue, 29 Sep 2026 21:59:09 -0700
Message-Id: <20260929-thinkpad-acpi-cleanup-v2-0-88e176953a4b@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2XvGoC/0XMQQ6DIBRF0a0YxsUgUSoddR9NBxS++qsCATRtj
 HsvtoMOb/Le2UiEgBDJpdhIgBUjOpuDnwqiB2V7oGhyE864YJJLmga0o1eGKu2R6gmUXTxtTQ1
 nLmohmSH56wN0+Pq6t/uv4/J4gk4Hdiy64OaMBVB/v2WCiUryphS8qVtOK2pmTOFdJhfcOLj12
 s8Kp1K7mez7B25iuZq9AAAA
X-Change-ID: 20260929-thinkpad-acpi-cleanup-8d4e7264690d
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Nitin Joshi <nitjoshi@gmail.com>, platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>
X-Mailer: b4 0.17-dev-6c14f

This series converts thinkpad_acpi resource management to use helpers
from linux/cleanup.h:
- Convert conditional mutex lock calls to ACQUIRE() and ACQUIRE_ERR()
- Use __free(kfree) for local pointer allocations

Changes in v2:
- Dropped patch 1 ("convert mutex_lock() to guard(mutex)") as it was
  already applied upstream.
- Preserved 0 return value on failure in brightness_get().
- Fixed auxmac_init() to avoid setting auxmac to "unavailable" before
  evaluating the MACA ACPI method.
- Collected Reviewed-by and Tested-by trailers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (2):
      platform/x86: thinkpad_acpi: convert conditional mutex locks to ACQUIRE_ERR()
      platform/x86: thinkpad_acpi: use __free(kfree) for automatic cleanup

 drivers/platform/x86/lenovo/thinkpad_acpi.c | 190 +++++++++++++---------------
 1 file changed, 87 insertions(+), 103 deletions(-)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260929-thinkpad-acpi-cleanup-8d4e7264690d

Thanks.

-- 
Dmitry

