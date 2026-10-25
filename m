Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952985;
	b=RcX6fF9/KQiUsyoEIxgIuaSMyNy0y4+6/xPNVkgeMrfdZmPPnJk5iiJ648FsnDrLLAmo
	 bnjDQm5VkdKBfbEf/oCpku1orRUN0eq8jcyS2xkDUdZiX8DxRKmCwSVdSgBRwfHb1PXA8
	 1Zkhan60doo98zK0tIv4eRNlgWK6/XtsDF/Nxg4YGUzpm7htAnCx0qYJzWA56yTXvVkLH
	 dfpZqpVrJvhZSth7ytF2nFYYB+7Y6VOPs2I+4lTu+/cBeBlufMpqvCUJKq3ZupmwldWyg
	 6kY2ASq2yPaRI5gaA8Jwf8kpYzWNGErYkslicqP0X0eqW7LVzozET7fxOrlmRuXQDcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=0ViJzLMdjNwSjsUaA4gnJdS3+jHjilI1Xx8EQmtZsBo=;
	b=b4JZWmjkSky5poKoO0BM9k+kydy1kYWMqxVtVKwHgMaXPtttvjvt08iy2Yxpvp4GFeBq
	 n/lRidMmjtx40r0SxpZxrDClgb0aiaG2d3xqpRmn53CLrwaBqte2rUAo1eVTRWQRGIWyh
	 H4qaLnoUfwD1r/Jr87789S8ohwETsHTpAl/J5S9lF9NkKVW/l7M7MPIOuAVzNEeWoURAW
	 orSYjD2F/1P76mqzvDt9XhOMgpyDYgYR65GCcQuXTNKByhw33aqYDQGTIRlOzW5FmCHZS
	 OYt0nZbIApdCQ/hLgSVonsh2gj3pHRGaWBWXLHEENXYV8NlbgUv1Ai7WvN5wlQtMy1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=icSy9Y9Y;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E653606A31A
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 18:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E653606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=icSy9Y9Y
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so2389817f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952984; x=1793557784; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0ViJzLMdjNwSjsUaA4gnJdS3+jHjilI1Xx8EQmtZsBo=;
        b=icSy9Y9YJ04aGQdKdAOrjwcthPXedZz8fp5YPu4eDeg7MeYZGdW5Jmq1rLomS7e3P5
         LGVtFtjkrwWrHkmEZAkNUSw8oas7Wf1OtIjYbqyJpoHHrxZ1cOmALIrwVKT0/bqAu4HV
         YsVe8DP7CWvFzQEo3+5RazKTsniwxYD0GTWzmDytlWc8nrflINzmNP/E6NirbuSFOrQH
         7882gkXQYmFw5Ao5FhVlm8CjXUW3JSF0o4LfntlvnPkMX4uxzrc+i1eNr6pep7mtTOMn
         96IPUvk5+QZgmHa2VA4wy3nY8/LzEkwKkvcFsLgnIhiArEkYhAmnrvBk+zzrCV7Grobz
         5oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952984; x=1793557784;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ViJzLMdjNwSjsUaA4gnJdS3+jHjilI1Xx8EQmtZsBo=;
        b=sZesDm4q7EWCINU+zOEwMqxddOG1oV5NzLmELmLtSa0+sD2+OyltGZUqrEJUcwuUy0
         P9LNUqy3uSINEcFMJZNcE/qy77iFkm4zc4W/TUviMnngmf0sOO+lNfVIUe89gLmvNr4O
         m+RjWRSTDoM5kl0abCQ7oZHppZNjpOPrYuxJXM4ETb/xJp7Y/s1At2xap1wsERb7ND5U
         j3N+RDNcX0KROnNwBrTOlKWWWWw12xWhs7C/HSukC1V6qeZNOMCshG7SGhWj67vqUmuO
         ZPf7nR9BoL7vL5KsjVFYIa5Soe6BI7TCXyliezbkyqJmgc1F4yhc8zbcOQM0Kev65F8D
         0XEA==
