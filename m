Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A601CAA6C
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Sep 2026 01:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788743521; cv=pass; b=oWpa9j2f8JhtvGWwEQyX/GsRHGZ5rKF2GFpCjrnAG4nRhWeshILHZmakm6EPpU+08YaERPI9ug9fOKQBurSmShZ0RCyCALmS4GjKeGK0OG+QsYnmnxThtAbyGKbIBeyRIYVk6ZzkYX9+z2B1OFiWDiDP6Sx6C+FGGCYA9eXsaN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788743521; c=relaxed/simple;
	bh=7V96YHpQ/UziaMZvPPIkht0HHd3decCbH3O1UM1inNc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=J+3kNw7Oay4MOAm8bDJhNh8cPEKntHgWNtyQTpRtZYgtp1LKdLKwI1wYsKfPujkPcijfYULWeAvFtGdRixXDEcqyMGcdxe5QuXxKO9p2TJN0XtCxcxZcBUAMDg9J8K/FRlkO4HI3F4XanCPbbE+jxs5lUHEAHVW3eTn6/58C3VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwf6Gv4T; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwf6Gv4T"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a46a53abc9so2687786b6e.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Sep 2026 18:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788743519; cv=none;
        d=google.com; s=arc-20260327;
        b=TdG/koOJinlCnTUdZNG8IZTm9FJE7cKxzEBF+uHhMHzXjBDwGQLNNs2QCVzi6xTsiR
         g4r4Fyyf/RYNiraMxjyNdpU5Sn3cHeBCXw+9Ts3DG27yeSL6rkuFX3XFzaJIv9SNDjnw
         70St9s6qIiDM8+gTo+CBGt3cleSYCDN40H5dYwo5dA/vBadbvhCl3pyvsyfykWGdDx7X
         DdyzvUIpw8hNmucgnYpKMk9MT/Y64uXGl7azTQ128qm+UdRrVK1KzO85HsGdFxIU0lDc
         b0/lJj+RBHXoifYnQdnGv3i00xUb0oDjzFwtRYR+Q8DyOMLcgp6fmdLpnlIHzwYmfoBE
         YBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=7V96YHpQ/UziaMZvPPIkht0HHd3decCbH3O1UM1inNc=;
        fh=ImZAbQNqaN4NWMGiR7beqXZyNF7MBj1Ud54FGFLAEkU=;
        b=P8SmfRIzkWLGGydjeWSCbtAQ1qX6tRIQBU/te0jd9XtMePTeGn8J/g2ZAJLTut0K7Q
         RpIYDZ24eNKD+wTfi/bEpjmaI8L8zp1TN0wEJBFNfiG7qXVdQ3M4p1SFnC/qnLb3qMHK
         guC8gxswpFysWxumoLh+JtptK/BwVpwbr5YIKOuaGnfWf6Zex8Nq8xNdTN2m9g+YrPY6
         MGmHaYVRwfLwnlaz2DGMnGdi4L31XLksqNYPfHaBge5SEm00noeQgbPLmfNBiZQReBvB
         A9fCdt3fYvx0NEVpcsyt5WlFTDBX8dXFEw1YGInto/sY8kKUAuDLFPMNx8fsiL7qcL7g
         PCXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788743519; x=1789348319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7V96YHpQ/UziaMZvPPIkht0HHd3decCbH3O1UM1inNc=;
        b=qwf6Gv4T9fkp8O4C5CzO/nJ7OJUED0G/kc39pA3A0flFG0Z1MB2zfArk/O8d0Jan2s
         5ek0fHZHD00M33/cFQd+BIlBxkJA60pjl65ns9CmHoX1tBCsxzS5FaQvO4Gse/RTK6RL
         RCCgm/aA0RF4quNchMEdbm6SxMtezOMoOBfujN6Lk+knNaQeMjpffC6OO0aTCLbByOtT
         GPT9KL3E63pp97db88EjzbqBgos1Pa0QBtInhzK9CnufDcep4/CQvJj35j5xawVLgcSx
         KDNclqI7YvwZPN9gFjtTwOATPtDQbTLoPzZ0ECOT7avChibAjswYFDPxnouCJg2VOE3v
         vBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788743519; x=1789348319;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7V96YHpQ/UziaMZvPPIkht0HHd3decCbH3O1UM1inNc=;
        b=kgz9Rb/L3HdLeL/B2XlcWz3fkFREkZySpWPn+q8ZtuGxa02hcQmWSGn8dCw2XTE0JH
         6Ba85xGY37WhYX/Gfjt/mWxwfGstnKpKJ3ghz4RK6Q+ZvLceAG9X7Nv/f5wdEUCjGLJQ
         dLHfZfgeSU9mqNEKAEJwUV/fp0z9MNe/eg6eqNiUgrsgtV64e3iK3vceQmfvdNhBc5as
         0dPabcP0ympVz2paW6BifAxjo38GC2sVO7Mo/AZAxQW4D9UXRdANlgehRu5qlZ7F6AtZ
         BFWV7sV+4Z6gWbYz3WvkuviRZgCabpdFRt3mNSjnGbiCW6mXTgUJw33/dF5oJN7Pfm+2
         BKWw==
