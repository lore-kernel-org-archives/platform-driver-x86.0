Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5FE385D69
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279396; cv=pass; b=csoC/aiPixK9Dth8xW9aY2B8cyKeUTGTF+6jGaPPZsVTixDqavMMAaVfk6sEBaXXOU6FKdLtDAgRVQhqlJ5BBqTdAYRQ1zFGLpuq2vz/XuqZ2xkRIxz90Sy7LDAyVaVCSxLV1FnU1XCBUWqn/Dzz2yoLofrEPyiKd1Crj+vaFRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279396; c=relaxed/simple;
	bh=JBLgczNWj2mj0B98al/nFtFr6LAZks31bcQ2W//IZHo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=f/NwzJUTobItA6/UC+7AKI7IzmgK+W0agKEB9qIBVaSGdrKaxe9fiWPBF+nRtBgdXlsiHsjHw9yAF6KFFsQo+J4e3dJL5dh1shKymg8F6Tjrjr8nrdDAdgrFbeghHYC0QfpKXDt9SSmpTBmDc7w2ZIKiundYYGZ2BYKsjCkUbdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNQl/xkZ; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNQl/xkZ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-88b7d853b11so1265830b3a.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Oct 2026 02:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791279395; cv=none;
        d=google.com; s=arc-20260327;
        b=Ec2HloPmcDgVg8oZW2BXZ4FxnCSDkIdbbQTikmuiBinpycYx7lXIhuvBSPu8zoGPBq
         Py2lmaIDehCz1FXc0Yw8h1dGWL4fahJ1xgedKhZRt1hKYiWSc9GmVfO+AQ09IM3T/qkf
         vms5zS1vhXSDiiYlxincsftGl+ZSaaT9N9ABggkCripGCNka9nESLFFlqGNXvkT9uuWE
         XxI5YvZeMghzmTuPBlj3O3ajsejvE4PBXFPh/H1vd63WFauC2gRRM2hAIrkac4y6eHsI
         VTFQGXi5pyR636gzqo0eWCgRi2wusEadyk2GnmG78NGlYfp8z1HH0+Emqyc7kHjMr6dN
         o/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bQUlScN7YbIg88NUbKU0fEs42VcZXXyep0FiQ8u52iA=;
        fh=sfHqGQOkMIZoPp6deBj4nTQnO/kzdAWeRTMsgPOKq7Y=;
        b=WUJBL4qAZ8s8JqbYFwPeqI+sQCcYVnNmxwrVZds1h6uYaC0hF4MBLR2kTgBDGHKhxD
         agX0aWl1RqXTdMTSZScOJyFg3kUpt5dp9Ur8vDkJPrmvqukb/RZG6eBIPzrOy7m/b+vh
         x6WjH+h47OQeLo0t2+o328UTw9lN4XoTh6fc0wVeQ6wXdBq2l4ko1mkk9FYAHW4NHX1T
         bHNjK/gM4oa4lgDBFs7ZhfjyTd2nF+1ar+EILpDgCboREqA0FwJ5owZrxuCX1pmWrHJE
         y6c4aEZgo4j3fARFhuWCUnuxw+gH+3XF9jT6FW108EY/x6NBuWr8Rd//WgKzGZPJ2duC
         ieZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279395; x=1791884195; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQUlScN7YbIg88NUbKU0fEs42VcZXXyep0FiQ8u52iA=;
        b=RNQl/xkZ5tgxNGS4Wr6asH9+GplRfWtaEsgVXYAn103IiXgxhIk9+5gP+hAzcRHZk0
         5uEIXXHKUwFvOMowiARs1octKz/JGjPjCBZBDPqa5fSCn3Gn1dfHokRpMl69gtv7k9Bl
         obLLQJNa8Z1N+GJc1+9lBfEgzqMXVUl4npGaiEVwFwaBbbID/u7SVDlIU5DKcWKG993c
         Lc/SpK0jncenXpLeecZ6WMJBB4WZtzqOrGGHyPc4693RyFt3BpzCPZMLnw0YA9SukiXH
         kOLCzHg0VERJ/XXRPY9xrKVIpx9ldmneNz+//iAoP3fA8vPx2WeO66oPVq/g5X15qDay
         9Pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279395; x=1791884195;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bQUlScN7YbIg88NUbKU0fEs42VcZXXyep0FiQ8u52iA=;
        b=gDv4/Jq7BqiJZ5JV6dzuTjbQ/upnkJGaT4Bf0H0We08PUMhFr6cHltoefxyC3f+bUa
         Qmul9Tan69uNenpTdQRwdU+NXCo7gMXIheIAFabo20blTqJ/hzH62rAFwc0nyhfnwypM
         CV47vYskb+0Pa6A9BME09i7hvilu5WwD/GVa8mjVOUEdqzgl0R4MiADI9N27hNoP7Fce
         J22dnh8oBB/JzeKIx1mvzWXh+NaOzW2ZCF7iZUpCApv/Te6w3plZWmumr8ZEmjPVPBjO
         gRqSoq19XcG2qc1VfPboahlAgNE/v7SCgkm4tu0dxAUNfi8RQQrgfc6WI2r/wJ8Qut7e
         Mnsg==
