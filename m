Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8543F8259
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 17:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284696; cv=pass; b=bRhEm95j5IBe//S9pe0DsseuX7CMBhm/wli6jCXlhMUcR3xt9rvG4cwQM0K+hB1jIenbFxiQeHrUIhR8jwbZwRNUUW4l7o8fdNX17a5D7hTh541M+H4c18uVkoTM5BPBbMJTh4ObOI1AWhsHAe28rBx2zoG6+rOaHQwjWYnnOy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284696; c=relaxed/simple;
	bh=F03ffmEEKRNLe/ExKL7UWSr9NBjhZ5QiCen3+buDz2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UU/IhXIT5eOJA4h7mZkbeYoZiY6jmi2KnLPyMopr/S4fgRG9gYFf5TPArCUaX5f46Re8otBs3mBrOVmi3F7H3CIBBzDyXWfVm2fkFctvmkXzgy+dyk47CEL+Xdu+5s/AUgBzcrXeKjOhh5XiKmN43eLV+vlqQEhmVbXBaTLBATw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djtBzLOh; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djtBzLOh"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ce9de10985so15755096d6.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 10:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781284694; cv=none;
        d=google.com; s=arc-20240605;
        b=IRBQGDOFkzfovDz4Bzi8+mrjVViDR4hWVwPqqYnyT6flD/0L7VfVYWwPRgm/LDEtOp
         rafnjLmpYXyElK1Q1KECpwjdPqJwH7RGeKYYHECJel+JW93K1j7wjaRF+I+GH3hL/qq2
         FJ84Cwp9J2IXOE6vOWlnmTMHrfpV7d1DsUuvQwS+XliCD3iSbT5pNHpDVhBDwJSCbz1s
         /Y51pcbZQd3us1stDQo/2q5/w4IpS6+/9AmaeZDlViG26kGB2thCibO+v0zPhQ3pHWM/
         IijW0NPDlghtExZPF/KJ+dzgHh9sLwGMmccABENvATLAgN1BPumZ5oBsN2mjWmtucxkA
         4Ptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3fGfbBOf9+bmNLAAkr9q0fHraUrpO6b5X7ryXInfHX4=;
        fh=iiOSBqGMLgAi/8PdoyPLZMASSVVGtSN3tW5l5xAk3yk=;
        b=JLrpi6JC5lFrYkgh+WIeCBjRWscOr20tu+hqjjGdJe7CwkDXo2MtM1G41PjKr9JYXt
         KQn0KAHVi74VJD0yzOn5g9R/98Sp1vLZvV20b4G2mXjZTq+dwDL0n+CilmaDU4TvD8R7
         hIwe7MnszK3pDxa0pqzXDt1p2rlwu+ujj+IFUwwSvr49vyGVfeXu+A0NWK1jmXLZm7VH
         SBWxMOifKPOIn2Nbbv59bTSqCVO8I1s51u/eNy8cBSxgy64jSCH9P+kEVE3kTmEmTO/e
         1K4hElIhwo+gqBpHbZsYm8kCo47hnTBQyOllVLo+Il+oaHMBM6ETS4ah8KXJsiLrVTIq
         i5MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781284694; x=1781889494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fGfbBOf9+bmNLAAkr9q0fHraUrpO6b5X7ryXInfHX4=;
        b=djtBzLOh2LCSrZ8pageP2sFy9O0FiHlhL5rGfXF2+CzuUoDn9cZNLvO/7E0Nm7QWQi
         +/G79ghTMpVf6dBtPE14rWvJC3GvHJO3tIYni57HNwSfgW4hlw4YXLsULMIGLX50F5Qc
         CihFFRdShBZf+zE9oh0dSUMii+ArSMgCjhusJClXG1NrIJt/ffRtcZ3paPOhf7IBl0uy
         Y6A/MvBCoUlKGN6cmWclsHvxZ8DCgc87RyhdpTpR4czNKZyAng311zxsQd0knNTMM4EJ
         NxnYj2/BhYbuhvwgTT1GF3FjSM80fnjs+m11/hFjdjap6Vii7gbuA14Koh4kg40RGoEF
         AlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781284694; x=1781889494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3fGfbBOf9+bmNLAAkr9q0fHraUrpO6b5X7ryXInfHX4=;
        b=Km9+C6iMvfCAdT47NKBpY0/zUyMbUIwyfn/GENBsP9ENuWWWd7Xy9An8NiB9k/LM4Z
         AvS4KmCLfu4SBe2+wcqNq8DYwvTw4FlR835K7ndSkmNkl4/fV0/Mfa7uW7XfNJ2oJ+x4
         8gPXGlOMwBo7FUb8KQZl2YgKgyecMvVGLLyqQDeD4MpWQoM5ILQ1x/wJoQTdgC5sNgGp
         j98cmEEiTVyBctrgiROKVJrBez05yzo2YO6zFQfzGDadyqJ9kK/XtJSenqnIx25g/vkY
         sUGbRHdUcAOmR8wi5kToob3ReBfQe+sWcPVdCI4zDNPAAOfJm3/rGHuiM3mJWTeEbH2W
         ordA==
