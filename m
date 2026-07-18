Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5994CB5B
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Jul 2026 00:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784335166; cv=pass; b=SuLEcdyStSNuMCafNQamnq0Ug00ZR8QQf789n+QyLKNTCOGOvag5/DkPn2/o2Blodh0FrT1ezuylfPta5Iinis3MpPHSvS7ui6OasW/AVnOVR+dhPrjg77Bi+PJC6ufuGG40eds7Vrpkts9rVitXQb5BjJrRAzKUxMbigcg8lvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784335166; c=relaxed/simple;
	bh=s0kPzawXk5e6VvEO2jn1aV6HFzfVmnba4zjlWLdVKD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USojWzZkx2ip56k5n47cLclCxhjk/fl43k3jiHXgWgGlxhOOu2mUwbjRTVFmInlLVSFj3FTaCp4b+j8FvcTLXfKquHsD2IuXR+6SBugCalwGIXccRMaOKa4qwXx3ngUk48jmjlS9VzOVZQFTm3kY9S4C9n0/eFBpK6hpUSIs0kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TOfJ1DhZ; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TOfJ1DhZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954bb689dfso47825e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 17:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784335163; cv=none;
        d=google.com; s=arc-20260327;
        b=lMs0TDf+KfTaiAXQfkgfe8YLi4DnSFyMxaBfrdnzOFOO24ufDZe2Ab7IozvOuzBOkt
         uoEJgfcbNnKJVP/kkQdk8NwzoXCEaItfQ2TRr//5mUIMJWDpAysHgkE8Zzpnntq0lKKg
         ibd7+WrXjVATrorVJaHNQ1wQx8oKFBZpa2F2PMRbujtP1a0suxfuu4YYN2wCihmo68DD
         dmjqMNR+m+y/MWVR9JHU7I9QRcKYay1QNIXR4XF6kptWyCUp9rl3kzR4IvESEVV7vUVN
         TnILzk5kMTGBh/5wVEvtS7yQXRiOfDSKDQhcijTY8X4bjiCYj01LQXSS+XaVwVXWuyrS
         NNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SLRkO0fZ0r29yomSE14773/SRoCXg/5c79uPcxE3Zr4=;
        fh=/o0ytCvspSzr7YV+VWuEgdyyutIziK2061nlAO9VlFo=;
        b=UBPBXyqEwyRBsPR2F1Zkbx6n9Su9Cgi6mbhDizrDyeBEUyL+QQDzPc0r9YnK7Sy3Ah
         nJzL93AQl5LczbpO5Ux6Df1SQkTFQWD3Sc8Ls6DkYQLswA/9sQsMyQswSr/DNvkbOB8T
         2fSQBdrxoQ3QZ50t9fmBXAecfqfiC5OCN8pek5paPuzKcMuF2ghqzbDELsjePHDSpaeb
         crHvLvu8uO0K/p2LET3Sr9Ynl6aJ4kBbGVrcVhAI3Bt+iquvvvoyRSviRxBG6Qf/maVI
         sNr2dvKqg2PEZC54Y+TISUXenFlyLNNVhoXaPzg+PAQfco2cXRNYyBbvPmXyXGhveAgU
         4Ebg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784335163; x=1784939963; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLRkO0fZ0r29yomSE14773/SRoCXg/5c79uPcxE3Zr4=;
        b=TOfJ1DhZE6e2ZXlspN+PGrO8mdEPSgrtHGwlV6GLYQ/88jbNC4ifdG16ano3rGBhvw
         8wXC15g0j6cX4YcN16UAeeg1jjQ/LefNO2JkJo0PTtNNRGxq0PKV5fnYvVuhnDovFKnE
         FmGugqlb0+z9260ns1FFsuE0UCINHrtae4n+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784335163; x=1784939963;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SLRkO0fZ0r29yomSE14773/SRoCXg/5c79uPcxE3Zr4=;
        b=bzl/BE8pou9pyUxovKNRCsexUCC7JAVWSU70307pAZXu7JrL+8Ml4/EsYLgMOljSWa
         K8ae3ON64ZO4pgcQyxhKasiAje1uV+MAgTRF7oXpil45fAFkE5lX5jOaWBEWSTQO9vwE
         bgJkY1OiGqopM35BBeTaNSLmge9WI8CxOWxxZuNiFhXL9RZPsaOmG/SME1lJa7UfNzRT
         DKjuYJ9Jaio6v8UQUQiyohQCitNT9ox0ZWjLH18e+14m5MGshCK6kVoGUzZmnEBJ7Yto
         O2wmOecyfppHqSZagFJR1Qp8Z5jyoqwlV0VWfv29CKJhNKdmpVnTPrJpSPpzMUDVXW5J
         fthA==
