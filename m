Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362177;
	b=AcaEqW+BWFgfzuSURR5YC9DkqxdcR+PRI438yjpGSDkN/bzVo4R3ZXShU0zKIh274T7J
	 8wI6J7KI/hrwcQKwZOKBGT9rlx6a2kh5GqNLZgW+R9TDji+A18eSsGd2Q++dANet2Z7dS
	 vEhZ78mPqsl4Zxirf2cLeMKtBLa16hcIqi2lSxAI8noNai1bdXHiutrZDzDQ4Z8vIZBOx
	 uedHGRKJt1H5vyvyCcjHesdD11QVFNML13Qf1gzj9A58BMBjxvcNg7sF30Y57fMouZrPp
	 cbh9WyNJSjW7bs5zuFiYeGhKVVW10qZjFQvI1w8K5bq7pxaG4t4nIhmlCWwFtj+QBFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DkkGwXP7adzSpFnXcJo7Cwb260lvST+7aTixUCxpTqM=;
	b=zRGpWfi9KMb2biEcNk+3P9bwEm5863CGzfiLg8/heXElebMRtsJ3LNrXjgiktguyP9gw
	 pQeEJMbbxxuD4/e8rKupmPK9N2dwRszKq2UI39sQNpgLz6uK71xBRoxN74lzpzEh08X/x
	 KJ/65oivos3MSOWyYK62QMXM4j6+FhfXXrTn0B71Hubmghz48jX+QvANq1OMYUhjvwnGp
	 ON3acTRZ/TRPVhaNutbfVm3+i2HmVN8pV4EDxmc8iKMJItHMFvo0zTNs4RFuCq1fSovGu
	 XJ6Kjel6BPj++4/AppBPApv9qJeWO8CKxB9TN71PVbVwG8R9UeOgw5gbd9lrjoPcdfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3cs0g+K;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB330606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 15:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB330606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3cs0g+K
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so26284505e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 07:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795362175; x=1795966975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkkGwXP7adzSpFnXcJo7Cwb260lvST+7aTixUCxpTqM=;
        b=S3cs0g+Kpf36VQPKpsnm8trSpkez5JoSDpj1H55Dkf/UvL7v2bhJwTHy+dTr5wOIeP
         Zb8Orc0cwvxanHsz/uJp+51YaqymesjBNq+6Yzjg7VYujhpb4mLPgRx7nZugi8TcFe6V
         QBLl7ZwLj8vS1VfAdxRvnDFDu0KRTZ7Dv58ZwXfAVPnv78xmKpguQbLfrYLCuA3LYeJg
         UOqQ0TW8jIjHIo6sZwYwZT/QrnTLobhqqsp0QTtQUdBDtHMFMjVsp68BtXIXTRF8DLlh
         eEY++aZGNqZcFcDDjX0YOxxHtALgUhDfAJabnGFfA2KtQ51mvQ8sNCcYTkUbbjTdLP1L
         W9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362175; x=1795966975;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkkGwXP7adzSpFnXcJo7Cwb260lvST+7aTixUCxpTqM=;
        b=gsGTGHg8hVXX5RpuT4kSq9tPpPiZy0IeZwNnzWCufVf3RjrgNaSqzUQ+BQ7DaZUmJ5
         eWpKA3xHCzqvtb+dRc6m3JlY/nTlMJMTDHhffUnSrjLDlDjexI4zWl9w1F/IYL9pFwEY
         re1JeH+8bqPE+XLWP8yTbYciD831BS0RF0HWusz9Tcp9TYBDA8y4NxvzvV8WQFODiHY8
         MOCLcUAJnfAeMk+skXUQgEoy3BRlldMrBWDuQotD1bq+j3e43+0xPVO7XUCN35diIrWc
         4DvwrWeRpcF+DvJR3ysifuSQKwqe3GXKikStD2MZPoH73kkxBhm3zN/JWhtmgY4n1V1q
         6UBg==
X-Forwarded-Encrypted: i=1; AL+hErFyz7UluauhgI8VYg49oNC/5bhgJM3840e2dtrQoYG2YwOmh5jCWd0no2JB7gJUxESF+LpJrWak21G8bfk0li6SwsGh@vger.kernel.org
X-Gm-Message-State: APuU4Z9T6t/AqFdODrKDghOWdQDBhJoxQ0T8fqLercn7C4DmOW9/y3zJ
	8EPlq5Rup7UvqBk5BxbME4mimOcQO67oJnNhalZgaf3ASSaUTEkoMFMR
