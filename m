Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360982D6405
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564599; cv=none; b=S5A8wqm+3Bf0iSxXaEUr1VzhxLQQ0TY63dpbBTp5DdmlFSihFOvr3G8uJy6sN5KNKFdNaxGEz84OpSuCwsuIdT3V3gCxfV1WdbTKREa3IwlVZpFqAKYs7footSj2IWKttMS+lI2Cf2Ccs2mLxTeXIBcALlcWtPC6t+Y3utVhlHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564599; c=relaxed/simple;
	bh=7FL8ZxacS9ZZsULZY3NjrHPGySQOUlf81PRPKwcJ/co=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=BrptpR0ZB7K7GBF07QDcITUYCWM/0MP7TbS9Axup/gUBWrcTVtwdUiyicT0WzjjWYE8mNfli+sF41lLcqJc8JtfchcgdBLEPBPDgY2mKnhv+EWA6VwzBb5/1Vr3SQK8MOQpjU2cySzL5AZfJFKW8tpLvIjOgkMbwUDDcBPGlEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAuo2OL0; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAuo2OL0"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e82492d2b38so448142276.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 00:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752564597; x=1753169397; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yErOptO8pWolG5NceZp7iAiyPXvmnM2O7fM7bfxzXOY=;
        b=AAuo2OL0zs376+Om3A8oHBDmSVbDGGFzel9g0S/ALqzColj20DYDkYbDiM95jcaK9X
         Ik2nZqwT5Oh1SYsYYiBORJOQug2jdXb3NlW+GkQchx/5DyzSGWP2ix6Jbt9N26jYQRPc
         aFMftRLnUGknYpoTL9kWl5C++Cp39wlCTghS2QPJCHuoGNacL7ESro/FrQsXkfHbdrc3
         A2Q4/wGwvUyvsz2EKLVeHMSREJX14PgzzGUP21NHzeuqCfhXE8VMbzD2CSXr98fS91AF
         In0U1SHo3PooHqg2MPL8TBVxE3cRBXEUsQSDey2jUi7Av6DwFH2lMneRs1bzsqHw7qK6
         3DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564597; x=1753169397;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yErOptO8pWolG5NceZp7iAiyPXvmnM2O7fM7bfxzXOY=;
        b=rB5ZewgDVpcru6gNuxfVs7HOhnlbPexYjKLSYsEZ8YPQAaeEIAnD6TbUe6Jfbm1OLT
         ukIA4dDIUPEs+pvKMCZYBEL3jmB8mTDYobymdXl7uvFWcGOqVfrfEbzj1OMI4XiVDeiu
         3t7ZablvbJA9WwjGLkznBOvmLevSCtWXb7zXzEHkZ9MY0DlfKBZd/j4fr1wwc5AlbMqF
         yy2KMXQUHahdKgVvqlzXqvxPNNAk3hxpvDdUldk2e4p00ZUipFAg8PHYywNKeIWnRh9/
         nFpsIJ9gcm2/Z2SnsC/8HXCNC6hXFiilksfw/9+bpB9qGVhSZ7sXm2MPvSfa55ie0bKY
         aEVw==
X-Gm-Message-State: AOJu0Yzqy2G5M52LbnzKiXd5exiC7mj5sB+5RwP+UU2MT/1rIKOMY3Qs
	ALf0rBRmmtu1wSt/YJXQ67CH35HE0ctJgAnp3g3wBTApK5AzZ77C/iljddZzqd7XMBJSDkWeAwO
	Qk33uqXa3xqXmxHz1qhBMT4ktd41JBO8O4f2AUoc=
X-Gm-Gg: ASbGncu2nX1GsPlX27PeJFgwTFBk9pmYaxeL021LvuMB2w5oON7rSrMiQAKWOdtbnN9
	mcncpiPl6gkKfu8mvnWH8aoQ8DbvQYIaKTDw9eQZ3i5RJFqQRTVL9FxMsZ3voLQsPIsvb86w2Fm
	Wa9oNd2WgzNXt385+8XoHxJnmx3DN+vrhbipD34BzRgBsC2NFHMG33uT2yuzPB9+0LYXpV7J/hx
	Llws5fJ
X-Google-Smtp-Source: AGHT+IE+aiQqPUxMHgk2AuVRr1cJmkhNX5wuid6DPc5/h5zd7SxMarRektYe9sIlv4J7gowAwBeNPv4J/mUu2R2DWWw=
X-Received: by 2002:a05:690c:6d13:b0:717:b35b:94e5 with SMTP id
 00721157ae682-7182ba0381cmr2952697b3.8.1752564596900; Tue, 15 Jul 2025
 00:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andy Antares <geekxx10@gmail.com>
Date: Tue, 15 Jul 2025 12:29:46 +0500
X-Gm-Features: Ac12FXzWUr-5qNXpfiMmfk1laVASdcuWGzn59d-uK5Ut4QnDXxP3ChnF5boT5b8
Message-ID: <CAH3fki5seHUQSC3i4e3xUEyDKA5ybmdU3Yww9HNpcCWVCfvvYQ@mail.gmail.com>
Subject: Incorrect system suspending on Ideapad
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good afternoon!
On my Lenovo IdeaPad laptop with an AMD Ryzen processor and Fedora 42
running kernel 6.15.5, suspending the system via systemctl suspend
results in a full shutdown instead of a proper resume. The issue
occurs intermittently =E2=80=94 sometimes the system wakes properly, but of=
ten
it cold boots as if the machine was shut down.

I'm using the default s2idle suspend mode (deep is not available).
amd-s2idle.py confirms the system never resumes =E2=80=94 it reboots, and n=
o
resume logs or crash traces are available. This suggests a critical
suspend or power management failure, likely at the firmware or
ACPI/AMDGPU level.

The issue persists on kernel version 6.15.4, which already includes
the upstream patch
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dv6.15.4&id=3D7f34fa4589f58c15fd82707bc9ac04da35b3c277),
believed to fix similar suspend-resume failures.

Searching up in internet I have found that disabling ideapad_laptop
module helped some users. Is there a way to fix that issue?

How to reproduce:

    Boot Fedora with kernel 6.15.4.

    Run systemctl suspend.

    Wait 5=E2=80=9310 seconds, attempt to wake via lid open or keypress.

    Observe: system cold boots instead of resuming.

Operating System: Fedora Linux 42
KDE Plasma Version: 6.4.2
KDE Frameworks Version: 6.16.0
Qt Version: 6.9.1
Kernel Version: 6.15.5-200.fc42.x86_64 (64-bit)
Graphics Platform: Wayland
Processors: 16 =C3=97 AMD Ryzen 7 8845HS w/ Radeon 780M Graphics
Memory: 16 GiB of RAM (13.4 GiB usable)
Graphics Processor: AMD Radeon 780M Graphics
Manufacturer: LENOVO
Product Name: 83DS
System Version: IdeaPad 5 2-in-1 16AHP9

Thank you in advance!
