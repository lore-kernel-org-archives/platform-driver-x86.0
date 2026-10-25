Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943452;
	b=yYeguON9ngjyWR6xvRG9cKtKe1Hv1/H6Nbz1/9EJKIz+ZWa/5oBlhboNZDi0WK9x3UuE
	 /YLQk9Z+C5AEp4LGyvyITn4KV7wauynLXhhE4RYE0iyXT4Huzq6c/034h8hnO84VKENAZ
	 TlOufknLBu34rIWy/Hew6ZcFkQbk+FK4hiteLomLkWUto5mcPFtvJIBQBs+2YkfW6F2XD
	 pRiUTfQhkWmctNzkPIqZpDyD3mbEx87UORJr9qZ8/8tYt3Wn1tc6mOsqsJd5MuI830+k8
	 mIInPpbrI6HQjOxTx+w4foo1RYiYbRAMJG9QqpQphWfAeWFwH5qW4z0XgJ9KLyWXO4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t0LxG8ArlpwGaMi1KQwMTB6Eitywqcn3wcV6XMmyhOo=;
	b=o2SRohYo8pnJ4tjCCqLYnQJ//NiUl98EdOwnh3v0aiqEszUD3END8bKbCgy4X1r9CpFr
	 04APh1z5beCcn9KMBZQty0uQKeSEKiElT7dx9hkPR0lE8jccGmOkl3XhN1dE2l/8VYx+9
	 7QV+1zYyEfcxPu3X5UOqJSGgp7FGM446dAV7SS1dWE9b35r0U7Sk4LT4WyBT7mpJs0XL8
	 u9q55czCO2NxZ0YWmgF4Yd8I7SXzFAdh3Jdf1jccFyXoxPB5owOUi5hKBB2H24zcWpv1g
	 NnU64PJiWjwfeffyPM+8r2uDnL98Dr9jpv2rg44DWztLv8Bj5trVtPGHCkZQpQ7RQng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L0wSwdnq;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81891606A31A
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 15:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81891606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L0wSwdnq
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso23067505e9.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792943451; x=1793548251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0LxG8ArlpwGaMi1KQwMTB6Eitywqcn3wcV6XMmyhOo=;
        b=L0wSwdnq4B2MyT9qhO5Gp7zLUkq7Bownv3MM2tcgVDrwd8zDrASQ1Zv7dJCb6XrC9r
         80V1h21aweGFPQ/sNib3bjqiPnTugoYb5uhGhx7I0snK6PTRI+4Z93JBlc+z2Nufn1b6
         66UWMFd9qaGceDsWXNgtH000KXf/Rl6c/FAoe4AZQYTC/iGfXzYZovrFTVzqyo5BBjCg
         66psmUiH4FllE8LdXvvd81Gc14XpheP+XOMGl3wvgVJsXT1vig0jbyoRnWo5zNGpEcsv
         mqU9vNeS59Ajlw75uTnlEGr7oo6PLBVmWEhJh6XDYpwT05VXts2D2nBragplrtsjgn/8
         VUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792943451; x=1793548251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0LxG8ArlpwGaMi1KQwMTB6Eitywqcn3wcV6XMmyhOo=;
        b=K+3c/EESzPgucx09kAzD/gqb7Kg/PuqWkpeMTmlRq6zruhxGD4/Dno9BbNEXlw/gWq
         r1AnS7rlAEwg5ZcxYjYfXVQi15UUrRe23Wn64ffxpA05Hxgag7m2W1TILwybL+pKvd0r
         p4PO+xqiiKeKUHIUUzlmW+xC5dZCgAeCNRbCJPvDceAIj48ej3igEj/E4m4/mVuSb/N8
         CGlUvVDgK+PPkRS7IYzv063nm4eD/O4D7Cz1D1++6lUc/EuUeMMKd/SyVwcblZ3Kv9p0
         TJsyPBqtjaltHIknxbbZQ9jb/PcMgBpO9uLtnD6GhOeQFmNIpZm6FmdLuAgXevybsEJZ
         n4FA==
