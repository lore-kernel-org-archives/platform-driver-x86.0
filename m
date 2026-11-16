Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849125;
	b=QjIQDA57Uw6gjJ81Mgm+OhCOfLzXhywzVtXZ/XsP/1OO4Oo2Ho5kP10n+jcJ4FqYgphW
	 B9L3EH6WEub0FtZPXfTUBZGVQbAIcbyNYGH26ZSduudlj/T1MjBfRPZxheQEmo4ctGTmD
	 kcs7TQui8N1xHbonJzFEZzcucdHK+DhvR3FRUxrEq3ncSkPrq9ymKUwpl7ne+LYcJHVRB
	 nQcxRaLqVuQUVncxlRwFeTBXW68VbZlrQKhBVN1hv5E9EU+j8sXElNzcrALHTN+G6LScD
	 uFX7ZXUKtI6sEJdKFibdCxu2tfZd4pt5Gi6n+CUGCianXgx7hydbS6msVtAPGXE5vrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vR4KfclXf/MksyiSXjSnNtmzfaMI4MQnwqin6ectd0=;
	b=2XdQIHL3EaBRYuHv16y5nJzG5/uZPLwZjII1WqN1s39Cp4Bp30Jxl505yIHGDt8hM9nL
	 P9646L7lKo2MYhlKrJi1Xahz1+4b2ifWSoDq6LiFJC3tGS82eqbzCyHsRG4FNue10lR5D
	 EO+uk5QbvqrablbHwozTHvWjVMEBg5CjrsuQITnT8bmmoOq29aSmH/gMyLGY5t0TuABa4
	 wVrTGOoO4bAoTRyDKj6HdD/G717aiVBK5j7gwoHAGdTFXxo32SEUN8R4BI3aWXeVqTpuq
	 t1ZlXBlRJhC9VBqh5bEpOjUOemxJ4RjrphWZPLQ/ODu3uyeL1yjMjhjAUHdps7rEx7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TlkUUbd/";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B6A606A322
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 17:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B6A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlkUUbd/
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3581091c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 09:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849124; x=1795453924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vR4KfclXf/MksyiSXjSnNtmzfaMI4MQnwqin6ectd0=;
        b=TlkUUbd/UUd8L7T+3ZF8nI2o08TzXT3DHk3PiFXiZLf7FtdtG2TyxlKY543CMZ3/sY
         yyqHXXY5hldAPcZ2F4AekvZEsNP4rSj9x7l1Ip8nr4VbJtwpVOMsl/7wxq48C1KXeyPX
         9HA5pPBWxgGhj25RVo6ZTLXy4EpkXonrf8P4kRNdfi6t7Q6yw53KLNFQutWz8KZ1qiK2
         rEY0TMXhCPqeeZja+o1loWSocqUNGBxMqAv/DEYWtPZD7ImnqZAecO4jpqIxdl4yUPnf
         cJnWf55Re4qXprVuXXruGn9oRLJLx5WGJMB/Ulje5pShH99jnKmdPzfIeZi84lAF1y1B
         JXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849124; x=1795453924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vR4KfclXf/MksyiSXjSnNtmzfaMI4MQnwqin6ectd0=;
        b=KrCGR/tx1LWpuR5P/7FhAO+26KBvr66vrL71EiAsll1i4SOionuh34+HR7v1f76B+p
         Y4X9HjGw4v3qskJI3rzVJfxCgwUKLXOrQEFKrFBLUJcntTvxdH+x94nmfBmJo/ews8F4
         /2yPz3MalVd/d4XBvnuq+1nkZwR+J20itxkWTo/v76XhL+BDE1KY0GNO5NOZ28oUTaf1
         TQpaFhG6D11WdwSjV2UVCPmSrTlk+j2kFA1TDdfArc9SUiZDF7I2mg40Jd0R7IIKS1rz
         lmthK11z2pQKz6Hm0uNZGiYUlL9mIwG3bzykiDUvTCMqt1vgrLwvJNhh3gq6qoEMgOCV
         4mGg==
