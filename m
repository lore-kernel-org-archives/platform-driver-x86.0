Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D245F2BE64E
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 23:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755732078; cv=none; b=TCC0MOKD1QFQ8zpNt8Fy6Tb9/MypK+FL/i7ynWf8ncn7/qgqkM4jHd9ozy/5Q30+mXMe4r+KG/sA0QI8vSDSqy5eVArDire7zx4rLoLK9DywSkaHP1acbHG1LxNHnnTBidx6eyGz11/+gBPcCHPxJGRbTgR0JWYTG+GnU3uo7vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755732078; c=relaxed/simple;
	bh=1O26ZmlZTBFnDBaRzFsCpBXq44KkJ3NiHd/7+DVWzDs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cXNB85pe6g4eSpMvYwQNAgz5W3XQHGS9d8SMR8Ctix8qRHDd52WD7XK7LGhvmGIj6jy8+fQsaLIeLW7gsYm88ZYcl4Qz+jYRdWWIZ5G4F5qCIvceqa57BAcDDqBgj8L3c71rJc2Gr8C6Gk1Owt128/DE63cdp6FHw6r0OHZeCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4lZX0RF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4lZX0RF"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e7af160f1so368482b3a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 16:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755732076; x=1756336876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cp0W+YHyL3b7/DABNObVBBIC3Jh59WNhUlEgXALj3L8=;
        b=c4lZX0RFnG+BMBWTXLklsJsN64rVQY2nqRsujEhK9SAzudd8X8ARzDdivFrP2+L1NX
         iNTBlW3FdAuwXWzCkOz5oVPgUsSUUGLfj6qqzlS9qbkZckTaeZwoZvH0Z+45CnNNQvlL
         UOW6jCvTkhmfLJSyAZ7z+rizTnO9ZSNlK/CfEWLS4A7CvR7qdE92orWgGfyM4FTkpRYR
         tJwXEawC5Nnuvh31nQ4FKlTgSZgtP1hYYHZdpTad7pHJ/8AYb8M9tXZ7DLiDloanadVE
         +xKRlidJlnLV9RGrmbl9JWWajAuX8qWGjE188LJCiwBXR4KTyGC6eGo1l1mtAwys/F4C
         CWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755732076; x=1756336876;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cp0W+YHyL3b7/DABNObVBBIC3Jh59WNhUlEgXALj3L8=;
        b=sN9LPGai7WktSVVYFoTccfyARx27o1WFD2hunO0xcUbL1pXDk6BOVFvDizn2VeDGf3
         1q2Dz/LllHZFN5FH6nOhxduUIfYMrNO1y9stvfn/U/BF051z1iTGslCwGG1/ENYP727B
         zi6OUUnh1gxRI5Hixs6GK9k6pzjDBXdrGhEIM/12myJEdtw5Ey0vb7gVL1dmYbr2boAR
         uGZiwXjIXQrWiNgYZBEg+fWl+HAG4mg7/ktKmgc9oFFVHpBIdRKeN9KwgIVug5WwDPP3
         cKKwqiJDJbdZDELYE19KCo7glpcA4eFwWSlfl+7XImucBbgINk9tq7DzvPdqlLG00KQO
         Uexw==
X-Gm-Message-State: AOJu0YzFgkYUKvdYQR77W+SxhrfQ1eHJZXU7qB5kKFLRILRNo/hxY0jh
	zrPRvE3+jUehf4UltYkXrIR8LRkaTfCgVffXpRrlrMLT/cpV1RQTTpi34GWpdg==
X-Gm-Gg: ASbGncu27HpUO+g5MU8JKa2KN/VXiWNkOqk6XcUoW6wEJTORujqb2E6VEK6C2CRMzK4
	tLevF+yalWSQiRR6pO2kk5zAWJGnjebggE4wke4MmPBDNzX6saf16HBjzQtZPo9XUv8GCLy0bst
	VeVfbAbQOIa47z5CPoQfJ6royd2nmjlBly+/H4K43hRnnDr5fNvrgiGfneLtia18bYswHw83QV9
	DvAW1uXtkiSRYUXMwDyT6gMlk8tNBwj8watjuCyJUxnHiZmp3TYdUTBs6cfAh/Lsoka5JsNKuCa
	bymeDcVCpi+NPI+T3Mo1s/Ktkvslx9JdUwoXhUo1yPi1mN89hVdQ6daHM2fWSdM+0P2Mer6LrT9
	JlidQvx9KaTNn95YI9hIBc9oI7mqksu0goZtzSxZWNv3iMzq8XSFu2lzWegHi+Mac8pD1bHGDEl
	HnQnBQ4VRkDKkZxhJn1g==
X-Google-Smtp-Source: AGHT+IFu41U7HMCbVl0868B0wK6iFMzUxciCdGUYL2r8RBObvrHpPnQpeBEYNndHyp8/Vzl3RwHCtA==
X-Received: by 2002:a05:6a00:1408:b0:76b:dbe2:40f6 with SMTP id d2e1a72fcca58-76ea325f93dmr285843b3a.23.1755732075920;
        Wed, 20 Aug 2025 16:21:15 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e923f8364sm2730963b3a.107.2025.08.20.16.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 16:21:15 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:21:13 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Alperen Aksu <aksulperen@gmail.com>, mpearson-lenovo@squebb.ca
CC: platform-driver-x86@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation/wmi: Fix Typo Error in doc
User-Agent: Thunderbird for Android
In-Reply-To: <20250820155904.32685-2-aksulperen@gmail.com>
References: <20250820155904.32685-2-aksulperen@gmail.com>
Message-ID: <24912814-6891-4223-BCE3-87D1CD6D9A4D@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On August 20, 2025 8:58:35 AM PDT, Alperen Aksu <aksulperen@gmail=2Ecom> w=
rote:
>Fix to correct spelling of "Hardware"
>
Hi Alperen,=20

While we can fix the spelling of these, they are currently as provided by =
Lenovo=2E The spelling error exists in the WMI interfaces and during develo=
pment we decided to leave them wrong to match=2E

- Derek

>Signed-off-by: Alperen Aksu <aksulperen@gmail=2Ecom>
>---
> Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst b/Docume=
ntation/wmi/devices/lenovo-wmi-gamezone=2Erst
>index 997263e51a7d=2E=2E24b027362e93 100644
>--- a/Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst
>+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst
>@@ -126,7 +126,7 @@ data using the `bmfdec <https://github=2Ecom/pali/bmf=
dec>`_ utility:
>     [WmiMethodId(65), Implemented, Description("Set IGPU Mode")] void Se=
tIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode, [out, Descripti=
on("return code")] UINT32 Data);
>     [WmiMethodId(66), Implemented, Description("Notify DGPU Status")] vo=
id NotifyDGPUStatus([in, Description("DGPU status")] UINT32 status, [out, D=
escription("return code")] UINT32 Data);
>     [WmiMethodId(67), Implemented, Description("Is changed Y log")] void=
 IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
>-    [WmiMethodId(68), Implemented, Description("Get DGPU Hardwawre ID")]=
 void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
>+    [WmiMethodId(68), Implemented, Description("Get DGPU Hardware ID")] =
void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
>   };
>=20
>   [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("=
Definition of CPU OC parameter list"), guid("{B7F3CA0A-ACDC-42D2-9217-77C6C=
628FBD2}")]

- Derek
