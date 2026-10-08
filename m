Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF044E2349
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473223; cv=none; b=G6jabrhTnd27tNY8EYsoYl/XBmWPl2ly6LTwZRABWZ5Ornv+EIKybdSO6MI1FpGM84Qp5Wmvv7lq0Fw4+8ss9l5g3u1O8IgiDwHgPCXQME6QbriuuJjyLAM1ZU7njfuarSNdYGcSrT4SQMRhCysbYbeUWHRAbITURFJSzCPuufQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473223; c=relaxed/simple;
	bh=kX25jehi4FuSWJ71vfOzc8Jgj9wsXbwIcLBv8fbMu2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLb4s67+lHOT9KZgu7Xtw68ta59LhOhlrFjc4ylxJqVHfl9/IeBNBrqxEbLg1vgfAjNzeRRKnq7FLwg64I1+IS2d03QZFYNz54aqL7NW3kcTidw7C390sq1tj67P/tKREHfk3qz4ccqPQWO5PKTomrBzm8mwYjTK/9fcVj20/2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjCTSO0H; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjCTSO0H"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a9ad623098so10067561fa.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2026 08:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473214; x=1792078014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuN2FUV+hXuI8JXFao7iDoOeEPUnSJxDqogYBlALZhU=;
        b=NjCTSO0HOOA6Gd5dqDjGBptCSY5qXkRhktZoINlmzpm+nevggQ1tfaXiRF3pi/kXJS
         mVF37Ds+plNxTcgVD2KH2hSGkFjVRaAAcVzJLKZzbI+34Q0EwSYy44kO0bjW0thgwOrD
         40sW5COIM3wMiASyDRcT4hlfmIQ6N+wWc18MGiABMkg/+lFrul77K90wW8piiSj0YJ5o
         rwlQfFqZIWBX7RMYLNtZ9cnZcd076tz4EL8xvhEpH3BNbPwOEgzaj7E2dxNJNiIVw4Ww
         Dxb08PYmOKanuAEEohhpaVQjK4FMT34jgPBYyfRb07gVPZh4+vzX3UvW4ZDcuJX35uoL
         e4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473214; x=1792078014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuN2FUV+hXuI8JXFao7iDoOeEPUnSJxDqogYBlALZhU=;
        b=RJrE5W7zxpv7lJvduQIOPj+XKbH6xfY5dXIgQOLKFU/uYyIFVBKyvEl7z7Wt7PPbpu
         6tGj6LUBbjAHDPLwDo1WF7kx3DF/hwtjL2oXtZKHqis0UuhNyVpVD1oYze75mR/s0K6A
         ljUovGtm6x2uBopWsONdGusytxeMJQObZc+p61OTV9dBI1BQtY7t1Zuq4gC5q84eX+gG
         3cJQmI3QYeSX8Qxolz5JFwu3wB3YN5Rrx8iQttx/jrG3B+owj3cmNBZinLUd5v9ejNOp
         FAV64V8ZPl8AbR+iiaaYzr/9vmRBZ++Z2wx27H8I1y1ULsSEWcxumC1aQ2za2wWh7ptG
         96bg==
X-Forwarded-Encrypted: i=1; AKwUvBzLHttRUBv/Pch78oBys11oLaM4P/iO+pyrG2ISU5rogvX27y1L25hBqbFby/2Q6+tQDGUXbpwy43BYPMSutrFBYzqR@vger.kernel.org
X-Gm-Message-State: AFq9FYL/hptpT5xCrqEYau+Svn07tvwUbqBXVpyBbDQ2d9vcJOF3muv8
	N4I1yz7bxKDfljoAoIfQxXSf2HX3L1/pfm/7iiN00dAmbmuYcoYSAGZ1
X-Gm-Gg: AYBFou07xluuUoLL4sJRXlDb4JVxYCNzLU55yXj5OCHEnYnJxv0xkDYmkiVjf9vtlI2
	eNsmZAs1BLKgZI4gCjrT7rI5LAY+tDlqZ6Qckcbkin5mALtMoRDkjGOCDMcX40o0m2S5/XS3OSZ
	7dohNk0dQ2q1Xl/Wvge2qBi6fSHYzeU69NjIaIlN1KASQujaQBvrikEju9JSJ3iBDNUetHRluPX
	PcIYxrGhgE8rBArw5dp2ne45npHK6bICVYJlc869Dxbn+gHSgBZFJ4K3tryGL4xZjqa85VB43Ho
	aUCCrr9BQz5EO3z2OCq2tLVyp89xIQjWj1RQdrKmzM/9KVBGlvRX6i8AIXynVhaMI7EeC3MdeZg
	XcQ1lxaS5cfPJbQTWt06bNmbZIeWKaXi/b9Z6KITEg/5IMaEgeSITTzkwPTBBi9XNgbRKp9VxzY
	OR+0MbzLhqJLcpX6tzkpmJ1Q9wgjFKxyEuyBjZnEGrKbF4J850sgoRhBnpXClwpfgiNvqk0oZII
	K/6jN2Hjjgs0dLeV38a2i9cshJTxGp/WmpnqZuvKSzzXtNoN9eDpDwYAUfKRqsRpaiWkNyBsQ0I
	lL4=
X-Received: by 2002:a2e:a594:0:b0:3a9:9a60:2c47 with SMTP id 38308e7fff4ca-3a9a2d60187mr12725961fa.29.1791473214215;
        Thu, 08 Oct 2026 08:26:54 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c141fe4esm159991fa.26.2026.10.08.08.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:26:53 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: Mingyou Chen <qby140326@gmail.com>
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	ilya.gladyshev@linux.dev,
	kento@kekto.ru,
	platform-driver-x86@vger.kernel.org,
	ericted8810@gmail.com,
	W_Armin@gmx.de,
	linux-kernel@vger.kernel.org,
	chris@miget.com,
	matias.civadda2342001@gmail.com,
	btx342@gmail.com,
	wleizc7319@gmail.com,
	wolf109909@outlook.com,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	bozhenpeng93@gmail.com,
	nika@nikableh.moe
Subject: Re: [PATCH v9 3/5] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Thu,  8 Oct 2026 18:26:51 +0300
Message-ID: <20261008152651.1510220-1-uselessfire@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001133705.69244-4-qby140326@gmail.com>
References: <20261001133705.69244-1-qby140326@gmail.com> <20261001133705.69244-4-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mingyou,

> - 0x00002101 (Fn-lock disabled state)
> - 0x00012101 (Fn-lock enabled state)

These are mic mute states, not Fn Lock ones. On the Redmi Book Pro 16
2024 (TM2309), EV20 puts the new mic state from the EC field MIUT into
the third byte, 0 for muted and 1 for unmuted, and Nika's report [1]
has 0x00002101 as muted and 0x00012101 as unmuted. In a test of v9 on
this machine, F4 gave KEY_MICMUTE with exactly these two payloads, so
the entries are right for these Xiaomi machines; only the commit
message needs the change.

> +	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
> +	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },

Note that 0x21 is WMI_EVENT_WIN_KEY_LOCK in this driver's own enum.
Does your machine send 0x00002101 / 0x00012101 for the Win key lock? If
so, it would now report KEY_MICMUTE there.

[1] https://lore.kernel.org/all/20260531123345.237521-1-nika@nikableh.moe/

Thanks,
Anton Karasev
