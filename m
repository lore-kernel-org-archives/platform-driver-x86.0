Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985B35AC0C
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222661; cv=none; b=fg8paCezKNhHnQfGtej3VDwP2StGpJUZ47Ugl92YCTa/XUU2djRIx5w2H/w/5OttOlUgTtMKyt2+xP2AsvsG0X0HyKigwB+YsdXd2e1qWfvaQI+fJ5PUo6Dzc9UPJ7JLnpzzxdyEUJDmSwLV9TKyljmiGT7kEa9uNzf2asBvUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222661; c=relaxed/simple;
	bh=WZdjCu0rAOvAKnFgRIUfmcDKEMo+oJUKqwWbSnvz7ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Se+Rq2vY2fPXK9U6TcO4fmzgZJwKslkPlWqEbBzusuULBRHv/9zrLV88rcbMWsHtHqG2zbcvlamancDPwe8NRh72QczNg5R0c23HW9R5VbZ99+sS8grTYjJUCgXQfF7TLcv0cT9zMRazVRkCZlzLHeeV0Sw5yMDgCpj/Z7AoxOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOvjj9ZU; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOvjj9ZU"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-353804b591eso963964eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 00:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792222659; x=1792827459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFRuAeszDrkm1yI3pZR0D3+csEi+yPWQc7sruL4+TM0=;
        b=hOvjj9ZUOBl1OpOIHZxp7TmlR6/uI2J6U2iLSOijCaukVGLryBsNrGY53gfk64dPjw
         sI71Qhim/L3SZuQaxcaVq/dJvTtEvohquQ1rHKRXRa4zxkBWOHqFh+C455Vm0VMZs2Fk
         nILpTUPb64X2cIRJW8UFQzsSB9hSkbsTDFt5KfzuyjhY9SNnqKSAh2clDLxg385BwSGl
         gc4+rIDFynm4NuQAQB1ZN+F5mS3yi8vOZu5BfeL2p72wjzUAhVvIgzwZ7tM1hyFIOWa8
         +Zrj97h/tXZw4V/MvxWUJqKmbd3ExsG0uwXXkJwSPPq9wWJyOy+kPOfhhr3n92gy/Azp
         Uy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792222659; x=1792827459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AFRuAeszDrkm1yI3pZR0D3+csEi+yPWQc7sruL4+TM0=;
        b=uLpQ6YEhXTzrMoPGetR4CWtZrTQKub8LailpTpeO4sUWBOqlhRFTw7/CaVyDd6MP6k
         VTtDw3zHCCF3PK6jrqAKqstO2d2fz/JLGWzsRbKFo6Bte+uGfedkWSTjxgyLEOGA8OQM
         Vmntqrbklkx78STgTQsC7gHtdB8iLQEV0+G3DtHZDdKV7I83iIhAGzuaeI3g0DTcZ2hx
         7+tm9JWJERwX1kml+d4+wcbb3fnmX2fnRJChMPghygx6Cx3XyCbuL3lNPeILhWzvRGyp
         wtELyQWwN60SMMM9Qx1dueQWTtDh2HGmGH07wudTredzrGVw0zNAoo1dP1Xv/o0kAmPh
         upKw==
X-Gm-Message-State: AFq9FYKY2q/O3B133whN9KLmLNzsMAnubVCctDoHuEj6lVYYLzCr8KVe
	XsnSeRGITYscruu3VnKZg2xPto/ryKjHQfYM6hjp8eL6Mg8pIYNtN7f8N4gN6BpZ
X-Gm-Gg: AYBFou1c/OJROkYDJefIxNYoeegWepe43gq2Xe4dXaD8YhpNAGcSy2p8blWVS2aFK0i
	alVLtkJCYPQvbvQkOzPw4aTxljf4HH16v3r7zH37/RF8Ua88NaHZt/9EJnhXMyenVoYD9mJLrzt
	Xh7dy7z0lZ1eXwIcKL2NSxYH7x2b9QMaKuKCDe1V4EXuTdix4J3jHiiHQbMEdSF+8NDzxl4DIc0
	wd56ct1pTrBu0H9eASkWFfyB5ISWMYtvE4Sttu3bAAKeQG8VdNPSd1YRMu16BQxOWubbRZD+EDd
	eOPvDgQ7HZZG0fsKxhGY3zBzLYqT9Fl1pmRk5jKexti9UxxthAVqzdak6LjJa+mBsSH3crMqEH8
	Vr4ieCJaOcSUr+g7r982EGyFnsdfHFODZQU0OErMg0rJkp91O5n0X8bULe3a9gcUORO7EQwd6+/
	Q/q9c8rdbopsoAVhPBq+nsdxykS0c52p/ICg/h3G0KNuompmEmn70u3bq+4h5H2HJzlreHB9kfI
	hY1/Ef+aYbPxZRLr0YehKyLZn8VupuhgiDu
X-Received: by 2002:a05:7300:10d:b0:361:306f:c32a with SMTP id 5a478bee46e88-361a0e869c7mr2944000eec.11.1792222659389;
        Sat, 17 Oct 2026 00:37:39 -0700 (PDT)
Received: from chitransh.. ([106.202.98.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm15999208eec.3.2026.10.17.00.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:37:38 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v4 0/2] platform/x86: dell-uart-backlight: handle stray EC byte in responses
Date: Sat, 17 Oct 2026 13:07:02 +0530
Message-ID: <20261017073704.606497-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

On some Dell All-in-One machines the EC sporadically inserts a spurious
byte after the command echo in UART backlight response frames.  This
causes a checksum mismatch and the driver returns -EIO to userspace.

Patch 1 is a preparatory refactor: extract the byte-level response
parsing into a dedicated dell_uart_bl_receive_data() helper with no
functional change.

Patch 2 adds single-attempt stray-byte recovery inside that helper.
When a checksum mismatch occurs on a frame longer than the minimum
size, the suspect byte is dropped, the buffer is shifted down, and
status remains -EBUSY so serdev re-delivers the real checksum byte
naturally.

Tested on Dell OptiPlex AIO 7410 65W (board 0TKWC4) where the EC
inserts a stray byte on every get-brightness response.

v3 -> v4:
  - Perform resync inside dell_uart_bl_receive_data() rather than in
    the wrapper; status stays -EBUSY so serdev re-delivers the
    checksum byte without additional handling in the caller

v2 -> v3:
  - Guard resync with resp_idx == resp_len to prevent memmove on a
    truncated or out-of-range length field

v1 -> v2:
  - Extract dell_uart_bl_receive_data() helper instead of using a
    for-loop with a pass counter
  - Split into two patches: refactor then feature

Chitransh Mandhaniya (2):
  platform/x86: dell-uart-backlight: extract dell_uart_bl_receive_data()
    helper
  platform/x86: dell-uart-backlight: recover from stray EC response byte

 .../platform/x86/dell/dell-uart-backlight.c   | 52 +++++++++++++------
 1 file changed, 37 insertions(+), 15 deletions(-)

-- 
2.43.0

