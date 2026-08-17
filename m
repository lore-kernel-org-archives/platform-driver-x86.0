Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D32F3AE1A6
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 21:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787002477; cv=pass; b=sFzuzO4u+mVWkuUBtClj2O7VZBRX6lHe1JbtawqW1PJr0ZOZbxkZvRqE5Fe5tiy0AJSuRYFYrtwBsWZSyejRfj3/mQXvHfWUcxUpGfjMIR4LDpXo4dnog5zXIce7EPWScYy+7H52fDQJ/8pNmZSulbMfpy+uGkUXDCo4uvCCU2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787002477; c=relaxed/simple;
	bh=epwU7jREk7vRi+ttZATQY88mwFXUAqQ//0r/cT3c4p8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JYKZuOc/avPju8yeNVQo+TDo+pDK+mcGNpfbEXAZ5uBLxlz9N92x8KHg1hMvoKfEyN0cnoTH0U7p6v7ftGBMUAMu8o50C5u5uxpHyPj3LVzg1/LdZCWcEItFSkQC3xMSpmoehQg3IA4Fdtd2XUYnGgao12d8/+eehb5NxyC8JJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=meFEhrjm; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="meFEhrjm"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66c67a73eb7so547554d50.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 14:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787002472; cv=none;
        d=google.com; s=arc-20260327;
        b=ZC/Te2+ugUWSo1hgeuLj0jtyMYNCVLTfxP5aBZQWZflg/YmspBHaahvXmxtDElQOYg
         JiqYihxMwsyngMZ9/ux8nUkl6VNMEXZBfURKdNPHIxr14Pit4CTRrcG4JTZtFqDS9Nz6
         EOr8E7XawNyXA51eX/kRlDOp3oujfICoT5cIQ3QZRMKczxmlUpMZOHsac4KDuigk/aze
         nSMz10R7FQ88pjCerxK9L+bq2ErxZvWlpoHv3MAxhG2Q5bWgRK6lAqsP0xfojnRKLdMD
         jnzWLwxyu9bv9Lg5PDg/E0f2sSSlgm/R4ZQ19KgUz5ZUkwCs6OD28UHt9UsLSf3sR4H2
         NgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=epwU7jREk7vRi+ttZATQY88mwFXUAqQ//0r/cT3c4p8=;
        fh=iXOatAJ4cMB/FImP68h8dOvlB4Zzw88zfj8S5kCd3rs=;
        b=L9CtZdEvxc7Y3RR5a1OEHZpOlC7exy7G6yGdJz976O/f2F911P52xz5/EL76O7eZBz
         hLEuk0vqwklq/fpzuQ9jzkRuGO33LnCoykMNI94rcQGsXTCEouuudpskCP3Ot7gszrDX
         +y6ZNiW68wBei9uE85Zd5brZpuNdRrazxAilvz/IRPq+prF9H/ws/JMETGTstDhhCPZ3
         xXI5fa8fdq4hoSDDVyzf+eXnBiHIvj84dJeZuwmFokisWURVjmKkiGtWpFKKxoTLYGmE
         d0Seu1wIt6N2C7HKxPIpHpu44Sl2W1v1+6qS0fWHz4WrmP1csQxEhJcXDOGz21cIPKOb
         oIGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787002472; x=1787607272; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=epwU7jREk7vRi+ttZATQY88mwFXUAqQ//0r/cT3c4p8=;
        b=meFEhrjmRIgNOJJfFU6Ejz/s8s8cEowMR7SyQZ8+w8GjO4S7IGJ+ltXvbRFNdIzDDb
         3H8hWdm+1losLXt5dotAIq07BWzJAUC1fgC+uTotjITlo63QcBak5qqHJvRUCHIe/Bj1
         MVpN8Xo28UYV/PBzZ4CyaYV+t9CRWAunTcpdP2OQ51jvQR45uOf4tEYJBkGSW6DtprwQ
         KlBAogGI7oc5J2nog47W3c4xI08paH3GUc/gA/fAfQuu0DJO97amnS7KN4TyrDEZkgI/
         QKHzYc9YFoD458b9wnAENckn5r7CxpJV62sQcDAUGZputPJTFsCPoz2Xlco4c/tY5ow3
         haoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787002472; x=1787607272;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=epwU7jREk7vRi+ttZATQY88mwFXUAqQ//0r/cT3c4p8=;
        b=F6pmkrWv9+zyh7HkJoaZzktU8tHc0knHV+eb5sdLmDPt3FJfYTe5AMRsRuTKvn/r8s
         lKTsGj6vBxgpQS828qtv8ra9aaiNI9O6RGm6NB+EWOoamMurRJWTSVDiuOyqCYwiVCdF
         aNrWztR8pC28c55SkNQ5v3lsxTrTntPY8XGcw3UMsCauGVFJYRPIuAEpFxw2NUlm2Oyb
         RKEBmDYamAId2cgxRoD/ICIJfQj8TtwaNCeYxBd3ADEMpJqX3DVj75KMHiGnLEz/tDBZ
         gh9VmqTQBMAfEqaxp09X8GWhXWRfbqIiHqRBKqwndA2E+Qxcn+lnbj1I3UnFgkm4amXb
         qgIA==