X-Forwarded-Encrypted: i=1; AL+hErEHGEpBcUWklpLzIKTU048JzMtlXkKFX3/h9lCiTasf3UUG9LK3jdvVBlw792E/0LP/rdwXHozv7g84hYlcocZPXvOZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8HZpA3OiP75VdK6ilNJQ3+vonh6E7Z2TkdHoWC5rOOvRRQIemC
	00VfewCaKZ3XOA7IF7UBrOUe6b5PTDkIkcM1EYTo07ijAPkJkieVnc3E9eaILpDH2GE=
X-Gm-Gg: AYBFou2/nPQel2/IsMxND/5wDnviD1C045hFQWaAy2Pky1dYixS6MZOOAxa4FXNrOJv
	DfFCpumkuG5bmSWa+Qu2PVWwRFK/TjZwhVIBmfMakJJK6J6TofWI52Ptmcz5m8t9wT3K2sMStpy
	rwhjbTSNsOnS4c5shAapSCycWdCDSs8CD5tj4NGOxvT7+Fz72D/vxdZY19dJCQqPNn/gSOBtvS3
	ws8LbZLsHD3F/ikdnO6iu+slTw5lQVHHZjF2WFrnOjwRhiVuRD0TWHNZGoTGB8XO8tRdR80HJMj
	pblv2cri9z36KdN02HWDHZUIPF1qyFn3HKobAXlebJ6cnk4t3NIOAjGTSayYL0Pfv/KLSS+jae/
	+61hm1Czcyo3UPdTWrJ9XReVjHS3ztQZyVTDuRR8XXtuhp5REEmE8WwOOObabTv7yQVt30+DIt1
	YbbHFH2Fl9ISWN0QaxPJBbOGdkU4U/WRzbxK8VfGHrX3K62OQoa5HuzcWoWh6EcA/mmud10SleS
	UC+8XXA+HDM6HrXciO6eTeXPawZLvs+r53Bx3TQJSMoeLweHwmG67iUK4LcV3WTOxlW7eP1EoVp
	C+0egaEYV4IjzVGj5uECvK9aqCRg7ubk5ZHEQGzh78AZjwwc6pQxW2TCVyynmkkOUSKW80ePQjV
	tn3Fb/L+P8C0ZWkoUkBhNPeEPJv+08A03siNNshCYcuq9d559fpaODdMVpUjgVeCVKbJbRQb/e4
	RGH6Nvj7XobvIBvU1RjANMilGHjAo+/B62Nke6JPusPg==
X-Received: by 2002:a05:701b:465f:20b0:1b5:281e:1702 with SMTP id a92af1059eb24-1b5281e1b1cmr4125651c88.41.1794849123703;
        Mon, 16 Nov 2026 09:12:03 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm27976466c88.10.2026.11.16.09.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:12:03 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/x86/intel-uncore-freq: Fix error handling
Date: Mon, 16 Nov 2026 22:41:57 +0530
Message-ID: <20261116171158.19754-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115014948.2517688-1-srinivas.pandruvada@linux.intel.com>
References: <20261115014948.2517688-1-srinivas.pandruvada@linux.intel.com>
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

On Sat, Nov 14, 2026 at 05:49:46PM -0800, Srinivas Pandruvada wrote:
> While reviewing the driver code with AI models, identified a few corner
> cases during the device probe and removal paths where error handling and
> resource cleanup were insufficient or improperly ordered.

Tested the series on a Tiger Lake laptop (Lenovo V14 G2 ITL), which uses
the MSR based driver, so the TPMI hunk of 1/2 is not covered:

- max_freq_khz write to min_freq_khz and back
- 50 rounds of rmmod/insmod of intel-uncore-frequency while two loops
  kept reading the package_00_die_00 attributes
- offlining all CPUs but CPU0 and bringing them back; the entry stayed
  and current_freq_khz still read through CPU0

No hangs and nothing in dmesg.

Tested-by: Arnav Kapoor <kapoorarnav43@gmail.com>

Thanks,
Arnav
