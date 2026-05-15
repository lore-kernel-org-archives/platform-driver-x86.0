Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CEF3921C0
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 20:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876702; cv=pass; b=VI9Pk4x6CrlaajnsGhiOVcmSoZWgVbfDZWc0tHFuNAT9ZY6sGDuzwabG+7k7T0Nj3AtM6ZiGt7xODOTSh24gK95XcEFMhz4P73kHQQmFSzaofmwn8mxqaTeXBa01pwOtvnN11emnupQXPFZyl/QkZ8mQq9UMolWw2nvb5VJUmF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876702; c=relaxed/simple;
	bh=NJHPC1QJJMXTOcaIK1PAeFc+PvneWL3HUK3CCFL+tAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=siakzEd0yJJIcJ/wSr3PlgyeYK/ocfx64W/FY2Z+jNwHjbOwe1xBfcZMpXaIF62Ah9ko+KfJ59AV+Ekdp9D3UtAAJA0HOGc8OssdYssKETciN3uaXYOkRSfoZ5AVhlQWZAod9cfwW9SuvevWC3qNds9SVJl4Mu1PRvPIoJUysog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceGXO94r; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceGXO94r"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-47a063cd1c5so31049b6e.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 13:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778876700; cv=none;
        d=google.com; s=arc-20240605;
        b=VuNhjpeoRDx0zCtNy2J9bH0U8bC998sb2IlM1hM6QKwcEIHHT4JyaIVkzoBOu7tgmH
         GPQHtaJk3g5sbxmTJn/tUpF68LK8mG3W+ETVlTN4O6TuBWGAn3SG6TTMib/Ql2MVc5Xg
         NpYMrISNncFkozqZg/vjP5yaE9skElCXHa6QluzGlHq/176FF4+9se3TMD5xnG5zbRfZ
         ywhawTH5E1dIgABizCxgP2EgMkUtZn2cBUVUqISjamNVbpXSYmk88xKha9AZHwGGI5Yr
         fzaY2jBfGiIpLTfrSVV+Zy5oZkZ2x+f6cYJyaFFr78zukInEF99g32rKJs+L05TEjVjJ
         By8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NJHPC1QJJMXTOcaIK1PAeFc+PvneWL3HUK3CCFL+tAo=;
        fh=lf74MRqXscIMiDjrPeJPDcip3Da3LYDvmmMNuEHXa2o=;
        b=DBRnWfOhXB6y3yMkqpbdqPO1UABn6rhZ8Ta8XStESyOZSqsM2Akjakv3Lalf6Cigg8
         BP9MXFI+Zj/4zJjqTotghx8tFiQuR4NZBjsMa9TzTqEbFiAHw7HzCFGYRgCfIbamDT6d
         A8cSAz1MW0lYTk4s0FWSP0bjYSjVqenkSEsokr4uk7sGB4o/61bIjiGgoI5I9Il6d/lz
         byu1+FBVs4Ctlso7OIj9QkgYhDg2AdD4pyh8vysO/TqDyRRq1Act2ipM2bnrg1P90ivi
         ttfJzuG/K+r88QPAVBy8IxdMmpmyY4aE2WcSWHOTOo5h8Ni1DmRtA8sG3z0wGQ80mrgw
         5+dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778876700; x=1779481500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJHPC1QJJMXTOcaIK1PAeFc+PvneWL3HUK3CCFL+tAo=;
        b=ceGXO94rdmZVdvnQywOmFSR/KiPisqxg0FRlmz3wisLP0O5+ewZlEroYNd1SBt3cM8
         iDKMUKd8ZXHGokCopzWNPdH/7ROtYGczilxHgD9pNDUGrmWvU7FMznalDXScNhChJZJ5
         rzvExBQBrRZ1Ef1whL2xQJBQIyaI2uZ/ApjYvTMhC9n+HuiALOvG8XwMf6ci9fHD8lIB
         gZwlN3026ys27iwbocWs3wj+2eZfgsjf+33Ck+X1SNdhV29HVYAIH+366YaLZLFMVfmQ
         FviVc52xrc3cZAYUHy57QswOd2N2UgoxOsWttnNUIUT+LJ+sRuOTivpjjdSFm+doG0UR
         CWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778876700; x=1779481500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJHPC1QJJMXTOcaIK1PAeFc+PvneWL3HUK3CCFL+tAo=;
        b=eD2Da2vhnd5BO34rVgVEeGLYdN8kcJto3KyzMMjpToOrhExu41wHci7xCZcWZ7Xhxz
         kHgzjeMEUHQ3efn2ZQuMEV9oXk8my/cFrFeowYvwaWtwIUG4V0uc1183blkKn9qTTOvp
         bOQg9zXEuGktq5IQLWXOOeohwQ1TDMUG7RRZ9fnyJAX8exdbfJN5Kn+FpzQ3e1EACHDp
         Ewh30FBzlKj69V6vNidcPD02NmzRTa8zY19+nYvI7PctwxfEQvbQTKpbaZNkyHGVgw37
         6qaf075dJ/Q1KGp09mQ9V6ZwMcIrwxCAxium4s6Kr2Nl9pGsJw8O79ukDdiPA/8oiP2G
         Bd6w==
