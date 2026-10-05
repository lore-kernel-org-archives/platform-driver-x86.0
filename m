Received: from mail-wr2-f26.google.com (mail-wr2-f26.google.com [74.125.225.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B524BB273
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212777; cv=pass; b=c3UpmDEPa8P06Ke+jz2FU4qCjBAiKvCzEpu8nvjbAxA4A7adYToTZROpw4xfUYcRV5rhsnaUPDWF3As6uXdSygF1yqIImdp9B9omEhn8ShNujg6+uKg6IX/V0ozsMEmhVJETzbVTB40yKk2UP3/bs5qSVMsQfske16VVhOxMd9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212777; c=relaxed/simple;
	bh=ZsAzcSVe9y2Q9UIem72j3vQtSQzXuHeLbkppmAiRVvE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Bv7qioaYhbx54vE8olC2FvQSX3X0EqjEzlCFJwypQn+J52bpOo6j1KfgORHj52hr3BWQXtXrjylXpBsEei2R/k4O+Q1yKRRLHVewYuP2syh41l05gnux7aVz8y/I0IPp/nRcx/Qf35Ukz2ZN5o2biWAxFjcxzYBR7Z6lMEJnxJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+sqp8j2; arc=pass smtp.client-ip=74.125.225.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+sqp8j2"
Received: by mail-wr2-f26.google.com with SMTP id ffacd0b85a97d-48b01fd0ff1so250464f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Oct 2026 08:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212774; cv=none;
        d=google.com; s=arc-20260327;
        b=PRRBbxompCOkQEHtFUn6K/eCftp7JYRhTNR/rTTH0VfS+9OjujWaiWbOol4A7y0V7O
         xZsNRYmhg79RPg37GqGftlRju3Iw9w8TjuVb4mmpzjZl99AxlNR6hYLCjRXoIi3+RPIG
         fW/UBXHEQZqgpWhuVe/3Nohp07HdvwXuQTAfDSdQglYji/MHhPjmBmThYognls1n8Y1K
         lwrU2FZbWC8wx3t5Fa1xHt9JWrFCC6bafQALBmjpnBZZNoXKe29Xv81e9EsINT+XLlkc
         GXe/jJtBQ3ZVujvJBoxXNmc4MJb6gwy/GTtgorvRyR3rc/yLzERZ6AX4Bb6vQ3lAnfRW
         ygkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZsAzcSVe9y2Q9UIem72j3vQtSQzXuHeLbkppmAiRVvE=;
        fh=yGhX13kmN7M4XqmskuLTQcHULr6g7MaXE17nLfEk0dU=;
        b=VHPgBFyvVfQ5U9O8mJixf9q4pp0JIVzSXj84X+WLpzdhghhcW5T29WObjslKILz7WX
         9sjE45Swil7tEfSbe/92XOc0SabPmPn7vzv06oX/+wtfNjYpR46lZXB5iC9XfYfJCG+m
         z0Y84JULjHf2TfPC9Pjo7mwwWCqMYvjxRcEu+IEOspVEKdSFZ3MuvUbXbK6nv1Pfu4xm
         xPn8Anh3vzBHZiGXEGPYlItHO7wj/2Lt5iTcVemfDKlt8Dwi1PJPyHxfxPNPP2TGlJsH
         /12pGz6TwBAtlr4M0xojfJh7hQ7gTT+imZrO7Bwnvi2t9hjlrh6kmWhzBZI7UPqUdso0
         UCNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791212774; x=1791817574; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZsAzcSVe9y2Q9UIem72j3vQtSQzXuHeLbkppmAiRVvE=;
        b=L+sqp8j2sNcjlNpCSkAiGnySWbI4fhtkA9fb6/wYjVgZQKP+wC3/6QBzZ6mx2yXGU1
         IF165/dUSwmXHQzdlIjWttGpbLeqyRVitIq7nxxhl80TKl5qfH3u+NDo818L55evf/7b
         g8YfMovzuvyx0aLaN8Z5E91VjKXGZL0xPPBVt5usu75FirV3z5d4csqy2Ixdo/HrPlOK
         04Crz1H89X2a4Mxg5+DIbSJ9bu/8IOber1Qs7dDMl3JuVCtMqNDEsuq9Yq0UjlKSLVdE
         aFwQGbuykX8XURrzPxY4QPYThcdZqvPgBNo+GevbtvTeu6910OjEuJ958ZaCBcqiAz8d
         lb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212774; x=1791817574;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsAzcSVe9y2Q9UIem72j3vQtSQzXuHeLbkppmAiRVvE=;
        b=oGLxwzuLClCqqSHPRRTsaAtC1yvHW365j3FUg9864SA0ATUlkoksBRuY5QdVM54wXq
         v5Vr6owXxyDLG6C+r/nzpy+ggjbjLCoqH485NpAPb/O+31y9F7SFaRNqTL/gKEmF3tzA
         m2LEsUD8DMC+fm+KGKuvwwXLY4zmDEuOI8R2gAD5qtg0KORDUsxrus6exzXjON5nLmPz
         XuWkhzHWNNEYrFiKP7ypJTNxJhcRqXfz132ObQNu7U3JzqH/3DXZLcYvDstHz03QPfQ6
         5otiitpIUlnctZt5jq9bE3zonwYV+QU37LcL8yPFF9X/+tE1hStdl0s4Hxvs2EH1M1au
         gRpw==
X-Gm-Message-State: AFq9FYIT7BxCp1tSir9UtiI7htAKf/9NQpKq6En1SouvmQDJizwMJ52v
	X0f1OZ8xq3sJ2u/mTGIOp9nPLJLSQOm5JULIVT1bKJxKmjlIk1Xg0XsDkHJ7n+Gjgdnmw6NSnMY
	HVcz6EBo8ewl2XCvcKs/+XSLjRJaxjIf37Bxgfns=
X-Gm-Gg: AYBFou3V3HVbsyy8bJ1xt2xsD0KIAFk2Ovo3omFOneKcGpEhICn/T37qokCVylQ+o0H
	Xzj1XMRQeWQ3DEaH73k/eGOCJvzJqfkLd1lnpHHLFh1kq55Tcmk5b24FnvghWuujgIBCLKK2wO0
	TIGipvo9wjtwc7j2mHFo5VrEK4QEB8oiuqHlStTnvO6wj05UFDikm/rpuHFq0LSV7KUAAgauD3B
	ESXgkbk+YtGLm3ajDFlAGsThCaVmZM70F1XNXHCd+/IVwNVa/imf998qQoYQqpsQoSeaT/We619
	avLWLeLZ+F/eFtZ83G4KXb98MbbV4zTAlUT8oFXkpxgqJpxxNhWrHjUuR8kCsMxJsH1stbwe9no
	vgEdXlJQ6w58=
X-Received: by 2002:a05:6000:186f:b0:48c:55c1:fb90 with SMTP id
 ffacd0b85a97d-48c55c202fdmr8683065f8f.1.1791212773306; Mon, 05 Oct 2026
 08:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sokor ITV <sokoritv@gmail.com>
Date: Mon, 5 Oct 2026 18:06:02 +0300
X-Gm-Features: AclHuK9t-eSYDX9lKGtV0hnSgGzaFrextwb9Qa6kOWDXLtpC_v4KNi0QBmwyRXI
Message-ID: <CAL5LDZBr1NGwZnTBgC5yczVO0uXExGCAS7vKHX5StYa5mB7k9A@mail.gmail.com>
Subject: [RFC] platform/x86: asus-armoury: add power-limit support for ASUS
 ROG Strix G533QS
To: platform-driver-x86@vger.kernel.org, luke@ljones.dev
Content-Type: text/plain; charset="UTF-8"

Dear maintainers,

I am reporting a missing ASUS Armoury power-limit definition for the
ASUS ROG Strix G533QS.

My system reports:

```
Board Name: G533QS
Product Name: ROG Strix G533QS_G533QS
BIOS: G533QS.331
Kernel: 7.1.5+kali-amd64
```

At boot, the kernel reports:

```
asus_armoury: No matching power limits found for this system
```

The power-limit sysfs attributes are present:

```
/sys/devices/platform/asus-nb-wmi/ppt_pl1_spl
/sys/devices/platform/asus-nb-wmi/ppt_pl2_sppt
```

However, `asusctl armoury list` reports:

```
ppt_pl1_spl: unavailable
ppt_pl2_sppt: unavailable
```

I also inspected the actual `asus_armoury.ko` module used by this
kernel. Its embedded strings contain:

```
G733C
G733P
G733QS
```

but there is no `G533QS` or `G533` entry.

This appears to be consistent with the DMI-based power-limit matching
used by the ASUS Armoury driver: the G533QS board is detected
correctly, but there is no matching power-limit definition for it.

I also have a hardware-specific `ThrottleGear_G533QS.xml` file
available from my system, which may provide additional information
useful for determining the appropriate power-limit values.

Could you please advise whether support for the G533QS can be added to
the ASUS Armoury driver, and whether the available hardware data is
sufficient to prepare the required power-limit definition?

Thank you very much for taking the time to look into this. I
understand that kernel maintainers have many issues to handle, and I
genuinely appreciate any time you can spend investigating this.
Getting proper power-limit support working on my G533QS under Linux is
important to me.

I am happy to provide additional logs, hardware information, or any
other data required for investigation.

Best regards,
sokor
