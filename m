Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0401B5A79B
	for <platform-driver-x86@vger.kernel.org>; Sun, 23 Aug 2026 00:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787445384; cv=pass; b=iE9UTN/9f9YDewX/AbX6X0xe2hF8+LsoFJhC0PbqXFt4VvZtBTlrOOdBKLfszQS+EQyhjy5S2QEYr89odhvuJekKcA6G6ApINbQgDMAjhV2ZZDGmO9JKZUaiq8kb1s8HvErJy73EdTynPXdA7rdJ4LgfyKQ94PT6nKKfN7+KnkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787445384; c=relaxed/simple;
	bh=IpHcjZ3NayMqvBih3E3O9x4doOsXtbt93QADiafRZnc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=q6f7c+z29yY1mjxJUwZPn9BtsCZmkMByqECbb+GQe3UC6a47VdveUe5pLGw1GqgCSQugUAQ2Enr0+pR7eUs6Qhb70fqD9Wt6fyx6NzZbUJDwjAwIIndpeP2UZI2Lbh68wqgCWDlIppdYHeD7ShORrdECkSz1nfkF37xl9duwrH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0OxvrY6; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0OxvrY6"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so1957073e0c.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 17:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787445382; cv=none;
        d=google.com; s=arc-20260327;
        b=LotgNKn75rrDri2nMEu2Ttb3oxUHcYqWx6yUkzmdBQtKpRayWIEiTeAw/uaW8RwxoT
         fZZVuLo+VDfTqAYvYTu0Nznpf3x0eAEYXqyYe2/fHDGiF97vKJ8YFHQ6alx3Slq7X4f9
         xoW7gG+9fuN12b2Qr8KusBHRian1W6US2Tss6/aGpNQJskIKuUi2TjlfVm4V26luigJ7
         TphTn/yQHpr+xIbpvATP8yVd/xy/bin4sXrOLGk71YLUM1x+0SfqxDqtvNohSFJxDyjA
         Kq1hFUzPFXpfg6yZH8qCRhvjWCgTHhnS/PiX1mTPUnr+hFg516QMgj+mVW9kKv4wiLMI
         5arQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3Pdm/5HsS5zC32B4oG3X1nNqflyH/Na8m3BnnAtmnRA=;
        fh=GdQqk2P51xns1fPGwWHNeNIYurP/vrmta3owGmOOd0g=;
        b=jhGXGB0u8Fa3fCNzo3bbMZiEwCw1X1c8L/ltJ0pZ/9282WYB4/d9j9J+i5kqK09/Lo
         2/novvymALWXPWk8fWJiAOygadJbKfc0kNPBidr/gNItQYOZj6J5M+9a3PIXRS1l3c4r
         9nNyJqbuOnBx7NWqUFY6VoREe6A8StqyEpLu6T7FqFDR6/k7FSFd4cPfKSJzFw0KLuWA
         9t5mD6xEQLXAOM7tKd+z2HlDAluXpybin5TsjSVKclsSD15EHDjW/lmIs7U5dR8MeAW6
         igTpe/228zoAhBDFkpXRfgoY5JHuJIP/IlbLurbn2bfkU5k9n+gPr9mxVha0hfgPQWYl
         uqRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787445382; x=1788050182; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3Pdm/5HsS5zC32B4oG3X1nNqflyH/Na8m3BnnAtmnRA=;
        b=B0OxvrY6Imbe3vLVhklm5A/fruf4zFOoF/Knb+Fa+uHQhrfwLYNlJr2/2XEJZmZd6T
         X5KKzjdxfSeOXHfL3G8E3rDWkuLHxq+C0UtVhgiLK4liwtJoFc5Ow09cFNBtllveFRf2
         gV0Q1rSCt2ubuRZHPxdSyGgJDiu7Wftd6zY2trKc5zhWwupJgPByoS04Y+xlnoKMiLqC
         DFXpbHYF2Hv0mHohlnDll83Sugs1qMmUziH1fQuMgFVoS9AvjFJiR/8upLgL2Qio4fkb
         HOYxnbYtBb9jvIBRelIufjH5T+mP/Cw5hQLy0DQlNdfk0kdFojVzQ8LgZjqxYnE/WXgK
         /U8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787445382; x=1788050182;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Pdm/5HsS5zC32B4oG3X1nNqflyH/Na8m3BnnAtmnRA=;
        b=VstjdMLwW3T+jKMPjlpEcX3GiHY3BoN75QvNlqcaWeBA9tLcvPNkfQL4/FP7rbzK/Y
         OJ3M0JJQavFuvCOpBvJmUZLhf0C2HBKfAi9qvHPHbZPCcSapymSh7Sbsrg0SNDGag2Hz
         pXluOf9/jYvPoTvVZJQxAIHO0EiQr77ZZK8yGIkT/WmTKk2efM7BHk6+LIYkq+QPtNV5
         0B+aqWwfhmeGytVm71CvjUAfFYpV3WgO78OHDP3/ryFOihB2eppk/K9y4+XjNesjHOoS
         vMbgZRrojzALcF9kaEnHIOxYTMCIvj3oSuHfz3xL5W8l6k+wz1swbtuhVxsTDqSugwsD
         w76w==