X-Forwarded-Encrypted: i=1; AHgh+Roi43SBBqzzwbYMOpqYJ6mDvGyH8lJ8RXqHWGkD0VgHkw5Qvw1muTnMdDArw2o4Y+Iwo7o6oD/Hmh6FUw7jAaty3B/S@vger.kernel.org
X-Gm-Message-State: AOJu0YwOBUweXEf7ULhGc9Wg6B1jzONDVfDmIBb8zoZiwOdJ2luGh/q5
	EsaB9QgqYKBhTYip3dnHDcC2yFNCXKG8fF9YjzyPHI9iE8nQYdI2LICsZubxj18PnjERso1DvLC
	T8XJX5w5I94/Vuyyv1XQNaIC2WyxFRsUCmBGUiMX1
X-Gm-Gg: AR+sD11UM4dcV11LrlHVZvZiKUl8wqgJ9jiwpc66zJaLLUilBGDOH5jOjXgJbYfMbol
	ZxzBwO7b6YYOkGyHDe6pH2L24lAAVoes7VP47LrN8WXYWO6S3BfkheizuR+GmIVqQX7g2dkXjW0
	5HGMay7uanYfh0RdY2zdKToPQ8heNbubc/QW1B0BEzO9Y84J2vc3IWv72GHvBHESGNR+PzY/2QY
	jPzeFBn745moUei8V9IROrch05RoxW3JANGDHQMOp+Z25xn+wXLGtOkKLSnSAd7/zhPYkSVtOtD
	4bRcKlB5TybZ4ujMPqZpRSepISOnUpkEBHd5khS87Zx5vdUq2ZF22tHPczMhdp4sQZA7YeOc
X-Received: by 2002:a53:4903:0:b0:66c:72e8:c224 with SMTP id
 956f58d0204a3-66cbc0dc3e3mr563068d50.5.1787002472110; Mon, 17 Aug 2026
 14:34:32 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:34:31 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:34:31 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
References: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Mon, 17 Aug 2026 14:34:31 -0700
X-Gm-Features: AcwNN1WvdC1G44iZL28Kx9gAhqGc2MgHY5_ATU13fLffGtrrj5IDQreS1lxgkL8
Message-ID: <CABtds-3HCx6Z5whZ+T5F=5CwxkcKze-WhS_t3qA3Bmy99i79Jg@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] coreboot CFR firmware attributes
To: chrome-platform@lists.linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, 
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	josh@joshuagrisham.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	florian.fainelli@broadcom.com, chenhuacai@kernel.org, mst@redhat.com, 
	wenst@chromium.org, tzungbi@kernel.org, briannorris@chromium.org, 
	jwerner@chromium.org, tzimmermann@suse.de, javierm@redhat.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, krzysztof.kozlowski@oss.qualcomm.com, andersson@kernel.org, 
	geert@linux-m68k.org, dmitry.baryshkov@oss.qualcomm.com, arnd@arndb.de, 
	ebiggers@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com, 
	sven@kernel.org, u.kleine-koenig@baylibre.com, bhelgaas@google.com, 
	dakr@kernel.org, o-takashi@sakamocchi.jp, titouan.ameline@gmail.com, 
	kees@kernel.org, dri-devel@lists.freedesktop.org, oliver@liuxiaozhen.dev
Content-Type: text/plain; charset="UTF-8"

Please ignore this v13 thread. The send path corrupted several inline
patch bodies.

I will resend the same patch content as [PATCH v13 RESEND] once I have
a working patch-safe SMTP path.
