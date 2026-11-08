Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794152465;
	b=tnBSLBdirYIFBtP3Kag4pdwYK0ir1YW3ZP69syBunNTbT8oxBroDsNM4fiG5lhILlaBk
	 EV/1L09uPx2jimsVOQ9ujj5KYboTYbf3fr8qOO22VPAdtAJsxva8JN8pMPYFol1e6rUFD
	 RlEKETc6BTbosAZp/yh5a33dEApS99/JdO5FjDOiY4pbCiNfn9/bG+HgRPmmOiz0dH71K
	 T10jr77iOxXkYxZSAppC/3JuyTFXfBQvvkiYlb5XO1oavoXz/XVDrrt9x2K3nK+LXXbAh
	 t25YKYR7TvoPNJwNVdGzA2bh4g2+3izK9vIb0Vh3s+WXnCANDD+qx5s1HjbgdESLTZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=TI/AUGZciwVPY9wI7Ypz9QfScP10dM/co7oPtuQApfg=;
	b=cuBA54oj4taAWFNRrd6vYAnJI6k+/WeT707rb9Z+hjcUCD/fCr0tcxdr2/Axw7wDOVOt
	 mifDNrgVDCkdgdqmr1OiAHVHUepRveqX0iqKJT5rokVKeB5ax34z/YKIiJ22zsPV1LB73
	 sf3dgT39Q0UA99EZeRpyjUTSqsE/kH8pk9EYaJRG3ZaeDh6uVwGrmQxl1mFJKWawVsbQT
	 OzVrJwouoZyoEzol4zcWMultcmtfHwrklyGX2TN/MMnp/57FZYo/Q8D4T5Lxyfmc7t43C
	 9b2jXfFbeeGwNZzfUOV7qMbZqGkyBKcVv+KtIL8/F/vFzkkb/t5Q7vAGbx4gmzwNoEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=shG3c5mc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967C3606A31C
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 15:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=shG3c5mc
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1adbf62dd31so175436c88.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 07:41:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794152464; cv=none;
        d=google.com; s=arc-20260327;
        b=a1TOVpEAm5wcmUfLc5DzN1tmQCSVgtz2ItlhlzoFJ/hq4x2i0jrOWaB7CWtdXTwZeO
         D6jm/epTYqBaY9HXymhLokqOV9K3n6dLoKJZb5t/WbbWV6ukvlQsUurSxRFFERQDdaag
         A3flDimy76Txenk10VNEg/1rV8TUrHa3BXPEtKiyA3Wq7lT/bbgbcK/MNWmjIycStWsu
         Ajr1RiufHk3rXySTr0wUGDFqJtX1U21MJhN6UsztrF/zQAW9XONoqTsRTxeGFt4OU1x/
         de2Z9FCkqSnVXXm9Hv08611KSw9hpCUacbSAYtj0RqW8y9UIRG/EqgAZkW9wnVGJxvQ0
         XfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=TI/AUGZciwVPY9wI7Ypz9QfScP10dM/co7oPtuQApfg=;
        fh=gxy6PnQWsnKs+GdPpLQkyZnxq641YP7gkuXFkxLxVcs=;
        b=b/SetPZimIGLs9KzgTtOKflW4NX9yMRFlEkmNmHe/Gy0VvIlvl9gLDntWVdhOBq9dQ
         FjrpMuNvIeGGYqiStvcAHNC7Ll+Sctuux8GrmijNxw8AsbgoYyByDtzxYOR2QjR68i5P
         Z7fL462TZew9eUux/LfI6NWDo/zqTGRnt3HyY8ZO5GaxNArk4V8o/sNOAFTY15FwLwlC
         3QyQJnCG6SIIjgPrprTgtfyn1g6ZHmnfGCS8413cM+r4GlN0i3g1c6tSJyV7m42UIqSJ
         HpAOR917krGXTfe+0gyRTaPeITf0Iuusc7wwxBVCnsfPxTfVWfBbZglT1V23i3xtN8FP
         PZ0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794152464; x=1794757264; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TI/AUGZciwVPY9wI7Ypz9QfScP10dM/co7oPtuQApfg=;
        b=shG3c5mcpCwhyjR2HL2YIc7GBFy6VHvfOYWYQyfYukC10ieSYhh9Y162u2whHB63QV
         HlQz7HipJwbLBfcHhOyggrxJQE2XtuSwjy92LQtsiYOCs4B4BP4yqVLTgguX+yr9H5CO
         8+bOWY3KzMzDpxIxMsNVijbuHoezjJBpNhyfGSJlDfL4YPUlJZbOUkRpzLS6yzysrlka
         xzUCzwTyOfE2rOlegDpiZRetrtZHGVR/hZ1EPI19RJxIbdJYML+tkXKFE9BIjqKt0GJl
         r0sK6uLX9Xc5s2UT/svdGcWuDTSpnm3EKidXsLvqYuB4NdaT+byY3000L1Jrsfu+qICL
         6yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794152464; x=1794757264;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TI/AUGZciwVPY9wI7Ypz9QfScP10dM/co7oPtuQApfg=;
        b=1eI8uZC05hqDAGHJZ7Oh0wKUd2q2cmLNolLZVwc6kaLkVIikduaz5E3qQ9sv/nPL2x
         1I14x/lonw7Cl8qlfcAU6ONOVw79XDU3CSqYH0pX+Phn+feNHLHU8wZ1CFL3we741ou9
         JAET615WduNNpzPSuP0qOyeR71cXysG5FmevncXKuML2bl3q0ilXHnpsvTh+EeqfIK0G
         VTq6b7nSahCen4eZwfWDVD5zz/KQ9YmYi0IzKqNdvnB7zxysKrmFItGRMzP3rDyzJDFY
         eUzock4J+QD8Xky+ffHpDC0wpzL0v2nz7JpoKh9mVOgZm0wfRaQaSMIoeUfrt0V9nYxh
         ZM3g==