X-Forwarded-Encrypted: i=1; AKwUvByb0BJgFtKCZsluljykaDI7OZFC92JykrXW4eQoJiNoCMh3dloIcWe9QI3/QkunSEHdgLLwjZ67mmfwf6svgLnBN0OP@vger.kernel.org
X-Gm-Message-State: AFq9FYJALsh6DemsE1GS0EtSIK6JAB+bslkNqTwLK51gQwEl2oSS5480
	tAA6vYFBhR4hpVdwvGPcSInaact8hDUQZQsA33U+q33mMaEo4QQjRywp
X-Gm-Gg: AYBFou26HYF/yk4OYHuWtBbmARV1l4RgMNIfUjrn83dA2HRGkpGz86xF5dtGH+Fre9x
	TlOj+KWzEapv1Xrrn/D/GBKFGPDyuLkARErTPqXwhTbjPbWHOyIyxkIEy4h6Gfq7UvIG/F4OL3w
	WYJLOCoxtze09Qf4XFgu4m3+g7r2KGJGrcLA7a1RnoSSWEENwXgcPPM5hHiC/R1pBsPRvaMSf97
	WNNVTAzyNvdTzcAyZ6wcKtFlDMz13ECAMDRtZzogGi6Oz4futzTJVJB6GjyxdHQOr0kEc5e6ALZ
	zIlNF98toE16xQcw0FZvo7av+LUKxwSjzkmEgnF56oltrlYNkqedXwfSUv4RDFGlEF+q+psm5AT
	ToDVv8MLIDeyrN1q4SKCiRUjPOjrSsgnbfvBTabbyvYWDAwT9OOQ7bgOWoz3LMzkit9kDIcfd2g
	O1RDL4K0XgUdNI3g1B8M2RhGXh1Zm8QYlBf+qNpRYoce2kyNMclmyTmW5YlqveJ1iifg72xLFjt
	E9JTMAToa0Y0vPe6NVk1BzgXS0AqxVvAN/cxkC4yZdCGM3LnsD4NA==
X-Received: by 2002:a05:600c:3e14:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a35ae8806amr89044655e9.8.1792952983503;
        Sun, 25 Oct 2026 11:29:43 -0700 (PDT)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm138255175e9.14.2026.10.25.11.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:29:43 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
Subject: [PATCH 0/2] platform/x86: asus-wmi: fix and unify keyboard
 brightness key handling
Date: Sun, 25 Oct 2026 21:29:35 +0300
Message-Id: <20261025-b4-asus-kbd-fixes-v1-0-fa4dcf7d2a69@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4auEWXcgSatpexXpwiRTnRZUMipC8
 O6Ndvnx+F8GocQk8FQZEq0sPA4F5qIg9O3QEXIsBqttbbSt0N+wlUXw6yO+eSPBOji6uruuHs5
 D6aZE51Cy5vW3LP5DYT6OYN9/8CK9MXUAAAA=
X-Change-ID: 20261025-b4-asus-kbd-fixes-6c7e3780597b
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Antheas Kapenekakis <lkml@antheas.dev>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Denis Benato <benato.denis96@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartu Alev <bartualev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The WMI hotkey path and the HID event path in asus-wmi step the
keyboard backlight with two separate copies of the same arithmetic, and
the two copies disagree. The WMI copy stores the new level without
clamping it, so holding brightness-down at zero drives the cached level
one step below zero per keypress, the "value >= 0" apply check then
drops every following transition, and the hardware-changed notification
hands the wrapped negative to userspace as 4294967294+. Pressing
brightness-up at maximum reports 4, above max_brightness.

The first patch fixes the bounds on its own, so stable trees can pick
it up without the rest of the series. The second patch removes the
duplication: both paths now step through one shared helper that reads,
computes, and writes the level inside a single hold of asus_ref.lock.

With the series applied the level stays
within [0, ASUS_EV_MAX_BRIGHTNESS] on every transition and userspace
sees no wrapped or out-of-range values.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
Bartu Alev (2):
      platform/x86: asus-wmi: clamp keyboard brightness hotkey updates
      platform/x86: asus-wmi: unify WMI and HID keyboard brightness stepping

 drivers/platform/x86/asus-wmi.c | 79 +++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 39 deletions(-)
---
base-commit: 9d3475065167197742b0882aff21cf8e78393277
change-id: 20261025-b4-asus-kbd-fixes-6c7e3780597b

Best regards,
--  
Bartu Alev <bartualev@gmail.com>

