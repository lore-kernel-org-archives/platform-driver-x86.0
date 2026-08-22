Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D1028B7C8
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 17:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787418123; cv=pass; b=FwOhWAmpXp2ttFNa8IUWZ3iA8E8pVW4jJ0cJcq41lbd5TbXBYwRjeeONkeW4hQf8JA2T/EEd+IpnQGzcgO/0tLvByAJ9swVjW/dqho/3KLICYYudXslLY9kbiIDDVGOvN3lvpm8ndVLcMbj1QtYIMLXbBVSX0zNMqR5neqCLafo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787418123; c=relaxed/simple;
	bh=d9X6ofdbXx9sUOalO8grbpa7q7ZkvvuTbmP96pJtJRc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MVif5qvo55s+IYjwzpIYCL9dFonPw4EG4m28bvDkR0kDuH49huNix6NbK+bbOO+/z1LIsg9pDF/YwZ9SgP43mpty8rEQ9BP3BgaUIjpdXFWYlSier0G4fRi6SEdEeVGvOlXeMyxjY1iUi0fvulbu8HdZkDhabzXnLrwbEKH3l/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ent5h8dH; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ent5h8dH"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8fcc43c48f7so24733976d6.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 10:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787418121; cv=none;
        d=google.com; s=arc-20260327;
        b=F4uDoAdYXX2g9525hbb2rZxk4NmnrtlztyyyPnG5bKHBiJ+LioHAB+cCpacqXvEZ4X
         srw/IFXOFwVB64UbDLG/junNV8ArZUMlC2136NZYUhgz0SJbx4sJ8vwdq+VYca9icTBm
         pMUxyRU8rA5j5HqxhIql8KOE00u3ftOdcmgetZy4Vt7XKSnDLFDEfDXP3N8MbXtJo3FS
         b1LAVCFjUkb7fg2envq1pK28ImM+BXhx8A8osSuU15qTPcasmErj0UKKZa0KN2XATRLM
         sjfbDP1BcCKGeSD5uuBTJFzzDiQAA7BQicv+Xc4jym/oabhXlJohpTXfDZkMDQmBnQ+P
         MCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=d9X6ofdbXx9sUOalO8grbpa7q7ZkvvuTbmP96pJtJRc=;
        fh=FHAVMk1VqDzsKERONADXyNKG2B3pNYL+JyZ+bFHalK4=;
        b=U6rPOm1gGkTuLOJ5+fkIgkOHNRYogSzKWzM4QeEamYz4cxMo9WvxURRIisubaQGqyb
         Zmo/hHoOq4nd4Ou+ubzzarUf7cMUT6U2gjRdowJf3iSqDpJMwyt12XAvoLb/Qxli9nO7
         gzGS3btODlS2ruHdk35EkuRKZEwhWzVdzUXjchMkspeR4oA94RdJxBHg7TyH3wSCKLW9
         n3j9TbgBqY6Bce8FlL/JmcoMmp486Kde0NzznR6FkLE9TTLQLG10CLwV0B/Cc4E6Nohv
         WbFbf9FYTNc7oW8X25p0W/e4O2xaEvpNGwFZd483HRaKHLaziZyoKLLoOtiRmHxF7v75
         Hs8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787418121; x=1788022921; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d9X6ofdbXx9sUOalO8grbpa7q7ZkvvuTbmP96pJtJRc=;
        b=Ent5h8dHj0ccXVe0vF5xmpl6GunVJRbrR0rDg3wylLhSI/hvK0bdZgAa+hfjQAzXph
         91u0Y/Fydhn6UF4TmiK1eHnmgDJ21alYAIj+b90f25v/sgi5iBssSB79wOGyQOYUIOJT
         QRrJJAAfHVLemfyblkGUJvIA/K1R6D+clHHOw3xmpY3pCoKODUoAAshMl+MK4qFVTFpX
         GZ225z0M1StGcghd/h3lG3k0ipVRr9zHidjZm8Wjcus5GWcTCKvIN8IhWCyWgqBypXTh
         2SL8Fa97OJvJ+LSHntM7AVYZ+Wbg6CzKtmeMVCCfbjUXKi/RPYUwbrP7SvpLW+4XW0yN
         Xh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787418121; x=1788022921;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d9X6ofdbXx9sUOalO8grbpa7q7ZkvvuTbmP96pJtJRc=;
        b=N+ED8AidEfXh/m0UosDLo9bB024NJHOGjKvwKxcbGnGmfMDr3hj3IKZJWI7OVj1mjz
         5EcaZbcxPYg3/GsAjyWI/iE/xl4CQ+J7eWk8qGgRw4DdSw3+rfQBce+VQyrg375DWl54
         JuU8n1CxmXjOHHymOE4Nby/CwDYDLwMUWGIiIae5vCKJ75Ha6/AfCcGuXV8SK/G2Noao
         tWQPC/npuFUfPfHkMGzLj7yViBPSI71Q89h3Y5sDlowSHY9P1QGY4gjvMitLATR2DU16
         jrjXjtdGmsuDbAHfWKpduNxAZShe4p318/RoAXDMtFV5yYJneN4JDKNmaUBXwtOIoKir
         SAyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqw6a9ffBAhiWKeIeJH9FuiRzNKo6M/NeBdFHHrIRXS+1J3ecAN08FU0FT31hiYmSudgd/T7RUSp6rtbznha6wBAgXr@vger.kernel.org