X-Forwarded-Encrypted: i=1; AKwUvBz+Aary+uVLcsibENv113Y2Qfp3JS8V6DpVbW6KyC4A+Zt0OBVfnRyQDwoT/V9L2rA31b5dsuT590lAhYa5pLu3tbMD@vger.kernel.org
X-Gm-Message-State: AFuF++kXm4MmGYzcpXVRMMIuNEj/gXTFGXN7ivt9YtYbjBI5oDv2OYHE
	8FFuNBNDpyDjPIF2o3aHXfdn58wj6bebGxjyyafhlCJgIUCO6AXF9SUAOvRbuLQK02X6g/BU2Te
	T0EHe1JpEsnVa2d6xwN2ricyaHTl6WnjqHlCU
X-Gm-Gg: AYBFou1+fvB8ff8aVvb2YpfIQTRbeJj713S51NcLT8jASqqn1+wUbwRUFY+CnHD/eQg
	6uQxHm4gpk3UiX6gimXjaqbASGlvWWxrKEZ6aYwYP1FLza6MHuyOXdENQDof3BPo93hjhc+6Lq/
	NS+JEychherRsYJVnfzc0JbIRLjRnmsTWDUMfHaezH4fsWUslN0ItPD+kPyBSZscJpyxJh3GuXv
	i8Lp0JntZ8fDzx0OqsScMc9rgy2wAaHx++7CPjM//3CnoFZOG8fQcvU1n9VqvF4mm3LlEpC72CX
	wWfPp/5Fsp/rVcCUyy8W48JL8x1fEahuB10htXdlLqRtgMY5kRsiGnD5rWW1E/NNBxh5cT4cVMn
	GpGI1xYXn75alkWCS3U6hyzshqqkszOkUqun6upncUShL1LwIps1JgrFSQZano6AE
X-Received: by 2002:a05:6808:251a:b0:4b3:17ae:16dc with SMTP id
 5614622812f47-4b9616509e1mr14411599b6e.9.1788743518709; Sun, 06 Sep 2026
 18:11:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?TWFudWVsIEEuIFIuIGRlIE9yw7plIFLDrW9z?= <deor001@gmail.com>
Date: Sun, 6 Sep 2026 22:11:47 -0300
X-Gm-Features: AcwNN1WfCwyE2Thp24qJQjB-cmbXW2y9wnZ0IdGosAFwnibz2ilZw_V_6bfHbQc
Message-ID: <CAOXykpgCPMB7fGGJXD0wdx-0boy3vdRZraFRhegrh7azJiYONA@mail.gmail.com>
Subject: Dolphin (26.08.0): "Expandable" folders in Details view not working
 when per-folder view properties are enabled
To: linux-kernel@vger.kernel.org, denis.benato@linux.dev, luke@ljones.dev, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Denis and Luke.

I was wondering if you could help me communicate about, and get some
information regarding, the following topic:"
in Dolphin it's intentional (a design decision) or an oversight that
hasn't been addressed yet.

Environment:
- Dolphin 26.08.0
- Fedora 44, KDE Plasma 6 (Wayland)

Steps to reproduce:
1. In Configure Dolphin -> View -> Details tab, enable "Folders: Expandable=
".
2. In Configure Dolphin -> General -> Behavior, enable "Remember
display style for each folder" (i.e. GlobalViewProps=3Dfalse).
3. Open any folder in Details view.

Observed result:
The expand arrows for subfolders (the inline tree view) do not appear,
even though "Expandable" is checked globally.

Expected result:
The expandable folder tree should work regardless of whether view
properties are set globally or remembered per folder, since
"Expandable" is configured as a global Details-view setting and is not
something exposed as part of the per-folder properties.

This looks related to Bug 524626, which reports a similar coupling
issue in 26.08.0: the new per-folder zoom feature is tied to
per-folder view properties (GlobalViewProps=3Dfalse) with no way to keep
it independent. My case seems to be the same underlying pattern =E2=80=94 a
setting that should logically be independent from the
global/per-folder view-properties toggle ends up depending on it.

Could you let me know whether this is expected/by design, or if it's a
gap that hasn't been considered yet? Happy to provide more details,
logs, or test further if useful.

Regards,
Manuel de Or=C3=BAe R=C3=ADos.
___________________________