X-Gm-Message-State: AOJu0YzM5ndCEnFgoRGnskeF0VP85jlTH2Z8GdwtWojMgHVLulKQucUR
	yaZtGqJE5cUmUm8vMCkANOPjNTgaOgxLsNg0iDiq8MSSPw/S8DYV/YMzweslEjCU8SuROUUtD8D
	MsH6CZX04LXx/r19k/8FrLABkrBf14nLfhg==
X-Gm-Gg: Acq92OHHxwKD03DFtLGlRWH+7RkMZdSrZXHJKIec0cnkp8x1rpISvym4ZxJNoqP72ke
	3yiDNv3zHoBVRkZgzhOMlarkh7kqH6XpEp1RWI7FzFblNGAfUkOUrKGo4jz0nAkk08F/JFgwq+w
	0aOlfERLXSstsXi5hHW66wDtTI18EU/2WeaoggfHW1mdiq2OWK5bGtmhy1UCRkfA9F6Ef4DN+8w
	tuQ5tRJx0XXBDwBjv9iSyCV0cqrJNmHMkStHmzku9YLzuAH4lPbczx6WsRNlu9z8ekR27yjT2hf
	nMyVZgVojmZbiAxK2s5/eKvITtc+fFokkl7+0CFbu4KyZYxbuZPXsBdYTiS4Riw2YfzZc7XOJMG
	d9dZCRg==
X-Received: by 2002:a05:6830:4406:b0:7de:a0e0:1f6 with SMTP id
 46e09a7af769-7e4f2b89606mr2412627a34.5.1778876700192; Fri, 15 May 2026
 13:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+ORkNSkzcFwfXhKKN7yFGvUujJKtvOC8jTPYyy0fhFtWUcDuQ@mail.gmail.com>
 <agd0LPeoD7CVRpbT@archlinux> <CA+ORkNQXdrN_yboUfWuaQy6vVa-wrbUBFDvtGA6Rru-oB90JkQ@mail.gmail.com>
In-Reply-To: <CA+ORkNQXdrN_yboUfWuaQy6vVa-wrbUBFDvtGA6Rru-oB90JkQ@mail.gmail.com>
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Fri, 15 May 2026 15:21:46 -0500
X-Gm-Features: AVHnY4KvzWRpWECoqIxMISFg50D3OgQV5erJwRfXsUP2TR6Y3e6pAdyrwMRzpI4
Message-ID: <CA+ORkNT2ZVr8Cyg3udUGuXQYBx8pRCzwKvn5eE4UFB7UxDprDw@mail.gmail.com>
Subject: Fwd: [Linux Kernel 7.0.7] [hp_wmi] EC layout for board 8C9C unsupported
To: platform-driver-x86@vger.kernel.org
Cc: Krishna Chomal <krishna.chomal108@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forgot to reply to all. This should make it on the mailing list as well.

---------- Forwarded message ---------
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Fri, May 15, 2026 at 3:15=E2=80=AFPM
Subject: Re: [Linux Kernel 7.0.7] [hp_wmi] EC layout for board 8C9C unsuppo=
rted
To: Krishna Chomal <krishna.chomal108@gmail.com>


Krishna,

Well, no, power profiles do not work at all. The system is usable, but
not controllable. I tried both power-profiles-daemon and tuned-ppd,
neither worked.

