Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF5A36A017
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 05:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777525213; cv=pass; b=YWS2GKdN24iXA1RcnSQT8rIvKVi7hmidLfh5vFIm5x4goBDjKoX0DF/7P3qedh5nYEwqyDgEIoQ0hfiu3pMkvYSqY+xe5H1Dixsg/YSV9Lc57thUEyKz61U96XHdTbc8zMHv4psPDQEVdX5t9coWHUAOSfxB+qzXpuYBEyHbRPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777525213; c=relaxed/simple;
	bh=xJkofzprckqDT9HqP2t0moTnaBc6bbI+YycLdwvEJlQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WN/BbIonbW8IeLp3h5LfrcGUri1aKrEdPtD2Hl6qA/veOzKngUFN+eAgAWbsCjqxVcOKTUGQgK7nYD/PoNANf2qDHHw59VMCzVDxXKP3QnrEGI1CLjKhVOzcGCY46ZFeb1NBSzEvSnqlTmuiv9tqpKMoKrNXIuNRVi+XQzK0D2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpL4Bwkf; arc=pass smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpL4Bwkf"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so969594a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 22:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777525210; cv=none;
        d=google.com; s=arc-20240605;
        b=F3b7ZNR7Toku67WOCjSXbdhM/Ety7FoF0alWkeCP9kSKRDyognmIf+NwNiEW+HlYHv
         pFEJerKoN6268JNKMmfyKS9oocOcrF2KHqTQLm1ygLjM6ns0B4jeO20+tfQeo58435rM
         tifrDiOdmLMmekAm6LwuhpGJFPV4YyEQMZoBWMt0FL3xENGX+ENSw8812ml8CWricYTj
         LzWIJe2Q96T9WHdbSzDZnwdKtFcs99apai/pmMdi8OAdyIbRtYxKyYcoFlfXunXCZi4z
         YZysWRwkc9OeIquWlnD6h/jTAVAlfVNPgC+jGQYqNs2u6eI5zIn6sgIC3nNNV77pOurw
         iTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xJkofzprckqDT9HqP2t0moTnaBc6bbI+YycLdwvEJlQ=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=C0votFboshRD5kNqM82rA6ZfoWKwiD66CgmbSoSuOoUpaKK4rZTy0cqyt4zAL1772X
         NrxyLy+b4DHMHoXSCMwcuMF7FV85o3M3kodb2kqkyalqtT0bqNB0GAZukWQ9xA+MtbmR
         FJYXcq3pyjpxP232Ehe8kySXVkPV3X/2UNbUzx7JoP5PhtBvapqSFAGC+osJTO/iYgQZ
         LFXoaE2ZRo/6y0BVgGulWc1rX3rdhX9lqTZFqCtS4apsSDM5zOzMhFQBS1/ZeMAjW3Mq
         GP6AYzUbmTB5KRKjET4TXobSZ73nSatrTsFUYndnX8RPuA7+NmqNUEHl4pgurQP+4nny
         PIWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777525210; x=1778130010; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xJkofzprckqDT9HqP2t0moTnaBc6bbI+YycLdwvEJlQ=;
        b=fpL4Bwkf/6rarpnG9/AynvkO1cu3TeqrlNCYIGxgCTqf/kgKhGiw84v1pVtoIjgO5F
         QHn7m30/AJWPLDu2re5wWYYBh/PCWQ6eZI+dwhBo91c+zm6WR2o7hLVpnz894/WiM0qA
         IontIYeyQ5hUc7tXLtba/LreD9laraWK7Tqg2Mvrkn1fHAsSgAaLR+SZD92eh/mEb1TN
         zBwuEtwx5ufQ0wnxlPe8lgZYVuycqrprOmy26N5EGXmpeLKyCtG7E7fyuMf275SUbGWp
         KEhpP0hwoVfRyq9pt7/308+07s8SyVexJFpaX2Cp+q1PeoGTIS1D7JEYHNyFn+5sfd8e
         ESLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777525210; x=1778130010;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJkofzprckqDT9HqP2t0moTnaBc6bbI+YycLdwvEJlQ=;
        b=rCpXkrc9VrVUMe1gkymoioxQHLJ5xDBycSU9EatBCFvLDJMKbyRxQXA/o1vjl6dEjB
         LyGmVW/TIUr7TNP4fT56mwILBh8xZl8+FaMvhD3ciwaInBl5swrqmIIvoCPpOwyRSMf3
         IEeQQdbp8J+hN581cDnE38hbwMH5avpAPty+3AgmnjwDzN3vrnFQW413TkCXeRU5IzN0
         j6DuKDN9UrLHZx9VRaZty2TjjzXfjbSTZvHsfyLNBFu3SLZmM79G85mDV8346/SKwStq
         XsbYPpe1PjEZhmaqghbluKaWTERQ1l5zyJVpX8+XjM2Gs6da6pZN0uZ2HaPNK/q6YHlO
         2TUg==
