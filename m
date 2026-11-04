Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822018;
	b=Xm8jExq5dVeGu5M22i31+7U7GnqqGFqw8OOZPD+oTbzHRQbHlOk5tsAXQRFvvivRb1Gl
	 0xEGQNnuKKTdh9hrq+BxxTAsZM7QBVzowg2UvKt1k8k8oJYEusdX/xkD3Rf9NBhml3+U7
	 mokjxWlAp+NwrE9PbpNE6Ji1VrrDu1VvpM/RJY7hwzXWUo3QcnYPXSDc2dVXOSXI95H/J
	 e0ARSjGaSg0Pgnnrdc4AHPQz99dPoLNhlip6q3f/rZ5l07jJN6G1SNr6gsE06hYxgYgKb
	 BMINerlpzu4cCNaAU8eV0VAUsKwhjCcCrs5FDq1ukEbleetzhjmvUrTIe/sOmDYva8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
	b=YSNRzfgrKzkMX1fWFN92oq2KN3k12yRE/6dJzeaTtPkHrdLRRrJowPm3UajKH6bkEykT
	 fkhSTi9G9aSiyIS2QXhXBYDAeyurTY63kAXpyULGlJb9QbvftEGIbQy7QpoTwQlaga7Qu
	 D/yQJZZqv/Mboxdi5oXJaTugtLsLankQCNgpMUoEhQiGBTD9k/jUlQms4nd0x2MueyUiI
	 3KIQTVTeVo1S8Grgtzho7alg5J36l3K2wPmYXRsq0b2UVdElQ8htFZ/Oy+MyTPc5ubOzA
	 KHA6skefLqH7FYYd+loMVKJAkXZ5AMM0GPNlK/yH3Fl2m6bJBSUBocR+Ol0vXRKqmHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snwKVTUy;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15E56096BE9
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2026 19:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15E56096BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snwKVTUy
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so1943075c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Nov 2026 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822017; x=1794426817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=snwKVTUy9LvBIeZYEhCXzEnRQp2wodIFGKY4wUJ7ztWzLVbTd1bI4nr3mGXqrQXFPO
         83/HtfEisb8NH+6TKxRanc+LHldo4EqJ43kuJQJyWdqbEb2qaKJ6REpFD/Jt5EslTB+S
         zscnal0Mvh+NX91kiP+siOH9v7tqEITC6j8TarPFAWvrj5zWcfX48CLTn8neQnUjk0aG
         DdWT6beozrR7hgNmLfQYYUBVHi+K7i2h0gb1c9TLmiQO015gt7sDVMBLhaHB5Rgu8J3E
         vDvOsMZkyxTj1DF9F5rnA3mHVh2Jx0j8rAylzbJGVo40aem9854GCIhJgMsA/lSZgxl8
         K73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822017; x=1794426817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=tNf9OLZcbnkE7fY3BckmUJ5pp6J7htbMhUgKdsIRl6fL7CemGCQpSWnpLdwI/78cks
         etTxXALS9RnGw8ztdvSHip5T2+WD1s/+GlNto6pJpOnSsh8sbRoiPScjN2lTKewc/xR5
         VyOfIl5YvJaxVmTIN320ghz70VkfdAuirHZbTaSyX7Gt/XUxvP0qyXHfPKTQrVB3Sqzw
         a4U5YTbwGmzt776TQuhH56h5+Sv8VJN7sCT+KsGnHrl6mERvEwJxKbW/wpe3eMh/9fSl
         zsBJhr2uU7B1WHxTQNgUrpvpVjM+uhr9SxPFBe+xCSE+tXrxeMcE+uT455t7/bi66LEW
         pJ6Q==
X-Forwarded-Encrypted: i=1; AKwUvByQr9o/Sfxk9RMSljMVAMMRmMe/4TDtIMU3cJUxFBYIlaJt+fLF6wfqTK2VsAfn35i9bGU4ydcOMSM0oWm/DwKptl1T@vger.kernel.org
X-Gm-Message-State: APuU4Z8gLNBDjpPSderoE9hglXnnezzaMhxoDQU0RzOppYVkeKeqWaaw
	qXVlWjfAsGpA6beVOPqf+kY3U+dY1NyL1Mrw4JbGv1Nf1lMBWEeo8mk=
X-Gm-Gg: AYBFou3Y2bwZc+rC8SiaLQhMgCzmCXXmduR3OzAGg8y3Cy9u34G5ba4vVyRM499pFQR
	G4VR9rhoiSVci2TJrZVBse87hzIWsfp9LqLirj8fCPgTpZBfP6kgmY0sAKqBK3VcV1F8rWjoubL
	wyrYjkKqdW/7vzB7zHbbj0Y5cAke0SXb/9mij/+Iew4x3LQ3XpOc6pNU2ygPLVbV0iBzSQyUxC2
	nDkhB1ky64CFfHgEchho3IR3lZbTVIyGV8y64Nqa9tWjwk1BmY6iOWOrjgjrrSZrwdqZlxfNU2U
	vDWL1vmKt7fYpIwaPmhslk6n2Tb55ykPK7v/kVQuyU8yx3cxadV0nle7sxgImnZfp+KcUtOWcR2
	AO7rP+pK5MUYQ0gKjaPSH8ggfOkVLRVAzt44cLEkZiKZQ0dXRsoiUPRqyITnAuSS0OcLXLJO0zW
	J6KtWQuZhEOQ2qOb6pieqlTwez9ULvPeNbkoAKDDHSSNeOkrHyu1zQzRE3awThjG8mziIvIQzir
	ROzRDLApos65uZAB1JlZdBdgYUBi91f+aixJUm50PE/cRztMpeSIe1DF0PWVBrQ1Ia6/1Ez8Q8i
	oh2ki+rrid8l3OKxfcuJw78j2RvBhySLQZA6AqFUI5j4wuQliVsJq5XjQsLU18bH
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr26455364c88.26.1793822016817;
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm9239684c88.11.2026.11.04.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jic23@kernel.org
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
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-security-module@vger.kernel.org,
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
Subject: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Wed,  4 Nov 2026 14:53:17 -0500
Message-ID: <20261104195317.8284-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101013817.22d67ea7@jic23-hlaptop>
References: <20261101013817.22d67ea7@jic23-hlaptop>
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

> If this isn't matching some legacy interface, then we need more
> on what these do.  Maybe they are suited to some other kernel
> interface? In particular they might need the various controls
> on how destructive they are that something like fwctl brings.
> 
> Generally an arbitrary opaque path to firmware isn't a good idea...
> 
> Jonathan

Here its required, if we write CPU/GPU Pstates and PPT to
some keys (MSTS MSPC HE0N), we can reduce the temp by 10C
And We can fix the dreaded PROCHOT signals on macs, Giving
Same temps as macOS.

But you and Sasha are right, that exposing all keys is a
bad idea, so i have restricted writing to some keys only.
