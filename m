Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334403;
	b=QyfmLv9ujKcl+0S79VaTPYD8ksDlqtdIPf3m6QJprQm5myHe6LOR2K42ypV/jueIcTyp
	 /j7jWx/Bahmbf4EkQzaL1CFu7KsdWw/XzyZykvXPquUQH3dFnJcX9NrfTAkCrYPt8LSa/
	 0Q3qe83GcGBZWvvJfxH78TkyKSvJ+zSSa8LocL7x97+YvHYHyWodkacKisJPX9no1YSbY
	 zhkok83gIsqzazVaz8OiNdBYh9Sh8xVXHUQrHMD/1WW2VWBn4Z6dIGQxp/61zulWfBlZu
	 ANzlhPE8zVXTj7eQRh86i45IRm3G+dwVsRkkYurpMSBeZ+9fHVog++8nqi1z1wKVBTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
	b=qSHemBDuGW7ynqPrK+3akb4e6ENQm4+I3zK2l+T4RkXe0JtRt/qf212e9Odr/5D4p/Zr
	 yFHacCWDKfHCiRdGw8B2P6wt1a2j4hDvg8cSHHSiMfJALU4SQEfUlgPwyS7jIgeD/FG4U
	 aE4QArAscqQ44qWKMWu6rc1/dZt1CS7M9QP2ojri2sl4pvq2gIoSaYmc15rMb4VCz2UZj
	 mJZFA/IqwJSu02QIa21SIX1KcdDny0hcasHv1cFs3HF3cuAa6CW6Nu6Oxevztu0k00KFj
	 FL4B4yn/wuEbjY881YyFc80/om5WA52iDFKBD14NFmJjbQcCdwHl8KpKrBvqUI1u9sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOGfl08i;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89024606A31A
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 04:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89024606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOGfl08i
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9995ce866so2958305ad.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 21:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334402; x=1793939202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
        b=OOGfl08iTrDcSP5CRoXDmSVya4AolyQdAG5OWHgE9ofXhHL55pCqAnLRy3QOWArl7Q
         waeVAr4qZkWUShO1RmfxQqhrxoPq/ZSnc5SpnwuVgdXh4uUo3uTMWH2m3jGzBhUOoKFx
         piwI3wn6MAqmd1Jhykxn1EE4vgfRhKxFaW6GtH8BDqaTg6lhfH+PQ4OKYqKo0UaA/SHn
         G+h4ly81vQPBO+1raeS2XxMsGTShwbFSSrem/WohBifnUltiwlf2RuGeIQYnhL9m3Aq7
         m0V3jj7XEILRpMI0/2a20+1yKez2+/pkZAsbweZ62X9Oq2XkzL9wOS2u7ALkWWYDls5i
         Qy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334402; x=1793939202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
        b=Vz0O8q12cYj8zTxOrL5iTk7MLch7LK8FdqrOTfCHN2apkDjdqqmBiBp5ceGWUiQm3w
         w/P0MAhrD3MlZxNH3XVNYbX8JstN19gqqujvLKcXmhyrk2aal+fn423JeySivBQrXVxc
         FEa2VkYB8zR28EKTMuNGzaLT4d8h89wV03w/+6oR67tMIADQg14Y4LEcyCSvNA899/kQ
         QFcD3l194xXqUZ2eE4sNoIsVzScZ4JebrbS0csdMAtu4IV8JRxFftqQK41hnwX8z5s6/
         0NCLubwFP+uMty2JL52zjf8+aZxEXMw0manOHY5Kj/Zo0vnngJvnLMrCbSjKJGYdj1VB
         wh3Q==
X-Forwarded-Encrypted: i=1; AKwUvByKc8k17iE+PKJm1AXjU42kKT+fEXqpZJ6EnkVjxThkEE8c+PMucJi7nD/aOoNzcUJo6BgspaJo9S+59DEroHEnWvvV@vger.kernel.org
X-Gm-Message-State: AFq9FYK+bipBVO7UzCoHwNicNwxWTHoofPTgr8h2v8D5VrtjCC6zkLn7
	SBv6+FwKCUFGNP0x2ced0Yryl3sz+/U8unrmOAjR/B+J3x7Sj/AxpFNjC71O94/nYQ==
X-Gm-Gg: AYBFou2M6RyvBzsPR5v4U3t5eid/MPdXzjyG0WgoIYenDgsQ+kdqn/fndHXdGRslsVu
	iRDYahpRI0JgWAlCFb5sLnMhiZDu5ygfferM9wT3AmUMrs17rUhhWToEhdYFVgS3Qdp31djv9pg
	rKBvSEquqb4eM7HPaPJCbYjmp//Q/ssiBWENr73uY1ATMv8lLVp5SC9v3yl3SOFezehpwvGSbn/
	vM55BPMFDqX8H3IU0I6lIMQstCedgYt0j0Xty/otBUNw85wYbsApSEAd1PKv/uWdjL/m93OeGn8
	pm05T+WIW6xGLkVkF7RhXlRsJCIBUI5uuhiaEsZrDq9i52ZCOQjyXK6F8eBhZwM3QPwSZ0Ol62F
	9pQ9sOSiIzHwA3EzuQnfY4qrINapHgif0ZtIwt3cXhzyUV6ba+eUyPJ+Txd/EH/TWKId9HArhNk
	3cV+XkcjckqB3LMD9Fmrf+5RODC9qiqhXtJ2XGIbsiMGyc8/x7ALUtUg+zWuHX1ZqBnN6HVCNvC
	1YSzMetQnmxbpzWZE+18v2g3DjtczmGZWFl6lFzZpunGBhfDKR6bKRCr+Ysv5qMWH7QT8MwMcRA
	63Vij/p+fByKE9djAP8/kdPgqGOucOqGPipUwhopLTVy0jzujYYBI6u0bZyz+gsA0Bzo
X-Received: by 2002:a17:903:faf:b0:2e9:5eee:e087 with SMTP id d9443c01a7336-2eb364e553fmr13990205ad.43.1793334401915;
        Thu, 29 Oct 2026 21:26:41 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922fbc4sm1965845ad.24.2026.10.29.21.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:26:41 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded Controller
Date: Thu, 29 Oct 2026 21:26:27 -0700
Message-ID: <20261030042630.2744339-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com> <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
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

On 15-Oct-26 10:55, Konrad Dybcio wrote:
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware [...] It provides keyboard backlight control,
> additional temperature sensor readouts, fan speed monitoring and a
> number of miscellaneous functions.

Tested on an ASUS Zenbook A16 (UX3607OA, BIOS UX3607OA.312), on v7.3
plus out-of-tree Glymur platform/board patches, with the v4 driver
(2/4, now db3a9dddab5f in mainline) and a local change that leaves
the keyboard backlight to the HID driver:

  - The EC driver binds from this node at boot.
  - Both fan speeds and the EC temperatures are readable via hwmon
    and follow load: under an all-core stress-ng run the fans went to
    about 5900 and 5100 rpm, and both fans and temperatures came back
    down within a few minutes after.
  - 115 s2idle suspend/resume cycles in one boot with the EC bound;
    its fan and temperature readings kept updating across them.

I didn't test the EC's keyboard backlight control, because of that
local change.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