X-Forwarded-Encrypted: i=1; AHgh+RpMmRE2Az4hP3zNee3FtFH0sIU5JtiWKA232nbS4UWXKrzpYfU4yWDcKD4JA/qIEC0JZx8HEXPTzmbJ9YgUPB2Y29wn@vger.kernel.org
X-Gm-Message-State: AOJu0YxHB7TTJxa7Qu65/SZI6vWhDB6dkuKF+GZIoX+0XYXJ2SvZQn3n
	BA+JUtOuCEBeFRn2vuwbNqqUYOw74MILMXibEdn30J8QqiiA2lUc0RvWQd9VPsxLfkqn/69pCIT
	PyyXxHkrVAZtOz6NjsfgAOu40MAlp0MAtRZgIvoHm
X-Gm-Gg: AfdE7ckR+iLB6xxwWrcSDepwO8xR/l0/9xlTlRtV9Ksj5KFcUwy79/oVMzYqTWGMhCh
	PN1jpDzcenjg0zhHwFoManJaEITjAlJ8uKKn9BTbGmikbX66P18NS+CY5Tkb8v0qf4NRzegQ9Fz
	O2QpFcAKRr8t8I9Rp6pczKF4Pqwz6r4C9PdZOhhotVSF8s4OqGjaWkky8a49zNtM/OVbildxq0B
	5Ue0jMTq9aMiEqlR0Ll+Db63qRPn18trPHCMvlep7r2tMLfAa8dFS7KSHk=
X-Received: by 2002:a05:600c:4995:b0:493:a96b:f9fe with SMTP id
 5b1f17b1804b1-4954ff99257mr447445e9.4.1784335162370; Fri, 17 Jul 2026
 17:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085003.369496-1-sean@starlabs.systems> <20260717085003.369496-3-sean@starlabs.systems>
In-Reply-To: <20260717085003.369496-3-sean@starlabs.systems>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 17 Jul 2026 17:39:10 -0700
X-Gm-Features: AUfX_mzIDJqwj1GCrBaRE5IDRgnHx6t1V0tiy--ulOY3EGbsJtc8_36xavsFsik
Message-ID: <CAODwPW-UZsLQhYtx3_afkNb8jtta4TO0YxhuS1a4mHomOF6fJw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] firmware: Rename google firmware directory to coreboot
To: Sean Rhodes <sean@starlabs.systems>
Cc: tzungbi@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
	prasanth.ksr@dell.com, jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, 
	derekjohn.clark@gmail.com, josh@joshuagrisham.com, briannorris@chromium.org, 
	jwerner@chromium.org, tzimmermann@suse.de, javierm@redhat.com, 
	kees@kernel.org, u.kleine-koenig@baylibre.com, mst@redhat.com, 
	chenhuacai@kernel.org, wenst@chromium.org, florian.fainelli@broadcom.com, 
	titouan.ameline@gmail.com, oliver@liuxiaozhen.dev, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Dell.Client.Kernel@dell.com, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Keep the existing CONFIG_GOOGLE_* symbols to avoid user configuration
> churn in this mechanical move.

Is this standard kernel development practice? It seems a bit weird to
me to leave the config symbols mismatching the directory structure and
actual meaning of the setting. How long would we leave them mismatched
like this, forever?

If you want to prevent user config churn, an alternative option would
be to provide the old symbol names as transitional options, like this:

menuconfig COREBOOT_FIRMWARE
  bool "coreboot firmware drivers"
  default n
  ...

if COREBOOT_FIRMWARE

config COREBOOT_CBMEM
  ...

...

endif #COREBOOT_FIRMWARE

# Deprecated symbol names, do not use

menuconfig GOOGLE_FIRMWARE
  bool
  transitional
  select COREBOOT_FIRMWARE

config GOOGLE_CBMEM
  bool
  transitional
  select COREBOOT_CBMEM

...
