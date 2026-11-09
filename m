Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243752;
	b=RhNrcGb4Vgqc7Q5/EvB3Q083n8bYuqCtiwWApnO7cCrlrgfg6ylPmbo8MCx/9KRGn+gM
	 Q30tobo/yhPlv34K9OVSa5Ainjfqt/PH1lGnvPJF7PmFSyVgNlT+yXuzOAcqwiYeFpZvt
	 92zP2SOeGTW0SH5pO53z3QqXODXNWNMyGpECZgNzNEogJcxSdS/foJJ8hnsmqlvCnmGO9
	 qOr/r4pI6xhP2lXwjmz9EuFc5wVo7BtqN+O5/vemobQ0FTXgVkGZYRGPBNbUzMTpEqvpe
	 b3cOHuDWiNPQJ0EUzDlmSMLXfLdO/KgFNCb8ffr+1LuoXhvPCK7bvpt9iuhXuno8f1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=+ccDkPggQrAMrKLbEkb1CJN9ak3E69kSIgi6h8tof8A=;
	b=rXzPjHdZj5LjVZxgr65ljC56qKhTghdfBhUCBI1cS4rdgW4xhgV7EfUK/HUFK+6j/Iw9
	 khTWPsynGpYp2kVWQEDm2N3lVtTcYMDfkgHPWc+m+xZ2yBpvO234TAm8vBk5uBFJ408zL
	 YwMDlbJwLikqvFA8JC0IIUvTQYSHi/d0Y2NjsOFPdKeN8Ap9C/DeMA2fc97JeGVTV6aeF
	 HtN5KexvO/roEVk8eijhpQg15k4a0qI369gS6lKc4OUBHcP5ulrItdPV4Bmf8r+ZnJt56
	 h0Foh8aSUqEV60zO8wB1EVfYFnifYTlrTyil62cFsA4JnjZMbWxt22uX9VZ8XdUOveA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HfZiO/Qj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACABD606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 17:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACABD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HfZiO/Qj
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-99c042cee7dso470280241.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 09:02:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794243750; cv=none;
        d=google.com; s=arc-20260327;
        b=Pj39RFYaHOyB2Y7PdUCgrLccQKSQLLGaGIbECF4J0hepcTOAD1g9qlz8b5v5ogZoMZ
         2uGwKg37/g/EMCQCHIvSz0pDylRkCHoJPxLG5GSp7U0gRdBDH1G8C7/sdqJN+31/9wp5
         VKf6OznD7pjjPKwMn415uqCMD9kw0/BGAoY2FMBcIbq7ObMLc4/gQ0eco2kMPvPZpeEv
         gxdlCo2qzbKWlstXbPnxUjoLJ6e91PNvdzTRXrcsx/kddbDhZJc7vDD3GbFQ2k5X8yP0
         xgHsfHk6cVuhH3uJ3zVOE3f8p+zTrIGIC4boN43pRwSEd7J1VY8T9ii76q6GQ7ftqmv7
         0zIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+ccDkPggQrAMrKLbEkb1CJN9ak3E69kSIgi6h8tof8A=;
        fh=mC0lkmggZixQH6+pD5iNf4UtlxSMTiqI8HXVEmqMtLE=;
        b=jOhOPyzsvWYhqwbkWxGTVikaMu0oDYAjxnZISJjZ4v+4Pk70Cz4IGkdK2TE15krpd+
         o4oynReDBa02RbrOIBMlilKJRw/QviOfOvWYdSuT4+vnSJvPCSQtTlNWlR18C3fu5FrL
         eCLR4CVhgKINufi1q2uLMAx0xfW+HiE+zXtf4Qe7FOnRPgNI74AE2lNFPgbGLxuJip+u
         sqwHpES1OeUA1pT0kYHJNLgsovLU2GQ2uOIIIA8fWjCoDnUgtSeZmmhQLlNcUOcvwXYR
         y+F/zNnPqRb/S/+MdMx6+GRybY+fp/17HbhCgh/x6i9TXqHcjVIAPHFqOP82/TzKnlI0
         GZUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243750; x=1794848550; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ccDkPggQrAMrKLbEkb1CJN9ak3E69kSIgi6h8tof8A=;
        b=HfZiO/Qjj1Tm+ceYl3TTP7O3Pr83QEFesEPCtxsNgg1w5vyp+X3UEcT5XDnE6iTYyc
         DYNOWBcF15T46jypa6ql35crJ2QiNzp1/WqfuMfX1P+MtNPwrQLCnVfRXfY7Bua1ck/z
         SfIDVCR6B6A6iU7diSUaF33k9ORDHCYMemwcTMgt1xWg3Yt2gWznLqhA70zkWCb2Z/Ak
         Rb4VuXCqLj+2o5zxZW5x8BqvZ/xj+22FDLrJhWplY+gULwUnmtXzEej1yQOU0S3z4iMn
         AeMUh/EMEiQRzNMd1v3pA5Z4Q6kqR/FVN2ooz0a8qkst+/cuGtT0VxEbFgPkEXNm5r7E
         Wffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243750; x=1794848550;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+ccDkPggQrAMrKLbEkb1CJN9ak3E69kSIgi6h8tof8A=;
        b=OI2WABFlhfei9Ug5+GdOw1jSi/MkM52cwWEydFZ7RGMvxPCbptCTmVg1zddmlvoNn5
         wTp9CgHPLmxeoa7SUoVozD8LOQ8EekbU4XYTVpWqBzfEmmMaYQOdwONuFQuI85Oj9d38
         uJZX+Tt5Ie604fkYFBvReRR6XtxNXxgFyaJ7Rlff+XItdg42KtfCmK0YdDPFil43diVE
         iJtnD7kX7wK/NCxU7beAgWJbSO+y1mLgQYn8FFR/9lkXRy6U62+Er2Mie16qQYDVZzWN
         B3DuIcq0FW8k4lV4ZXm1f6OM0eBVM6jWo79ZM1xqQ064s6QjyI2UH42eJO+2KxHytGHg
         CDNA==