X-Gm-Message-State: APuU4Z9voXFcja02T0dpXNSMid374i52Vg86TyUHIV4tvelAcyfTmbwX
	XcRWqGZd368Z4H5rYSLVS2In5445pzZTAPeFmXs3Hm2HzUQ2sx/prDtFNN7B7IBVB2n9qn3UX8b
	B0jLuRueQjj57r3gAZ1H8Q4oQptVRn3U=
X-Gm-Gg: AYBFou3q+7ZozfLDFCeD9mhJNObOX7zDX7VjKZRfiokKnWtenU7c7KlxFP0iPQVizeq
	bvK5U5vHn14zSVVCa/+IDJeTa6nPzq2LUnIN5/duSQy+FGyPfO3ypA+QYWnYdDEyilfFEEyPgkm
	JX7qERAm2Z+4XrJjw8m2EMNPTat7ycHQJSJLgubWkO/0Db1rK7yxClwVBFQHw3WVLDEGNWoOyeH
	EudR1mrLSdnoexJDCu9LmNnpQTIgUHoBPUcNiEDo/34yr7ZKQ39oBt3fVxUHcowp9KN3jnvjsJF
	oyao2rJgPj/Dkk5d0+SNwzmfCyJzAEhASj5szMi30GVs2POcvT/wV6eiNp+vLtP9YRUBOuSuczd
	ZkuBp9d6V/E+KrMj46ai+7N5RSk/3RDaMDvZKjrT8qG6Jv3Zf+pkOk00bHAzd
X-Received: by 2002:a05:7022:1309:b0:148:bc4a:8356 with SMTP id
 a92af1059eb24-1b39feaecccmr2228737c88.28.1794152463457; Sun, 08 Nov 2026
 07:41:03 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?0J7Qu9C10LMg0KDRi9Cx0LDQu9C+0LI=?= <rybalov.oleg.dev@gmail.com>
Date: Sun, 8 Nov 2026 18:40:52 +0300
X-Gm-Features: AclHuK-WFGDHmxIeaNgit3IU_Q4J-eaaoStqVsY0uA2NoDy7gva41C3EZw72eME
Message-ID: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: qby140326@gmail.com
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	regressions@leemhuis.info, regressions@lists.linux.dev, shlyapugin@gmail.com
Content-Type: text/plain; charset="UTF-8"

Same model line, different board and CPU vendor: I see this on a
RedmiBook Pro 15 2023, board TM2209, AMD Ryzen 7 7840HS. Adding it
as a second affected machine plus a few observations that may be
relevant to the quirks table.

  XIAOMI Redmi Book Pro 15 2023, TM2209
  BIOS RMAPH5B0P0909, EC 1.9, USB-C charging only, 100 W PD adapter
  Fedora 45, kernel 7.2.15; identical on 7.1.8, 7.1.13, 7.2.7

Same symptoms as reported: performance and balanced-performance
return -EOPNOTSUPP while charging, low-power is accepted but reads
back as balanced, and --block-driver=platform_profile restores
working profiles via amd_pstate EPP.

Three things I have not seen mentioned:

1. On this board the platform profile does not track the effective
   EC power mode. The budget is set by the Fn+K OEM hotkey, which
   cycles three EC steps. Measured at the package: ~15 W, ~35 W
   (the state after every boot), and a top step that bursts to
   ~65 W and settles at ~54 W / 4.4 GHz all-core.
   While the top step is active, laptop_profile_get() still returns
   balanced. So relaxing the AC-type check alone would not give
   userspace control of the power budget here.

2. Ownership of the event GUID 46C93E13-EE9B-4262-8488-563BCA757FEF
   flips between boots on the same kernel: some boots redmi-wmi
   (input "Redmibook WMI keys"), others bitland-mifs-wmi (input
   "Bitland MIFS WMI hotkeys").

3. Writing 'balanced' to platform_profile while an Fn+K step is
   active is accepted and wedges the EC: package power drops to
   ~9 W, all-core to 1.0-1.1 GHz, Fn+K stops switching modes, and
   scaling_max_freq stays unchanged so the cap is firmware-side.
   Only a reboot recovers it.

I can test a TM2209 quirk or any patch on request.

Due to a language barrier, this text was prepared with Claude.