X-Forwarded-Encrypted: i=1; AFNElJ9Msqshb2BBqD2kL4DYDG3Q0yLsXUqtez0OnM18m4YSB32d/o4LzNGmpfGA8uWjC2APkd2z+ioerodbMzRp2pSiTZvZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzGf7JnPsdjireRFeKzS7zuTtGonElsPi/OZBWXSbvD5XgXKm2h
	SGgtUnRk8DXLtucu6nwaK7D/E28r9fvGrf568EfFOxYpR5Wkd2QQ4GSJz+FjjLpyGd0J/vZUKY0
	OX/PVMgWc99S4ph4c64VPOtWT2+tq1K0=
X-Gm-Gg: Acq92OHNbVXPhds4dtpogIEx1EGb7vW2XSi7dqYlBlovs6+J5Eg/Z14lS3oYMsaMK1O
	2HQ0zqidStcAp7hSD9R27QmR3MOfHGeA37NhdyCF4352NCTYUiB4KAN9XzXGeFz5lpiiNCrvvVk
	RkDs4mTKxCSadk80izOwqx+9AtlreURP1UmA1II5ocq/OsVZ7fHVDFC33ieZ4sxJ3OzDHfhLcG+
	qq0OjpR8+/ZjP+HO0MZgNrnbTxAiRaNvwWcOQXE51F3L1UjTcdR63yPOT5kU2bg9gEdSMAquJZY
	+slPjEpetioms+eo+6k=
X-Received: by 2002:a05:6214:c8a:b0:8ca:15ef:d66e with SMTP id
 6a1803df08f44-8d34b981c67mr44338606d6.13.1781284693908; Fri, 12 Jun 2026
 10:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611223920.1679438-1-derekjohn.clark@gmail.com> <3d4b27d4-0c31-46d9-92bc-6c584bfdfbec@gmx.de>
In-Reply-To: <3d4b27d4-0c31-46d9-92bc-6c584bfdfbec@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 12 Jun 2026 10:18:02 -0700
X-Gm-Features: AVVi8CcYmD-yGrRxGzVMeizgMH8jqHjekaBLeL4BATuGEOc11KRoCUn-0e8CJ14
Message-ID: <CAFqHKT=QpdDF30WGpA2nV57p_BL+s7fBvRa-_hXebt390n1jdg@mail.gmail.com>
Subject: Re: [PATCH 0/2] platform/x86: msi-wmi: Fix unknown wmi event messages
 on MSI Claw models
To: Armin Wolf <W_Armin@gmx.de>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Renninger <trenn@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 9:34=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 12.06.26 um 00:39 schrieb Derek J. Clark:
>
> > MSI Claw devices produce WMI events through the MSI WMI hotkeys GUID fo=
r
> > some of their buttons. When pressed, these cause spam in the kernel. Th=
e
> > Claws use a GUID already supported by msi-wmi, but use an
> > ACPI_TYPE_BUFFER instead of an ACPI_TYPE_INTEGER.
> >
> > Patch 1 reformats msi_wmi_notify() to reduce nesting by using early
> > returns and a switch case in preparation for handling this new data
> > type.
> >
> > Patch 2 adds known MSI Claw event keycodes to the keymap and support fo=
r
> > ACPI_TYPE_BUFFER.
>
> Would it be possible to turn this driver into a proper WMI driver using
> .notify_new()? This would solve the whole ACPI type problem.
>
Hi Armin,

That would open up a huge can of worms that I'm not really able to
manage right now. This driver seems to predate even the older wmi_dev
standards (copyright is 2009) and I don't have any devices with the
legacy interfaces.There are 3 standalone interfaces, the original WMI
BIOS GUID, the backlight GUID, and the Wind GUID. The Claws only use
the Wind GUID, but don't implement most of the buttons that were
already in the driver, so I would be worried about regressions with
the older interfaces. The driver is simple enough that I think we
could get away with just one "modern" driver vice doing one for each
GUID, but I'd also need to refactor everything to use drvdata instead
of global vars so it could be instantiated multiple times. All of that
seems like a lot of risk and effort to do what is effectively adding
an event for 1 button on the A8 and silence some warnings for the rest
of the line.

I just now realized I forgot to include the original author in this
patch so I've added then to CC here (my apologies Thomas). If there is
a v2 needed I'll include them going forward.

Thanks,
Derek

> Thanks,
> Armin Wolf
>
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >
> > Derek J. Clark (2):
> >    platform/x86: msi-wmi: Reformat msi_wmi_notify()
> >    platform/x86: msi-wmi: Add MSI Claw M-Center keys
> >
> >   drivers/platform/x86/msi-wmi.c | 92 ++++++++++++++++++++++-----------=
-
> >   1 file changed, 60 insertions(+), 32 deletions(-)
> >