X-Forwarded-Encrypted: i=1; AKwUvBziu/dYzUKlUGsxBNCE+/ZYkG7e3yvbaS43F9UK4Uzn2nswTf9e9tWv+jYFiLkFbqA9XVN16zAuucdhMUUe0QlBzMUQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIZu4vh3emmWAF/xICqChKFzp8Qyjn6EqCdgvqfFFTb4QwRFYGa
	ajX3tc+tZ0LDJfBPrvD3IHsioJuW4xrMstONqVfLHo/1kghGdJpXjRKp
X-Gm-Gg: AYBFou2qUipHlJ2ZZ47083TUP49Bo/B5hkKA4OGOBP4ZezQ9gfMGlp/ifxAxZcX7Eww
	dJoDRwnEmSDaNCGN66K4LmNK+agO2uEQtqhjty41LroIBeKjvJb2qAKHCYjp2bi18jw3ikTN2U5
	sXcf3Njppqm1W61ie2PG4daOAIN3wVUOswy4Pa/4dFkxW5x+HrZAMST5x0LuSx8pQDFMYDYHuh3
	cqVm4c7m6aRrXJ/1ou3LKWk3RlDt1WEc82GcsPNwuF4WCZLi/nOC1TX58YPpvLl9YJQi0x4zk3j
	1SR7n/gWPpfhrVNMMiGPx2+nzCN4r7mMvEVazE4fVulnbamt4SqBLsQW09dAARG52sSakqHy2/8
	d6j0zvKgbYivLKS6GNsl7CLkaDNlkeX6P9S2IiciY64IRZvzlXgSpDI8/4+brkMLJ91MRL/dX2h
	PA9lgxFtB+gHYAX0yaxOIRIj8eNaLQoTFNID0V9oZiSVfzz63pjH4Zoq6vsLm8KTMBClXZ4SYmE
	bELPznIOuAe6by0j5BhFM3MC5IZRjMMJeSiASND22DZeXp/d+L3V7T7VkICx+b1+aDLtnqxUQUI
	yuBOKho88Gmliw==
X-Received: by 2002:a05:600c:a104:b0:4a3:5c67:55ed with SMTP id 5b1f17b1804b1-4a35c675a4bmr58810335e9.12.1792943450808;
        Sun, 25 Oct 2026 08:50:50 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bac37sm137730275e9.6.2026.10.25.08.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:50:50 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Hao Yao <hao.yao@intel.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sergey Lebedev <lsa.uz@pm.me>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for DSM method
Date: Sun, 25 Oct 2026 15:50:47 +0000
Message-ID: <20261025155048.42957-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208035122.2147678-1-hao.yao@intel.com>
References: <20251208035122.2147678-1-hao.yao@intel.com>
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

Hi Hao,

A data point from a second machine: a Surface Pro 9 (Alder Lake-P, IPU6,
8086:465d). Its infrared sensor is the same ST VD55G0 (SMO55F0) that
Sergey reported on for the Surface Pro 11, with 24 MHz in its SSDB, and
INT3472 enables its clock through the _DSM. Without your patch it shows
the same symptom. With Sergey's vd55g0 driver at 396 MHz, every mode
runs at 47.31 fps where the controls give 59.14, and at 600 MHz at 57.20
against 71.49. The driver this machine used before behaves the same way
at both frequencies, so everything the sensor derives runs at four
fifths.

With your v2 applied to the int3472 module and loaded from a cold boot,
nothing changes. Sergey's driver still runs at 57.20 fps at 600 MHz
where its controls give 71.49, and the previous driver still at 57.60.
clk_summary reports INT3472:01-clk at 24000000, so the patch does pass 3
to the _DSM here; this firmware just does not seem to act on it. The
other two cameras, whose SSDBs ask for 19.2 MHz, are unchanged (front
28.64 fps, rear 29.95 fps), so nothing regresses.

So on this machine the patch is harmless but does not fix the clock. I
cannot tell from here whether the Alder Lake _DSM takes a different
value for 24 MHz or only produces 19.2 MHz. If you know of a way to ask
it, I can test it.

Fernando
