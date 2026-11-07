Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794057860;
	b=qv3so9WRAGb2ykYwVok8ghGeSKLLmb+RENdghzLwKMn7HMJNc/cYct+bz500+oyojUKb
	 bVo0H3BOSUrMkaRlsP4Ytj7UgdNrQEboA2bTQPApKrEJK48XIrpfaLvi/MPYGDYTjIzRH
	 a8LJUVOmgbarkv22RcSUoFExJUFm/C0BHEahVVc+XbogGlrlRrjd2pJuf1eQnw6yDzXq8
	 YkA0ZN5rIPX+HaQ8XLYv7EyTVF7cXMXlg6nWOMJm7qm+Txpz7HpQYhKF65DDz029uWwSZ
	 gxicU0e/AeB1D3E3BxrJbgsCdTr9aUUXS/4WR0vufAicmCddhBEbdCWcNhTvLiHihCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=z6cvIR8/w2KV+BnWSxqQJYCnMJX2uxJLLmGs+7Gm898=;
	b=h6KnfhBqWSgzb06a0pzfsKMamsJxb52AmSqnBaCRpX9mEsNeU1nH9fCCQZ9s48SIPo7L
	 UppE0YPeDr8VTXgfQP9mfba8HG5G7dE7waATO7LnRo4sOpFrqvMTFWj3p5SmRGBEYYFxT
	 Lm2+ou8qJ/UskkDVjKHnPlJ8Cy9GuuAtPClZwo2/YiSnPNPp4r6jMOPaWLa2RwQSeixyp
	 LLHZCkcj932HN3uOFCvPN7M1Y4A3cz9rxIGH1JZNbEgS+DKZy18YI0DTwXI/n4ykmwag7
	 /xnEvyDicDTaufZkO2ThOdHNcoOQlpI7Q/24emyLaGaw+5E4o4bpYnqYgRv7t8FHa6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="egt/9Ydq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3BB606A326
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Nov 2026 13:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E3BB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egt/9Ydq
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso574365b3a.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Nov 2026 05:24:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794057860; cv=none;
        d=google.com; s=arc-20260327;
        b=r4TzKaWruAgHqnoRfG3ykKnkdawbQLjKs40TC/e+eEGWMVJg1QnBXQPCkk6amtiUGb
         vOGL0xmmZ5kK68dG5Pb6jLL3CUTbgP+VdsbnuK/CJLAJToNIg0Bah5Wd1vNxfxWYHNG3
         9PLjot5+BEsG6yFnhKwaeIx6YGi2cIEvfpSxNcU9kZ/HM4eg/yxwUih/GYSSVCSmug39
         bxH8EKrPOQDuSNeuZ76bOJDan6hwRCo9OKV/xUho+0UygvVoyyV0Xc19EruhKMaG4M++
         MJBOTRgvm9KzLQduG6zlDNVgIpIsGlBB0MTdowIRCkPbxm19Cm+6EszeGvxc5iT8M4T0
         XoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=z6cvIR8/w2KV+BnWSxqQJYCnMJX2uxJLLmGs+7Gm898=;
        fh=A6k1kTFTakE6XNF60Clq2D2FRhejemBAL0GbZgMEpOc=;
        b=P0/to+ZK9zRxmhtuerJnojAU5GF0Ib8G4WH7bFzianMwZq/1Ccu5kGLuWyYaQsDRJI
         zbp9FRywCZ53xLrWB4QFCMIo5xd8bAxnFLvIcDD4Pwzs8PO5Dys3ArzJH+aXD8yZ9ocS
         hBq5Fww1YVSDPxhH5WqcPZTBP85tWyBmfr9jHGYpBv+fRUxmCPlk37m3FyEMxTnvJhqK
         ZOJ64uGVxzB5Sk7EQ1EFGDtcT0XiZqVG8Aj7RtBF82GmUh2wPRI5f2tuj33Tm+kWGh27
         QpuhbFxzSNtBs7Nhfo/3S8oPOgdxsIcewctC/IknP2GCdtPNcCL41wy8Aj/1kdEGLjpx
         y7iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057860; x=1794662660; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z6cvIR8/w2KV+BnWSxqQJYCnMJX2uxJLLmGs+7Gm898=;
        b=egt/9YdquNPXu8FvBII2kA5NnP+1Is4C2I3wbE/15bbbcqw0QV21/Jb6Xy3qHTVI37
         WI09SrRKEfq8EZXttEBAFckJTz5wIQqdier6ICFf0EvMnOStSBZY9p4GD+iqWkSgYanl
         6h0SUEu7N3EyG2ow6t08i+BSWLy+6AGLAdOahKL9yTRg0YkK9xlItZlHLzeFTmwzhXjQ
         IKM3TWi1qBJUYMxJw0ltFs/q7av/xMOQ/mTK3ODWtpquJFFEt/knZ317IrLdu25zw3ZE
         zdhnH2CZdF9lHs8cSxR4n/TEm8cBtaJ8S0jNuTd8v17CmRfmFSn5WqWDCtZurN5ai13N
         cZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057860; x=1794662660;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z6cvIR8/w2KV+BnWSxqQJYCnMJX2uxJLLmGs+7Gm898=;
        b=ng/3R+KmiDVJgQMB1pt0/N9a9TBYmsOGPYcnVhNz4vDSF5QpOkAF4YiVU01F64FWNP
         7rc9prsPtSwGTm4ePMeGaCcBuFLQby9GEfi6kPR9OGmTHhJUD6W8DoYVYLB9APhDRRUT
         TjAf/ub3iQPPCuD09hBHtE+FCy63RxyOlsJPLrDe1/Ntd/DkQsj0hb0RdLhuH+Ei7NnP
         Eev1tZxGwrWdVk7RrudjiXVb0kVdbQ1CoyFfpi5e1kkCdPZMU4ZU9KhX3/6fHobTVYyn
         sYMlc15ixvPaIUluKc2KtFRkJoPKenBDKFiiPwxComJVC6hSCzNKWtb1cPPc5wnL2szo
         r+rA==