X-Gm-Gg: AZFdTZeOtwGASL7cr9CuZIY806/Q1fUTWDts302KmuyiJmCrsiZuVbby+arHj8xoAKj
	oTEAG5n/I1HdYjDfACggUZz3bp4jbfs1M87QdOpqijnT04Ckolevs0PchoSIOAuFGGRNPDn2M02
	K6wf8n6C0YjlqHwPigEmQ8jcU4Yej3SCSOv34mc4NKQYQmrAkWP5H7JaJAyl7G94Y03NmcXbJXL
	HF1wI/PEAGlz75rPTdCt7ja2Sj5XhqJUfjmfk+yEfFk6YaL/b6EyITO5wHEPBE2EVw22wSbzjNZ
	7+ZjWXfivB3fdTDXxxYFojBGk2kUTeZjKNVdP943N0rt0mr5lYT1VtP33KdoSGhj6KCWDoNSEBc
	bIOM8ZvRx+JBsRgIzfSJmcWG43+M3A33bnqJ4ElkkpXRtlJtmwu5Q3t6QGuXUPokvrwxpZKuQew
	77c2KmlinU/vB72wuGHnv3unyEo6lY+lDJV0u5lYW7lzBtcaM4E26K7On1t7avTV5fr46PbWvNl
	/3u9khcYPTSmBAG9jnUCKKhFcFmBTsmMRkK1Kqr0SNB70lJceRxMsYQADyS+BqFIsdxW7KVCGu/
	XkKQzgMXmF3UUfL+vgo5Ke7isVUtY3MbgGfAUP1LrUMqfAILDDcF7Ro06kYJBmswHeqz
X-Received: by 2002:a05:600c:4585:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb8881b8e4mr192951475e9.17.1795362174863;
        Sun, 22 Nov 2026 07:42:54 -0800 (PST)
Received: from Zbook (178.115.144.251.wireless.dyn.drei.com. [178.115.144.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm278469065e9.5.2026.11.22.07.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:42:54 -0800 (PST)
From: =?UTF-8?q?Hasan-H=C3=BCseyin=20Kayisci?= <kayiscihasan@gmail.com>
To: kayiscihasan@gmail.com,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/2] platform/x86: hp-wmi: Fan support for HP ZBook Studio G8
Date: Sun, 22 Nov 2026 16:42:23 +0100
Message-ID: <20261122154225.61211-1-kayiscihasan@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the HP ZBook Studio G8 (board 8873), hp-wmi registers a hwmon device
that shows no fan speeds and has a pwm1_enable attribute that rejects
every value, because the board lacks the gaming notebook fan WMI
commands.

Patch 1 reads fan RPM through the thermal status WMI query (0x28), which
this firmware implements in its GTMS method.

Patch 2 makes pwm1_enable 0 (full speed) and 2 (automatic) work by
writing the EC fan mode register the DPTF IETM.IMOK method uses.

Manual PWM control isn't possible on this board. The EC ignores host
writes to its fan target registers, both directly and through the
thermal status write path (SetThermalStatus, 0x28 write).

Other ZBook and EliteBook models probably share this firmware interface
(the same GTMS/STMM methods appear in their DSDTs), but I only have this
machine, so the support is limited to board 8873 by DMI.

Testing: built with W=1 and tested on the ZBook Studio G8, BIOS
T92 01.25.00, running 7.3.4. The out-of-tree build used this file from
for-next with devm_kzalloc_obj() replaced by devm_kzalloc(), which 7.3
lacks. It hasn't been built inside a full for-next tree.

Tool use: an AI coding assistant (Claude Opus 5.5, via Claude Code)
did most of this work in one interactive session from the prompt "try
getting proper fan control through linux working on this HP ZBook Studio
G8", followed by "do the hp-wmi rework". It disassembled the DSDT,
probed the EC and WMI interfaces, wrote the code and drafted the
changelogs. I reviewed the result, tested it on my machine and take
responsibility for it.

Hasan-Hüseyin Kayisci (2):
  platform/x86: hp-wmi: Add fan speed readout for ZBook Studio G8
  platform/x86: hp-wmi: Support max fan mode on ZBook Studio G8

 drivers/platform/x86/hp/hp-wmi.c | 126 +++++++++++++++++++++++++++----
 1 file changed, 112 insertions(+), 14 deletions(-)


base-commit: 9c82959c37bf69c2ace8a0f975cf2129ec1fd982
-- 
2.56.1

