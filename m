Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602752;
	b=x1Bc+AAe/pR1BrTVjrOnxRSRyGR/twtXj6fITnQiq9hy3dqxyY4i20WhqKrGsf05OjWr
	 ymv6CRY1rKpiEdoOFTd0ZVJVmOfGf62CMMX1bW0UgMxdlpY5M5nDooIgTRbkxmVyd+so6
	 nL3UDfnjJ481BXOqE4aFPXxr71y720KMF9aljPnRH6698IJSpxiCD75TQbOXpiS9/EqHy
	 QVaJZ+6hr7Py7adiU7nwVfhWrYagouNzX9SRFW8+t4vW62W/IxB+wsJIeXeiPXePTdGHV
	 zam8kwzozq8TgqlfrkS+qI6MxnaF+L70RUimFq3PE3elW2qqb1+mGd7CJpRXHB4iTwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=7/HRJ5V+YHnaoOeO8g2mfxmgJx1rCpn6hBlYLiWLkps=;
	b=mX0IQHK+qaNJgdcU1wUisS1zHa9UV7JWXOsiTvec4FJe1h46vInK50Ll+rm2P9tK8cvQ
	 cCN7IGnPbwfvaUxNVzRv4G7pxBt7T5V2TYU+bfshTmdqiZhOyLLsE/DOu7Diks+oe+ciy
	 s/ddvFmTBdLnQo7mcbtq18D34FznGAV8CdpvLSlSzMym/gyIecw8wKJIXgXM/wG9Q4YhY
	 F7EmDaDAw7bMIgc/E6K26goxltXcG0cfw5GDuD5UNUrvKqYWCUYQYW+GS0wbVFj9cZZXT
	 jXxFTycqCVamibfgIN9xmsOKxdFARWZ4JNoze5DDJtV5r3QfmrMjvErsrpPvboTXCZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L2kaPEUn;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3108606A327
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 20:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3108606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L2kaPEUn
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso2724006a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 12:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602750; x=1795207550; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :cc:to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7/HRJ5V+YHnaoOeO8g2mfxmgJx1rCpn6hBlYLiWLkps=;
        b=L2kaPEUnZb62DOyhhTwmFCxwJq6577CLx1IswptzYwJq46F1P9sQ1TehN8XX6RCK4x
         7sprGSDeeiLUO5Jx9EobbXINgkt5Z16J82AjyW589/7vQdiJ17buHLg64JTYDMSR5jwm
         bkjcwSGLP3mfmnS2hPYR4zfs+15LwFmLN+C/Ubl/zijrbT9Vx3gko2vioi99y/CsphUs
         jJbCHnIvYFqsDuvuEGGAHms7PyWMOMCyOvS6kSgMOem6OzIPFyvuTfl61iagbDvaG8Wq
         qC4OQauIrdTMCAydAlD8Q2pCk+NG+M4JSegLo2e34Zwr5ExKzBK3H2ZLwmTEYXyeONq3
         AYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602750; x=1795207550;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :cc:to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7/HRJ5V+YHnaoOeO8g2mfxmgJx1rCpn6hBlYLiWLkps=;
        b=IlAkPde5JgvSEnJvZCQEb9QyB+OrIaXFGxDr+mG/F7cu4B9iEIN8bJUOWakkMk/ec2
         MEjy6Gs9Z8yI6ZyMq0jXdXyMbCJUsnfgVz3TyauOmLW80NBBqlq17+jjCajGrraoIP9V
         HcIxOR9KjsAFGRzORfDpO29qUHCjr4cuNAxmwkIlG01l3QYxW6zl5vgKY2rg/7w504xd
         05c3vfurnnPmdPMirxpviqveoYEY3ub1EJ06ebCb01Fhx0wyXgg+e+pByzWgPZ1Tp3Us
         SIxNp9c1wnlGXAIEWEkx66tcSE6c8zNegyGHPAfh0tKQHP1zrCDwcaQ20CNMSBPbHs7P
         fgSQ==
X-Gm-Message-State: APuU4Z+dKYGFj0aKeTJoeV/xNIAnJLxP8P4WNDHMFyd+uUaSm2W0TjDg
	QYpcx45phs+0TIfmRrzitdvKBstvQbyjZjOo1O2/US0WFhV5dLmOIelJ