X-Gm-Message-State: AOJu0YxaIemFSjiV6COq7IUJXzRBsp8AqqItSMSTGAl3SqXRDy8YO+x9
	Ou/efnJleIKAMpWkQSQ3xzPmQVNFaXCS9CX71OiJ1maFSKBMthtE4kHR7Y6PhXtNaWW0hXcQL+0
	67o9nzdX8unngRxZueOiOCH+LPSKFbpqF+OkqpZV7r6clQOM=
X-Gm-Gg: AeBDieseyyiHt2VLWliN4gAuVQb8rdqKc+5pcW5lugQXD7tETjNrQMN97f0ltJ7eTvP
	uqPfKnVdlYMG+8zxnG/b5N37MwzjICZ8YTs+x9jc66tT3dXbl+7wzGJwUbB/ICpzQtjMzsICOoN
	9+Anvl9jI2BguJQZTM12fLw1rpIzb7zpBuwPNYZuB7f0/JfKslhipi8p9f41C/88WGs142YCAOp
	g2a0xF1tKUleKVdyU3+JfFJNLmw8dtAL61JOSdcu9N30EVj/LLv5yWuucMecjk7Op0NS1qHdK0J
	sMyyasyofW9X0xt8Fi47i9JllDtJaQw4EPS3bOGZb/7ZrrScciQ=
X-Received: by 2002:a17:906:dc90:b0:ba9:bb46:345c with SMTP id
 a640c23a62f3a-bbb79366094mr47305066b.45.1777525209713; Wed, 29 Apr 2026
 22:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: yue li <mc.root.ly@gmail.com>
Date: Thu, 30 Apr 2026 12:59:58 +0800
X-Gm-Features: AVHnY4L-M7AAstWt4yYeC-Q3OIiKlNeu9qan-9B_yfXmA19bYUfYG7OCkWXsJFY
Message-ID: <CABd86uaQY9-ZSU-_PHKtZZyWnDFHLEsuaM+NBV5nOLWA+YSX7A@mail.gmail.com>
Subject: [REGRESSION] hp-wmi fails to probe on HP OMEN (board 8D41)
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a regression in the hp-wmi driver on an HP OMEN laptop.

System:

Vendor: HP
Product: OMEN MAX Gaming Laptop 16-ah0089TX
Board: 8D41
BIOS: F.12
Kernel: 7.0.2-zen1-1-zen

Regression:
The hp-wmi driver works correctly on kernel 6.18.6-zen1-1-zen,
but fails to probe on 7.0.2-zen1-1-zen with error -22.

Issue:
On the affected kernel, loading the module fails:

modprobe: ERROR: could not insert 'hp_wmi': No such device

dmesg output:

hp_wmi: Unknown EC layout for board 8D41. Thermal profile readback
will be disabled.
hp-wmi hp-wmi: probe with driver hp-wmi failed with error -22

The system exposes the expected WMI GUIDs:

5FB7F034-2C63-45E9-BE91-3D44E2C707E4
95F24279-4D7B-4334-9387-ACCDC67EF61C

This suggests the driver matches the device, but fails during probe due to
the unknown EC layout.

Question:
Is this board expected to be supported? If not, would it be acceptable to
allow the driver to load in a degraded mode instead of failing probe?

Please let me know if additional logs or testing are required.

Thanks.