X-Gm-Message-State: AFuF++n4Lp1dJ1DihArAvQ4/Jd008F3SrypLhw8LdJAmuVqpNtAE1ovG
	qYde95m2/u/Kd1xALn56D9sD6zIh7ghSpoFnd6gdwfEeqsmtIeTqfqAAt1Df9yILGUWZJL5LsoC
	tsF1ntXHFyEK+++lGU3/Fw3nRzz+fMFGDJARa
X-Gm-Gg: AR+sD13GUm/226UMh+geH46NvQO+KJYGhrElXjbR7sJXM2p6Gm9Ajod3c43mjTqFKFe
	RdgoXl0efTi6ndFg3OD6UIyTGrFB0KZ99kPn9XqRroiCl19SeVaKMhoCUN7EpFwkV9CAi1+07Eu
	pRSDWDSQkByAl34aLDPMeFDgWredcUMCyXxTA3URQmPJ+DEhxrFKXA8G5rgRNwTQC8HIudldkTW
	JiRsuUIGLzktPtg0pFhG3+rHT4tMNzsKnq6I38CZuQUUzADlP3ir9Er2BvvtPy6J6JysGwK/KAv
	EopMS7bofSDTqLW+Ey635Hcn9Tp3pbscxpVKyyi/41NoDi9wkoAqDsc5y9PiWv3WJK9zEmFUMF3
	AgQ==
X-Received: by 2002:a05:622a:1449:b0:51b:ee11:e71e with SMTP id
 d75a77b69052e-52e09bb400fmr60764051cf.1.1787418121125; Sat, 22 Aug 2026
 10:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Luigi Maria Vecchioni <luigimaria.vecchioni@gmail.com>
Date: Sat, 22 Aug 2026 19:01:49 +0200
X-Gm-Features: AcwNN1VqVhFKPCXVbyuLRg-0Jnz8_xiKXjj_vWSNXoeE2gW6q6SG5wKX_5w6qaU
Message-ID: <CAH4cXPgq6hUiGqyk4BDYcbnmjLxRM_2uM52uzc2kCF-jDc5Q7Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hp-bioscfg: fix attribute enumeration on older HP BIOS
To: meatuni001@gmail.com
Cc: jorge.lopez2@hp.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am writing in relation to the discussion:

[PATCH v2 0/3] hp-bioscfg: fix attribute enumeration on older HP BIOS

Message-ID: <20260704160759.236249-1-meatuni001@gmail.com>

I am seeing the same AE_AML_BUFFER_LIMIT / WQBE / hp_bioscfg error 0x3
pattern on a recent HP platform:

HP Laptop 15-fc0xxx
AMD Ryzen 7 7730U
BIOS F.25, 04/20/2026
Operating system: Linux Mint
Kernel: Linux 7.2

Loading the upstream hp_bioscfg driver produces:

ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x32) is beyond end
of object (length 0x32)

followed by:

ACPI Error: Aborting method \_SB.WMID.WQBZ
ACPI Error: Aborting method \_SB.WMID.WQBE
hp_bioscfg: Returned error 0x3, "Invalid command value/Feature not supported"

ACPICA tracing of \_SB.WMID.WQBZ shows the failure with:

Arg0 = 0
Local5 = 0x32

I thought this might be useful because this system is running a
current 2026 HP BIOS, so the issue may not be limited to older HP
firmware.

Regards,

Luigi