X-Gm-Gg: AYBFou0SoqPiVbiTeC+iCE3WAe+14Pkb6m2aeGeIx4kVvCDCiO90dn3ChkQCzurXB84
	TmGZ4ZPc1lkuoYI/TpgpitY3qQ7MPPL0KpxqyI7pdX0b9mKO6kUpOdONMUA2bq2otw2lB+DWYV1
	8rG5xcIZvL1C+8iSy1YtVz+5uyR6VJu2UPGCa/zVzbKZJFMfnBREX2lMBgIa+UQpJxAh3C4Ye7W
	0cxJR4vo6uaxEasRIUqSY67zKC0R4vwPmO7Hgd9mc2SSmAxkzjhBPvVnzTyYPYKjyYzV5KR7Nut
	9oeRqDDV6r+dVIIK3kzBPmvU+3draOV2YdgcigybcLzUjAwuXp/iLSvn808sn9k/xmZY7Rvf7DN
	xDKIKn0Otojd2t7U9zf7y85BuQsTaEsRmuTejk46U+tPYUfejIZkX4Ua2hzG4a4X12zWP65CypW
	YzkhVh/TtEQmlciVSAj4ATOtQbG/74V8kS9KHAmb0rxcjrmQu1rvhTPm+SASp9qF+ZNWB3GuwTU
	OcuTkiqzsqvH8wXO+RpE10etdAuCvnRMYxHZSbnlgR5RobT8NNtiw/Kq8Dw7O2QQDt12S6hTrED
	sTGoORPntpbNJVpow39nfB0BFEmTPKT7Fw==
X-Received: by 2002:a05:6402:a650:b0:6b4:73e6:dc9d with SMTP id 4fb4d7f45d1cf-6b7c0ccfd2amr2595139a12.41.1794602749771;
        Fri, 13 Nov 2026 12:45:49 -0800 (PST)
Received: from [192.168.10.4] ([149.143.93.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23e592esm1347908a12.27.2026.11.13.12.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:45:49 -0800 (PST)
Message-ID: <df721493257c41338324f0bcf37e4b4d2d0ef7a0.camel@gmail.com>
Subject: HP OMEN MAX 16 (board 8D41): backlight PWM is generated by the EC,
 no Linux path reaches it
From: "robert123m@gmail.com" <robert123m@gmail.com>
To: Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Date: Fri, 13 Nov 2026 21:45:41 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Hans, Ilpo,

On the HP OMEN MAX 16-ah0xxx (DMI board 8D41, BIOS F.20, Arrow Lake
iGPU + RTX 5080 in hybrid mode) screen brightness has never worked on
Linux: intel_backlight, nvidia_0 and nvidia_wmi_ec all change their
sysfs value, the panel does not change. I found where the brightness
actually goes and would like advice on what a proper fix should look
like.

Findings (DSDT and the steps to check them by hand are in the repo
below):

- The panel PWM is generated by the EC. The duty cycle is the 8-bit
=C2=A0 field ECPW in OperationRegion EWRM (SystemMemory 0xFD400C00, offset
=C2=A0 0xF5), range 0..200. ECOE (offset 0xF4, bit 0) reads 1, i.e. "EC own=
s
=C2=A0 the backlight". Writing ECPW directly dims the panel at once.
- The WMI method \_SB.PC00.AWMI.WMAA (GUID
=C2=A0 603E9613-EF25-4338-A3D0-C46177516DB7, the one nvidia-wmi-ec-backligh=
t
=C2=A0 binds to) ignores the level passed by the caller and does
=C2=A0 ECPW =3D GFX0.CBL1 * 2, i.e. it copies a field from the Intel OpRegi=
on
=C2=A0 that i915 does not write.
- The panel's DPCD advertises PWM-pin brightness only (0x701 =3D 0x83,
=C2=A0 0x702 =3D 0x81), so AUX backlight is not an option.
- After boot and resume the firmware resets ECPW to 100.

Workaround I use now: acpi_backlight=3Dnative plus a udev rule that maps
intel_backlight to 2..200 and writes ECPW through /dev/mem, and a
system-sleep hook that re-applies it after resume. That works, but it
obviously isn't something for the kernel.

Questions:
1. Would a quirk be acceptable in which a small backlight device
=C2=A0=C2=A0 (e.g. in hp-wmi, or keyed on DMI board 8D41) writes ECPW, toge=
ther
=C2=A0=C2=A0 with a video_detect quirk that selects it? Or is fixing it thr=
ough
=C2=A0=C2=A0 the OpRegion CBL1 path in i915 preferable?
2. Separately: on this board the LPS0 _DSM puts the keyboard MCU into a
=C2=A0=C2=A0 mode where the backlight and F2/F3/F4 are handed to Windows so=
ftware
=C2=A0=C2=A0 (all three then send F13, until a full power-off).
=C2=A0=C2=A0 acpi_x86.sleep_no_lps0=3D1 avoids it, but then the EC is not t=
old that
=C2=A0=C2=A0 the system sleeps and the fans stay loud. Is a DMI quirk on th=
e LPS0
=C2=A0=C2=A0 path the right place for this, or is that firmware behaviour y=
ou'd
=C2=A0=C2=A0 rather leave alone?

Code, DSDT excerpts and test notes:
https://github.com/RobRobM/omen-max-16-linux-fixes

I'm happy to test patches on this machine.

Thanks,
Robert