X-Gm-Message-State: AFuF++mLU2qsSQ7tCmidrCFm33mArkYmt0Jcpt68qCAWGjh95/zGfO/f
	15+JLYhF6jBq9ovWKJrCzOzaqNl7x4dsP002jFETLoyrk++rGWWoY0+GRaqBSm4rgGYsrp/iXbF
	8KKg+GYKTeLX1gCt5373D7Hqn723Hzt9EAg==
X-Gm-Gg: AYBFou3wjsHlDbIiUiKnmRf9szN23j51mQJtYI/JR6VvFM4FdtvnD4hND68I7YYy2j0
	VdalAcvJjny2sA2q7jEfDPsET1C6S9lE7Rr/z79d0W+phPumrMG4X74OFs9CWowntY81+SsfnBw
	AZ/6vUEg2vV2v5xaxkbB4A6cbZjRhekeXujALxs5yZ6RY1Y5lKfZrUwlgwY+z63WzqQktuEG9dB
	HNjVJRxG4urSp+JCI9CgG7FDaDj/tE9mbExEHRIMloTwKhg7cRCvu2Ji9s92wpPRRr5BCLmuJII
	CbcJv6QJkLDfGII0671NBMdakfsbWkCkzjfCPMtv6+xgq6MDPUJfMGFS3iI7tH6z
X-Received: by 2002:a05:6300:2204:b0:3de:14ad:ae8a with SMTP id
 adf61e73a8af0-3e0d6b5537cmr9089323637.16.1791279394514; Tue, 06 Oct 2026
 02:36:34 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 6 Oct 2026 11:36:33 +0200
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 6 Oct 2026 11:36:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: zsanya322@gmail.com
Date: Tue, 6 Oct 2026 11:36:33 +0200
X-Gm-Features: AclHuK_4FiyXD6OjbTayyRzPusefFQVbKIZAvf5hjOiFkTTydkxOdph6VCyP5Gc
Message-ID: <CAFpZVRM_A9K+6-eFy_zfC-8gE+3r7pcdhgU+3M3g_XdQ_SJdiw@mail.gmail.com>
Subject: [RFC] bitland-mifs-wmi: optional Fullspeed and four distinct modes on
 RedmiBook Pro 16 2024 (TM2309)
To: platform-driver-x86@vger.kernel.org
Cc: qby140326@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

Thank you for your work on RedmiBook and Bitland laptop support. As a
RedmiBook Pro 16 2024 user, I would like to suggest upstream support for
its four distinct firmware modes, especially an optional, explicitly
selectable Fullspeed/Geek mode. This is a proposal for consideration;
I understand that the interface and implementation need maintainer review.

My machine is XIAOMI / TM2309, BIOS RMAMT6B0P0B0B, Intel Core Ultra 5
125H with integrated Intel Arc graphics. I use EndeavourOS KDE and
Linux 7.2.8-arch1-2.

I found the ongoing per-machine ops discussion, including reports for
TM2309 and the four-mode test on TM2307:
https://lists.openwall.net/linux-kernel/2026/10/02/8
https://lists.openwall.net/linux-kernel/2026/10/02/47

With a local driver workaround scoped to my model and BIOS, WMI SET
followed by GET confirms these modes on AC power. The corresponding
Intel DTT odvp1 value also changes:

    User-facing mode    Firmware value    odvp1
    Quiet               2                 2
    Balanced            1                 0
    Turbo               3                 1
    Fullspeed / Geek    4                 4

All four controls were verified through a local GUI, including the
return from Fullspeed to Turbo. In this workaround, Turbo and Fullspeed
share the power-profiles-daemon "performance" profile, and a separate
control selects firmware mode 4. This is an experiment, not a proposed
stable userspace ABI.

Would it be possible to cover TM2309 in the ongoing series and keep
all four firmware modes independently selectable through an appropriate
kernel interface? If the four platform_profile values already discussed
are suitable, that would be preferable to maintaining a private module.
Fullspeed should be an explicit user choice, with whatever AC and
firmware capability checks are appropriate. I would also appreciate
guidance on the userspace work needed to make all four choices available
in the desktop; I understand that a kernel change alone cannot add a
fourth KDE/power-profiles-daemon button.

For context, a short AC test with eight CPU SHA256 workers for six
seconds per mode recorded MMIO PL1 limits of 45/49/75/90 W. Mean CPU
package consumption was 18.47/43.50/42.41/46.67 W respectively. These
are observations of adaptive policy, not requested fixed wattages or
a benchmark demonstrating a performance gain. The power-policy result
also depends on a separate local thermald workaround, which avoids
initializing an MSR limit from nominal PPCC on this exact machine while
retaining adaptive thermal policy. It should be reviewed separately.

No thermal protections were disabled. No new thermal-throttle events
appeared during this short test. Fan RPM is unavailable through the
tested firmware command, so I cannot claim that Fullspeed means a
verified 100% fan speed. Reboot, suspend/resume and AC/DC transitions
remain unverified, and I have not tested the exact current upstream
series; this is not a Tested-by for that series.

The collected measurements and local patches are available if helpful.
If this is already covered by pending work, please point me to the
relevant changes. Thank you for considering the suggestion and for
advising which parts belong in the driver versus userspace.

Best regards,
Aleksandr
