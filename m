Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821554;
	b=3/5dhflgKtxXhyYdpowRA4Mdmbkfuj0rsu5iKZIzHreg8m/CwjM+gZt/ODBBlAb3AJo7
	 BhAJZZwtzT1LUjvLGV2XnVad+bhKX3u1t+gsj5YcyOChzDN1N0V82X7o3ZrjgkCAeUOEE
	 lUTjzjl626EUP8LUfBPPWMx39P2TotgpnW71viEHohMll7CiipngRVNGFYeS7cPmoN1rb
	 jiv6rn/rVtDC2B6hGSkfjeNdkqtLzTz39gk+mG23+/KnXrJlqDgxqZOP4gbDY6/3IisLQ
	 U/rKBvx92tFIYzkW0cJDvo8k41PESrBiVrBsLi4T/5FRnm/KynP1i/k8SslFkzRnOQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
	b=DbU6Tx/LkG0g7x2TTKyp5XBfAmUQkkbuudLtwSRuH+TA6kr5A0jqKQJPlj0nSuhnJJti
	 wC8Ws1dGkmYPplipJYmJ5F6+DE915xJU2BxLpk9QObC/0Ra9PavayH29/zIS4+lo71Tu2
	 srrDsc/jMvs+x30rjvZksIQfv/J1a+PPlsQlRBj8/eNRpSRnAWcJDD2wF/ZTNibi2BWVC
	 zn85+a94Kb7UknLdKenVuWYAT3CYJR+OtbB/fCpstamBggBXD08pcFJA2kqz/tY+jquQp
	 UNMKBu0avcYM7eq2LpP5nApEYckeq+MJfK28lAJYq7Ncwz6sySyln4GJskOcLj4gH6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhgChsRR;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4556070ABD
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2026 19:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E4556070ABD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhgChsRR
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1adbf62dd31so1554455c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Nov 2026 11:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821553; x=1794426353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=PhgChsRRxoaFlSlkRP6+eJT4KYEi14DqTMP0leDLu81FxLUk2LAC65QwDPBooqvAsn
         iH6XkP8S1MK/SwZxO3AJkItw8VOGPpqeDmiiYKv7myO0lnlZgnop7KC9K2NAgM6ukplu
         Gjsdpkx1k0Dhr49FqliSxtq+PV7zOW1rF8RqXf/q22186XabS9LOxL3XW958WfiYw+PV
         JBjD6srBvq+hK2XBFDtCmpOIf+gS9iJ5nhxA+IIgHZhp3x3Dcb+TLxzecX64kH4ggJZ8
         fI8gag+0WQBADwjfb6rFBnw2H4YR37v7+5aiBzykie/3yy5MmRaIYgT31jdFJ3lzFtA6
         N3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821553; x=1794426353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=RVCzeC2fh+ANXlK42CeznP218UrRSWWCcbxtHacnOVkvM0t9OaBUWMlV/aBdHCPYi+
         3dnX3BskgYST6zyX8lhYIBA6mGErmpUcLHWUvL38GVJhroJWsSt81GyA9+fhj3xqBi/H
         b8xkIhsONrCMqF0ivOKG0Nsy0Cr9C+zC/YTuIYRcTh5Nn4FXKZh5EWrPlDXwWVifVVFS
         ZyLJc/FFbvClRrq/Ycas1VIKRgHZ4tPWuc8DUvtHtMcRmP2zKTM+h6JWJx4pxk1t2+1a
         NTomXPODawV2GhxE2kxNFEUUlJ6GOe6q68/TOBxelBM4EY69Ci4K3WuksGjW4K2GgdOR
         y9/A==
X-Forwarded-Encrypted: i=1; AKwUvBxWy/V5yFKQXg5kPLlTFyJlK3jhw8d/jx390IjyczYu9eXC7PMa5GXZO+t7j1lmbofY4UFCknyxBdl3CDdXuVLVSw14@vger.kernel.org
X-Gm-Message-State: APuU4Z+DOItnz7a/L1wr3AqBlDpMF8ii+GVX8UD/j91oTdJvBsPsogSi
	XnDcHDOeq13DpG3PmFxOe4TbiLZp0ayAgAg0o7Z9xw0q1gmfqrWcxSA=
X-Gm-Gg: AYBFou0QAzlngGpdlTHTce1moVO867y6a8mKYsNRW7gDAFUqoVRWN7sE3dbW2Dk7Sbr
	AwhXgWtl5dWCF+suLNScfzVignngKeqP2P6FUiOevwKH9R+P55TeFC5HwH+DAvUewCK/01GFtgw
	i7rwqdvXdQRDwmX6IaEPnzzgBknFOW5sEe8+OgvYM9mes+i43N/nYwzBbgIaxjLvHrAyANxCPXs
	u9Xc+mxfmX/JK3MQGVvPyTRhRGJJ1uq2AhsoY4OxJ9vAnOcUwTTUF1NYbgeTCZds8ajjUqRNe9t
	uppg4vO3ABcA50cnZ8OLGcIWOVf8vDWQkdy54irfiUEZs+vZ74Lh2Y4Qa+ccz5U1xad//18wrf1
	HSGrOs1faEZt2wrHXhN8DWREBx702wE38mAHzjwr2Dgh4Psn+CYHrl55gczUDsa+B9mS8UIy8J0
	c42FhRmW9KSM8o+AUa1D+Jjdm+UP87wH6n5okiwlRzl5Ih8ZFTRiJZhtf6r5YcMGlIEy6Gn2hOn
	iiUJkQNI79t1a3/avy83cLsQlKgSbeenkTJuRZ1tf9CtKyH8d6hAj4Qb/wfDxAO5Dt/mmYPA3dM
	8399Th9lmPLvTZ4SkfZPnpTaFtJok4rShM7okvT1wSeaomHDrLJ+qvOPTPh9phKyIg==
X-Received: by 2002:a05:7022:3a02:b0:1ad:e740:e51e with SMTP id a92af1059eb24-1ade740e699mr23857533c88.42.1793821552953;
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm8652168eec.9.2026.11.04.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
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
Subject: [RFC PATCH 00/14] Add macsmc support for Intel Macs, replacing applesmc
Date: Wed,  4 Nov 2026 14:45:32 -0500
Message-ID: <20261104194532.8259-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101010737.203951cd@jic23-hlaptop>
References: <20261101010737.203951cd@jic23-hlaptop>
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

> Are we looking at ABI changes as a result of this? That
> tends to happen with split ups of unified drivers and mapping
> them to more standard kernel subsystems.
> 
> What is the plan to handle them if so?
> 
> Thanks,
> 
> Jonathan

Most of these changes now expose the stats using standard api's, so this
should not be that big of a problem.

The worst possible thing that can happen is that, the user will have to
change their fan daemon (macfand/t2fanrd to any other standard fan daemon).

And also, sorry for the late reply.
