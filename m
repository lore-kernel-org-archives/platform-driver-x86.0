Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284789;
	b=JvJW4v87PVrfg7COiQiICEcoGfZvlKAXgKA8zr7pKcKjVDRvPFphf3j6f1g5wbpX/iOa
	 njHopFr2jlEW5KBPCWxx8MD9nhu9lgFTfCuIBI/BFwF0R20OpDof4efF/0GW4sF7W/0mP
	 oOifLDeRFWFnOngTSC+s9ihXn+3o7J3f3Ive6WvqXhO8mkI4gsUhN4tTd4DUa0Pz0srs0
	 dEGdWKF1KAUEs+n6g61pwcZQdFyCDnss+SADZDpiQORvE0B363BiTUBBj3kMKySsm7bfm
	 U41KuMsRti6piNLHv4LC5nmtv8KqBcFjdDfcDmLuih3Jb6LcWmviJ2yaqsvV4I1r8Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
	b=g2QGeCzBb89CTjq19K9xM8Rsu3QbkwBTHi+YbESCCdos+CcQ1qzUSI8DRX4apgWMseS+
	 H49Pscg0XGvDeLs/bE9gC4+yWolPI4wNluGBzEpEAWFdTmHfnIHEBpXaVthF975uxTBTn
	 WyAsV6E0stDFfK/x58mUi0488ilwSQpXrwfrkwbNKqraTX4GfIl+vYFr5w892w7BX6bG4
	 m9lduNLgA7HcI57Xy7OYtC96DWPu1vET5dLdRBTV9DiB6m94NoV4iNK1cRtILOxEaOqAt
	 ulHn5V2ehVx+Ig4bjHhb/iyQBU6/w+2mx9pyHjZhVpNf2WTGVpAczKa8NDI+c7sUu6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPTlg3YK;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F892606A326
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 14:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F892606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPTlg3YK
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-14fc585291cso1992566c88.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284788; x=1793889588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=fPTlg3YKi8LCEYl7MWaRXbl+fOsMT8EooFaEX/qteZRl8FsZt88RyX9Nz4rh62atDU
         N2mi9nkHHOJC4qFeiUXhTHbjbhHQHXOF+NhhfCQK6iUf4J/Q9ypFok7z2wgCKAPn6EjK
         xZ9kY5ZnP4n+8lX6/VsHr77Tn99+eesUK7yOJOQntEtEMQGRE1D1vlqqCLeQI7lI9/6d
         T6b6GWLz4O6TATQ+xATuCOZzKNxV75JOEocPZj36+KoGY18UuoHpbDZjja7BkGHZcM0B
         8XE+KTQjlqXnRe4OF7u9IeoFkO5y9EWni2EDctTAKHudHO9Rp8OhbT05Vxxf/IOtY+cj
         QvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284788; x=1793889588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=QKpUMgALVJH6i2LFPi+B+V7UhGy2edL8QMSbEjbCChXHJrEJg4g8DhvdMecCU6RujF
         Qapx8otel9bZOJXETrIo6GmTZ2E1C+jADrwtpwll7ZejsHvwV4hpn5kix5ba3XqaBV5J
         TV4Pqo307jnVgmhTsCpLvX/ZvTAwLhODckiMEjusKHvHbbpegFuxMjmBB5tCCFaT2r7Y
         7acmy/XyeVf4qT5r71g2NtY8VtEGxuINupe5msw74t0A8V7VUch5wBkSY6EQzbMa0zM/
         qOQtmov/8GeDsIfk+dcX+RpVHGR44uwl/MqEHlwCtCmoA9yoKbqtTo8sEqyXYLi7T0Nr
         8d+g==
X-Forwarded-Encrypted: i=1; AKwUvBx57jwbV/yRJVM3baGKnvtyo+ZnBaIDqD7rxMSVPF5Nt2B80PhWeuM2jyoDOO2Y9Fd9v7yOq8HBc40eyQbpUhHlbmVB@vger.kernel.org
X-Gm-Message-State: AFq9FYKwEnSSqL4rQfJ3RTk92f+fkmn5i8Ty97q/SsL6zH8ZvbeJWcle
	nLkP+DKQU8XMyI7aSMlKlnFR20i2BFPiOV2Rthe8PclXIX96oln3PEE=
X-Gm-Gg: AYBFou22tgxLvwq2d6dju3rRTpxy2qvQmzFOrF6LpXRU3mnLvUNtZM07YoTir5o81Yi
	OxuUIxYqWhxkS9TznHFp26VJsX5KUjLxUQNaavdYxk9XReOC3s/9krKrCibylekSqwl3uKnaBKM
	23wSx9MU5rWksz4z6JwGMolTwIdt9Bqbnz9+KrXA5cwsBSYud+dJlbPJQ6Rsjx8MjYFw28qb4gE
	oMIngdw/Xe/ZNt/qPilEi1PXxmKj4V+7b19vsSnNnuWzdfhSmNiFyzZn3ZQcUlLpetwIJZdQCLb
	Us/1WTom0ekvDzGx6pA/Mkk5RqRzQK8iirqbndkLbOOUKZmqOuB8dZFLG8fF47XNU3o/uxa0yGo
	OfrpdqBhqhpHF1oexTbjxAdao2xJ9hv9w66uJO8yGubJyCtpRzDMBpwsIxfjzb6FekgBsigU4vZ
	ZvcZ6hUq+fnYnhtMD/mjCWpoEJirY/alrsjTiQjmFF1WR5AebdyGnWgJgO9MDN3+yvhwt3aW750
	jITqPt+gEPU9lQ+4tDmEsmgrN+uKVMMbNNe7i76+le8pLAxS1s8/LEuJHuFHkESQn7NOGxy5DPF
	smmbqN0g7Zf10icXYZx22ThvP9xPTZZA4ZhY3zKSynjmhe2mw0PzQsI5JpOqt9qUuRc=
X-Received: by 2002:a05:7022:ed07:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1a6ced8e7afmr7393000c88.29.1793284788293;
        Thu, 29 Oct 2026 07:39:48 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.115.216])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75cdd21c3sm15396439c88.4.2026.10.29.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:39:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: k@chaosmail.tech
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jic23@kernel.org,
	jmorris@namei.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Thu, 29 Oct 2026 10:39:26 -0400
Message-ID: <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
References: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
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

> This should either be dropped from the series, or be hidden behind a
> `melt_my_mac`-style module flag, or switched to a whitelist approach.
> We do not know what keys will be introduced in new smc firmware
> versions, and there are already keys that should not be randomly poked
> at.

1. The patch is required, atleast on intel macs, as without writing GPU and CPU
	states to smc, the system gives PROCHOT signal under small load
	, and heats up a lot.

2. the smc dosent expose keys of nature that can physically damage the system
	it only exposes power/volt data, and the most you can poke is reboot
	keys and gpu/cpu p-states.

3. If a person is randomly touching keys, Its their problem and not ours.

4. There are a lot of things that can mess the system way more and permanently
	than smc (undervolting for example), but they are not safe guarded, why
	should this be then?