X-Gm-Message-State: APuU4Z8yBDdOHLjzGprjpo0BMrxhqxa+Puo1uL7u6VaenqJ5F8n7/u5p
	VrJ5uis1BS8sG+fF0xwJLJvc5f93mQa5ukE2YJSYvWVRytYn2g22Ng/zw5T/j2eHi2eNgf5ImVt
	Sh3jHTMrdFJatV0bmDHpJ9W7AS4hArqk=
X-Gm-Gg: AYBFou37E+nroXXh9FuaHmxJwYhSDXLZmyFYwIm8KryWzwUlnSkvGXheUR0xIPqMMtK
	w1RZE5DiHb5aUXkEwoWOJZ31XctoWFJ4LGy2L0Xew209eusWiFWeWUChUo3DmjINgJfMv9DHtjM
	4Rb7Z/L9SkEt0/zIjcPcrEFTY/iboytLufVPLgfiGbE1p5UBkYmazD50+Hqw2yfrVaQk8h3K6kB
	g6lmHWw+zSIWTis9E/uwm5LoWnkglPBZAQccVJowft/0GTcH2GBqtRYB/txvwYjkrCsCTRD84HP
	NHiMAddUU+CRy0m4x+1qoauP3iH4d+RaTmePJ0qEnpdv1+B44/C1WY6rlYcPDhNG1D+mOaa0tSH
	p6muO7sk2hznNlE5m/zs3S0nbDRkGXAhuifuB2nGL3sYsayYKvt2Dx7M3
X-Received: by 2002:a05:6122:2224:b0:5ea:e197:93d9 with SMTP id
 71dfb90a1353d-5ece73a936emr1891195e0c.19.1794243749691; Mon, 09 Nov 2026
 09:02:29 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: qvkap <qvkapp@gmail.com>
Date: Mon, 9 Nov 2026 20:02:12 +0300
X-Gm-Features: AclHuK_T9CdT9gcFODPQXqQg5OkLrNWefuBwKE95_Exc6nCskp5mn1L_q6DA4S0
Message-ID: <CAABLQ8qdSC1r=-et0y6qnEjNE-FCvoT8wxbo6R9vmW5=bUOSgA@mail.gmail.com>
Subject: [PATCH] platform/x86: ideapad-laptop: add no_rfkill quirk for IdeaPad
 Slim 3 16IRH10
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, mpearson-lenovo@squebb.ca, 
	ikepanhc@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans, Mark, Ilpo,

On newer IdeaPad models such as the IdeaPad Slim 3 16IRH10 (83K2), the
EC/ACPI firmware reports erratic rfkill radio states through
VPCCMD_R_WIFI / VPCCMD_R_RF, causing periodic soft/hard blocks of the
native Wi-Fi/Bluetooth interfaces (iwlwifi) without any user
interaction or physical hardware switch.

This patch introduces a no_rfkill quirk and adds IdeaPad Slim 3
16IRH10 to skip registering defective ACPI rfkill devices. Tested and
confirmed working on live hardware.

GitHub: https://github.com/qvkap/ideapad-slim3-rfkill-patch
Raw Patch: https://raw.githubusercontent.com/qvkap/ideapad-slim3-rfkill-patch/master/0001-platform-x86-ideapad-laptop-add-no_rfkill-quirk-for-.patch

Signed-off-by: qvkap <qvkapp@gmail.com>