Here is the EC hex dump of /sys/kernel/debug/ec/ec0/io:
0000000 0000 0000 0100 0040 ffff 00ff 00ff 011b
0000010 0001 203a 00ff ffff ffff ffff ff11 24ff
0000020 0000 0000 0026 0000 ff00 0020 3600 584b
0000030 4e43 4b30 3138 324a 504c 0055 0001 ff00
0000040 ffff 01ff ff00 ffff 4cff 4f49 004e 0000
0000050 0700 ffff 0031 ff00 0002 412d 0000 0000
0000060 8000 0000 0000 0000 0000 0000 0000 0000
0000070 0000 0000 0000 0000 0000 0000 0000 0000
0000080 0000 0000 0000 0000 0000 2d2d 0000 0000
0000090 3333 2d33 4341 342d 5742 304b 3034 3037
00000a0 0000 d600 0041 2400 0000 0800 2a73 1802
00000b0 0025 0024 0000 2022 0000 0000 0301 1111
00000c0 0000 1986 02b4 40da 3c28 1b5f 1986 1964
00000d0 0000 0000 0000 1986 0146 115b 0000 00e0
00000e0 0000 3300 3610 3a10 3710 8710 0603 a600
00000f0 0500 000b 0000 4330 0090 34e3 0658 2d00
0000100

If it helps and/or related, there are a few other issues:
May 15 08:24:29 kernel: ACPI BIOS Error (bug): Attempt to CreateField
of length zero (20251212/dsopcode-133)
May 15 08:24:29 kernel: ACPI Error: Aborting method \_SB.WMID.WQBC due
to previous error (AE_AML_OPERAND_VALUE) (20251212/psparse-529)
May 15 08:24:29 kernel: ACPI BIOS Error (bug): Attempt to CreateField
of length zero (20251212/dsopcode-133)
May 15 08:24:29 kernel: ACPI Error: Aborting method \_SB.WMID.WQBE due
to previous error (AE_AML_OPERAND_VALUE) (20251212/psparse-529)
May 15 08:24:29 kernel: ACPI BIOS Error (bug): Attempt to CreateField
of length zero (20251212/dsopcode-133)
May 15 08:24:29 kernel: ACPI Error: Aborting method \_SB.WMID.WHCM due
to previous error (AE_AML_OPERAND_VALUE) (20251212/psparse-529)
May 15 08:24:29 kernel: ACPI Error: Aborting method \_SB.WMID.WMAA due
to previous error (AE_AML_OPERAND_VALUE) (20251212/psparse-529)
May 15 11:23:25 kernel: ACPI BIOS Error (bug): Could not resolve
symbol [\_SB.PCI0.LPCB.BAT1], AE_NOT_FOUND (20251212/psargs-332)
May 15 11:23:25 kernel: ACPI Error: Aborting method \_SB.PEP._DSM due
to previous error (AE_NOT_FOUND) (20251212/psparse-529)

Thanks,
Bogdan


On Fri, May 15, 2026 at 2:46=E2=80=AFPM Krishna Chomal
<krishna.chomal108@gmail.com> wrote:
>
> On Fri, May 15, 2026 at 08:45:41AM -0500, Bogdan Nicolae wrote:
> >Hi,
> >
> >With a recent kernel upgrade (7.0.7-arch1-1 #1 SMP PREEMPT_DYNAMIC
> >Thu, 14 May 2026 14:26:22 +0000 x86_64 GNU/Linux) I am noticing the
> >following line in dmesg:
> >hp_wmi: Unknown EC layout for board 8C9C. Thermal profile readback
> >will be disabled. Please report this to
> >platform-driver-x86@vger.kernel.org
> >
> >As instructed, I am reporting it
>
> Hi Bogdan Nicolae,
>
> Thanks for reporting. The hp-wmi driver now uses EC reads to determine
> current platform profile during driver init in thermal_profile_setup()
> and during power source change events in victus_s_powersource_event() as
> introduced in commit eeeb4c9874bb ("platform/x86: hp-wmi: Add EC offsets
> to read Victus S thermal profile").
>
> At the time of that patch we did not have information about the EC
> layout for your board, hence the warning in dmesg.
>
> >in hope it will be supported in the future.
>
> Just to clarify, is everything (apart from platform profile being
> defaulted to "balanced" at boot) like power and fan control working
> as intended? Because this is supposed to be a mere "warning", not
> necessarily implying that something is broken.
>
> >Please let me know if you need further information.
> >
>
> Please share your EC dump via:
>
> # modprobe ec_sys
> # xxd /sys/kernel/debug/ec/ec0/io
>
> This should be sufficient to build a patch and remove the warning.
>
> >Kind regards,
> >Bogdan Nicolae
>