X-Gm-Message-State: AFuF++nT3G42hGCKIBppvftWBXibyN6oTwaO7IDB4mm76Ttnfl/6sh1j
	nefLTTBJ2w+7XnTOftYKrTFspO4mGcckbitEZsDSM+sEN3yBZVBOPsQoFL0v2Oo4d6GTDg5zVFE
	rmfnNMYyfJ00Zy5VoCGqCg8rZNaRGC1qxxLoojSs=
X-Gm-Gg: AR+sD10tgy5OJfNowv1Pt9OnfVhVL0GyrFX8XrdibPADgvL+R5HrQSpbS+4pBv9Xi2b
	nh9i9CT8KeNNWzDosWZN95PdyWateyrNBHWZAqGEOs/5JK3PiZETIckmozNoVlbR/Lo0CI9XX6P
	VmIQQo8ERzMSgBm4qtCqyQeH2AaRwOd1F4ECh8hywm+k2liprL9GJmIOylbr+NQfqbU5nq4mZSa
	FjdRq12+kLzloGZTENfPrq37naMo0aT94gHtrd1fXz7SgWS06htaY9cNryERn/7AKAyCsC4dOaL
	2fuw3bCmzIs4f6SoJgmvGDKRsD9qbNLuZTJeIQIzytIT
X-Received: by 2002:a05:6122:489a:b0:5c3:2f5c:55b3 with SMTP id
 71dfb90a1353d-5c5ff7a68a2mr8236180e0c.3.1787445381909; Sat, 22 Aug 2026
 17:36:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?VOLKAN_SAL=C4=B0H?= <volkan.salih.06@gmail.com>
Date: Sun, 23 Aug 2026 03:36:10 +0300
X-Gm-Features: AcwNN1W0_Bz7QYAT9V60rz2l4_bJDFUR0hstZX3hdx3Ab_UhZbX18RbGhS9ja7g
Message-ID: <CA+wWBLPxFPQB1Dt0MAJSNZ43dhGDspSD9jH98TArTf_etjLmSw@mail.gmail.com>
Subject: [REGRESSION] hp_bioscfg hangs boot on HP Laptop 15-bs1xx;
 blacklisting fixes it
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am seeing a boot regression involving hp_bioscfg on an HP Laptop
15-bs1xx.

System:
  Model: HP Laptop 15-bs1xx
  SKU: 7WG51EA#AB8
  Mainboard: HP 8444
  BIOS: F.75 (04/26/2024)
  GPU: Intel HD Graphics 5500 / Broadwell-U [8086:1616]
  Distribution: Zorin OS 18.1 Pro (Ubuntu 24.04 based)

Kernel results:
  6.17.0-40-generic:
    boots normally

  7.0.0-30-generic:
    hangs during boot

  7.0.0-30-generic with acpi=off:
    boots

  7.0.0-30-generic with only hp_bioscfg blacklisted:
    boots normally with ACPI enabled

The working kernel command line workaround is:

  module_blacklist=hp_bioscfg modprobe.blacklist=hp_bioscfg

The boot reaches hp_bioscfg initialization immediately before the hang.
The WMI GUID shown during probing is:

  5FB7F034-2C63-45E9-BE91-3D44E2C707E4

The system also reports these firmware ACPI errors:

  ACPI BIOS Error (bug): Could not resolve symbol
  [\_SB.PCI0.LPCB.HEC.ECRD], AE_NOT_FOUND

  ACPI Error: Aborting method \_TZ.TZ00._TMP due to previous error
  ACPI Error: Aborting method \_TZ.TZ01._TMP due to previous error

I inspected the hp_bioscfg module from Ubuntu's 7.0.0-30 kernel:

  /lib/modules/7.0.0-30-generic/kernel/drivers/platform/x86/hp/hp-bioscfg/hp-bioscfg.ko.zst

It contains the old error strings:

  hp_bioscfg: ACPI-package does not have enough elements: %d < %d
  Error expected type %d for elem %d, but got type %d instead

I noticed the recent patch series:

  "platform/x86: hp-bioscfg: fix ACPI package handling on HP EliteBook 840 G2"

including:

  e0ddfd77c0c3 - pass validated element count to package parsers
  1d143d78299d - bound ordered-list parsing by package count
  40e10e6cc8f7 - accept reduced ACPI packages from older HP BIOS
  b0e2af3ec94e - warn on element type mismatch instead of failing

The series was applied to the platform-drivers-x86 review-ilpo-next
branch.

Could this HP 15-bs1xx boot hang be another manifestation of the same
older-HP-BIOS ACPI package handling problem?

If so, would these fixes be suitable for backporting to the affected
stable/vendor kernel series?

I can test patches or a patched hp_bioscfg module on this machine.

Regards,
mr.Volkan SALiH