X-Forwarded-Encrypted: i=1; AL+hErGGQXxTzsz7ba5jy1JzpJE9pTWZx316T8nEZgZKnaNCgHDsoSUs/FBA8NIGZhxB/Q7IDsUzpsTzBr87SpcoMT04BITB@vger.kernel.org
X-Gm-Message-State: APuU4Z8KyT/6sjrqp0QkTrvmSdptMP8eBRDnTgm4REG5c1f+8B3Has+L
	+m18TSdIFj+n6M9c/EQ7rzfVZX2QFB2e/u4yMw0iHna9Rl33OzzwIu10FEdcEkXPgnZ+5qPEPlw
	mNJGJlcmmsphboQLYEnLXVriMAGWsu20=
X-Gm-Gg: AYBFou1E81lREoOo0VXBVM5F9HQw2bTW5hD5dmmfHAHlPIWrrxSrP7Yi+5nmb/P//2b
	XSEIFh6WrdGgk5L0tV1XxZZChNQbADi9JGRvB4+QIFCKLbPVU2HrWyAF/7LA67nyezdW10Ew6e/
	H28Pv2WOr/kUDBHE2/Z3O23xQEfa5BdgTdZqjKPv8yiiR1KbEqeyrVpoJQ7uPLBhJGmy/OEyo52
	SiHQcALE136POWvj9sOibOQ1twz0W4mypcacbrr2ZVp4m/22kWqcuVLF90/c3k6Z6/EgeuheKL0
	DXkBzAcPj0R/pNHFEu0FnHHjM3Qd+E4p7ITWGu+4vxfrQYedix4uK/owIv1p+h1KUixrNHy2cW2
	U4BgucG5WqqX7MqCHkTMFe2BfZLqoSLNXw2r690rR3j70qNEjCJJj2DM/PaUc0s+SGvb5
X-Received: by 2002:a05:6a00:8c05:b0:89a:19ae:10e7 with SMTP id
 d2e1a72fcca58-8b37be50e42mr5386306b3a.42.1794057859877; Sat, 07 Nov 2026
 05:24:19 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Date: Sat, 7 Nov 2026 14:23:43 +0100
X-Gm-Features: AclHuK8W3wLee-SC_bINep9sAVMsLbYP6ki1_B-6wv6M2M-O8zCmkC4I3YCdlbc
Message-ID: <CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add Auto mode support
 with dynamic max_brightness
To: mpearson-lenovo@squebb.ca
Cc: Derek John Clark <derekjohn.clark@gmail.com>, hansg@kernel.org, hmh@hmh.eng.br, i@rong.moe, 
	ibm-acpi-devel@lists.sourceforge.net, ilpo.jarvinen@linux.intel.com, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	vishnuocv@gmail.com, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 23, 2026, at 6:19 PM, Mark Pearson wrote:
> Hi Hans - do you have an opinion on the path forwards?

Hi all,

a data point from a user, since this thread seems to have stalled.

On a ThinkPad X9-14 Gen 1 (21QA, BIOS 1.25) running 7.2.15, the
firmware already enters Auto mode on its own: Fn+Space cycles

  0 -> 3 (Auto) -> 1 -> 2 -> 0 -> ...

so with the current driver tpacpi::kbd_backlight reports brightness 3
while max_brightness is 2, and brightness_hw_changed emits 3 as well.

This is not only cosmetic. UPower 1.91.x treats 3 as out of range and
stops watching brightness_hw_changed altogether, so the desktop no
longer follows the hotkey at all after the first time Auto is reached:
https://gitlab.freedesktop.org/upower/upower/-/work_items/367

Whatever interface is chosen for exposing Auto mode (separate attribute
or hw-control trigger), would a minimal fix in the meantime be
acceptable? Following Hans' suggestion earlier in the thread, the driver
would report max_brightness (2) in brightness and brightness_hw_changed
while MLCG says Auto, and leave the ABI otherwise unchanged. That keeps
the 0-2 contract userspace relies on and is easy to backport to stable.

I am happy to write and test such a patch on this machine, or to test
a v2 of this series, whichever you prefer.

Thanks,
Andrea Rabbaglietti
