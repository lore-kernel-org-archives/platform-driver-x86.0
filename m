Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FDA21ABBB
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 00:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900330; cv=pass; b=bZZzjBcQ8xZVYb39bLWUZvd/NvSNBBczhlEwOLd+JQSCsm3aGJoBoNzMjszwlG4r1yKHMeBS/BiI9XKckYyX9CchGtBjRnsRZFbZEXoNvPa2fIJX8uKM3dFHBAgkCFb9bfG2gdKq864trZLtQ7k3LvEhcsOxUXSa/ggJ+NRj3E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900330; c=relaxed/simple;
	bh=6sbu0sY8fAfvoxnypyvSnMCkfcYxT0uZkAsuQHDBdqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEHpGeWy9K7vM71PI5CbgjgKKJ1fW+bto01R5xcGqgc6Ilc5yDqtuKafc0ZTbqoX+29WeSy2+JeOfQ7hf/MZYBW/wkRfZXKPbcQpMGQk+fpZg4oag/R0HNqoOaWgvrlU/qKv95zCLHtjQmwEwG08kwphCj0gxE8QH1OpPq+17Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGUd2q2N; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGUd2q2N"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3410209aa6aso784979eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 17:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790900328; cv=none;
        d=google.com; s=arc-20260327;
        b=ELm76vB3bOpcNIGt6j4MmSN0D+xf+D+Fn/BozwRq4+mStHyTsHOECpFpXAUlEjhkfN
         PcWC6bRJf8X+gX6yZSVdSDGuJWNwvytd+NWuEmEhe30orHEeIW7dlw5YehSq1mRtvrBJ
         C4vjJBTvNELLJFSCCtuREUUPijRqq6Af+mkKWv8p5tyNkhQZbkhAOWMON9J413R8Flbx
         obzmho+fM3gsqo/z9yIODR9AwgMWRI4Yb8XR9C1xA4WFoBT5cehEZv2rwglA3C/z4x0r
         LzjbsXXPRfu2P/np7vGnYscART21vtqJOYABK3LQGbGz/wbeenpbaosw6jSkmz3ti9DR
         cMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U+gjR5d9LLILgvkbyeqJF1PEcd50LLSKmsqYOAIF/7I=;
        fh=TGPR/bHWRZ8qNjX7TClg0MwtcSnG9zZ1wVzRdBzYe8o=;
        b=ftm5g9CInW2pLQxmDNDVhNitYPkn4cekU4qMTAZgTvrDX+MFne7JezS//ogkk/GZNP
         H7LafNn2ToeQVC+JB2rzE7TbrtPRiV9AILEsu6NMp2j8PHRfgv/P7jU8bkUQR3psQE8l
         Dv16Hz9bVb9mHgFbq72ZCnoITz2ezkcu+LW5YNNo+igp7X6zCfOUTV7vfsSekApiodgk
         XVpZSvKH2mRi2EQvw6+szbunmwFrH/sLb/hOgWHIYCbaMKl6vGGxB7h613id07Dz0tXp
         +zMK/JTnkRWY+Qx3r1ysuZmRSb7LDj/UMEDqmuZIAhlEjhMs+pT1A3skCBUzpcyZW0Ei
         L1Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790900328; x=1791505128; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+gjR5d9LLILgvkbyeqJF1PEcd50LLSKmsqYOAIF/7I=;
        b=ZGUd2q2NAopP3dNLjqH/et03XtbSgoY7G+++oT4lzDfgEHLPgM/GASwbVHBvHLl54O
         qF1u8PXeGytf1uqoiqJwztQm8xZYfQdept3wBPz1PaaEZpwBtV8zbxgUTHd4yyqdb0x5
         FqjjfFmAmFX0OwA943fK2I3xt1n6zY2QrUc7xo+hu7Dl9EQNFpyYetymgXDKMJFwULAp
         yRuHxK4FzMYUr1Xtlzil5hTNcnqOCNMsOKog+IdsrFqGPu3h9v9AAH+YE0p1X8SxoiuX
         DNCittCI41FsRbhQaeEAAiGmENLdDsPQiAvTg+8vvF6f7hghbGxAdQoMSS1WiwXMVE+u
         wKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790900328; x=1791505128;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U+gjR5d9LLILgvkbyeqJF1PEcd50LLSKmsqYOAIF/7I=;
        b=MDxWkHhsXf5KxefvA8bXQrkb1yAWgRMCQ10vd5ow/GNE9Niuni3vZflXneOmv1iqfL
         Vdy5lTIlwlKo9HpdZfPFfyZCtppugqTAAttNJ/3DICpAzkw5Va1zs6pgW3LcvwJCuwLt
         FKGK4LupyYHfdS8bUPEnaQmPOAq8WT0kqggy4v72/eL4Qewe3n8p1musgas6Ls+E3oBx
         dNQrbHC6+h9LH5T7HzNKMhCgI5HuGygAbdgM1KsxPRdBJkhOI1BKpG0Ge/LyUwprG9N6
         cVOoBe35sZKRRwNY2L+L6VWg7le0dkgVk0lqCX5NxpZ8gg6e3c1HPfjDmXNonFKpT6Go
         hkWg==
X-Forwarded-Encrypted: i=1; AKwUvByzlIViBhec2sww14xylODHFF+FeMIpYQGC/AsS57ZA8LQNBworIOVJCLMXzoG9C/74ZEHxfcz4x3BQzKerlxjTbf+5@vger.kernel.org
X-Gm-Message-State: AFuF++nOqtZX46nyqXzPdJqoPeJT3RSahAL7esC4GS7wZMoWXbsR+3WF
	pty1yA4Ut7vZf8fT6rhnM7ToIQboqjKve1xXaK5dSlS9GGM+xFE2vTIzh6hpDwRoWZ3vh9WZKmj
	I5cHvZWB7iYM7MxNTIYto4pUUMtvVUro=
X-Gm-Gg: AYBFou2swcebBpaBgNRi/PmwSByoTfHi1LEZbw4LYSFmr0mfl4tvplu8go6qthCIFuH
	RRw5e2w81JoMDhWP+TUEJ8/1LUMSNBkjy9tX3AjwKpj855OAoXu8gEtJ2GUNHuB6dIUIjLliTsy
	9i3GwsX2BrrfyYUtY/RAG+le8b8c6g3bRG1Qyu1zCrEuBXjiBfOAhrALsmpmJ4W2oYSpt50sqqd
	BLR2aCxJeEIEhUP0Thd0SZ7O2HMD04nao6pK11b2HcuxljgOyLW57SmXVS7cCzEmD9c7YH8Ug51
	1FTgJsQTNJRLmHUpUZdFuW5077rS2lvFVfXsn3OvpSuhKuOO9sn2Bf7rbyHfi6SgXzJ455UyTrI
	ih1eC+OkcVO1sacDmdLxlSIyxjWSxP5SWkqu3pnE=
X-Received: by 2002:a05:7023:a56:20b0:148:ece:8cc3 with SMTP id
 a92af1059eb24-14dd1c5188fmr4180886c88.24.1790900327522; Thu, 01 Oct 2026
 17:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929134503.17249-1-qby140326@gmail.com> <20260929134503.17249-6-qby140326@gmail.com>
 <20260930015058.3076905-1-uselessfire@gmail.com>
In-Reply-To: <20260930015058.3076905-1-uselessfire@gmail.com>
From: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>
Date: Fri, 2 Oct 2026 02:18:34 +0200
X-Gm-Features: AclHuK82qn9R_xwvmj6KBKMulEpb6kdbCvJRMp-Gm_dzPivtA15vWJx4VT7oIT4
Message-ID: <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine
 ops table
To: Anton Karasev <uselessfire@gmail.com>
Cc: qby140326@gmail.com, ilpo.jarvinen@linux.intel.com, hansg@kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	W_Armin@gmx.de, ilya.gladyshev@linux.dev, foxido@foxido.dev, kento@kekto.ru, 
	ericted8810@gmail.com, chris@miget.com, matias.civadda2342001@gmail.com, 
	btx342@gmail.com, wleizc7319@gmail.com, wolf109909@outlook.com, i@rsplwe.com, 
	bozhenpeng93@gmail.com, martiya.ar@gmail.com, aleksejirlik@gmail.com
Content-Type: multipart/mixed; boundary="000000000000da9bfa065cd0799a"

--000000000000da9bfa065cd0799a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anton,

> The Pro 14 2024 (TM2307) is built on the same platform (Xiaomi's
> downloads for both, the BIOS included, are filed under one platform
> name, N56N57) and may behave the same; I cannot verify that.

I have a TM2307 (XIAOMI / "Redmi Book Pro 14 2024", BIOS RMAMT4B0P0B0B
06/10/2025, bios_release and ec_firmware_release both 1.11 -- the same
releases you report for the TM2309). It matches your machine on every
point you listed, checked against the ACPI tables:

- Same method and table: \_SB.PC00.WMID.WMAA in the SSDT with OEM Table
  ID XMCC1806.
- Same commands implemented: 0x08 (GET and SET), 0x0a, and 0x10 (GET
  subcommands 1-3, SET subcommand 2 only). Everything else answers
  0xE000, including 0x0d, 0x13, 0x14 and 0x16. A GET of 0x0a echoes
  FUN3 back and answers 0x8000 whatever the subcommand, as you saw.
- NTDP maps QFAN to ODV1 identically: 3 -> 1, 2 -> 2, 4 -> 4, 5 -> 5,
  6 -> 6, and everything else -- so 0 and 1 -- to 0.
- SET fn8 writes the value into QFAN as is, with 5 and 7 going to SMMD
  instead.
- The SET branches never fill in the function id. All five FUTR
  assignments in WMAA are in the GET branch. So "Detect failed function
  calls" returns -ENOMSG for every SET here too, and Chris's "Only check
  the function id of GET responses" is needed on this board as well.
- 0x10 subcommand 2 is the LONL charge-protection bit here too: SET sets
  bit 0 for the value 1 and clears it for anything else, reporting
  0x8000 either way. So "echo fixed > kb_mode" is 0x10/2 with value 0
  and turns charge protection off on this machine as well. Agreed that
  kb_mode must not be exposed on these boards.

One place where I think the data differs, and it matters for the entry.

Your table lists 0 and 1 together as balanced. That is right for ODV1 --
NTDP maps both to 0, same as here -- but they are not interchangeable at
the EC fan level on this board.

There is no tachometer to read (0x0d unimplemented, and no tach byte
anywhere in EC RAM), so I measured cooling rate instead. Heat the package
to 80 C, drop the load, hold QFAN fixed, and record how far the package
temperature falls over a fixed 150 s window. PL1 and PL2 both pinned to
35 W so the ramp is identical between runs, any fan daemon stopped, run
order shuffled, QFAN read back every sample.

  QFAN  n  mean drop  sd    range        end temp  skin TSR3/TSR4
  0     4  15.2 C     1.48  13.0-17.0 C  63-67 C   49-52 / 50-52 C
  1     4  29.5 C     1.12  28.0-31.0 C  50-52 C   44-46 / 41-42 C

From the same 80 C start at the same power, mode 1 sheds about twice the
heat, and the two ranges do not overlap. The skin sensors say the same
thing independently: the chassis ends 8-10 C hotter after a mode 0 run,
so the heat is staying in the machine rather than being exhausted.

Caveats, since this is a proxy and not an RPM reading: n=3D4 per mode; the
shuffle happened to put three mode-0 runs together and heat soak is
visible within them (16 -> 15 -> 13 C as the skin climbs), which is
inside the quoted sd; and a time-to-threshold metric I also recorded did
not separate the two modes at all, so the fixed-window drop is the only
thing I am claiming. Raw per-run CSV attached if you want to check it.

So I would suggest an entry for these boards uses balanced =3D 1 rather
than 0. Same policy, different fan behaviour -- and 0 is exactly what the
current bitland_ops map writes for platform_profile "balanced", which is
how this started for me: fans effectively idle until the EC's own ~100 C
threshold.

Happy to test patches on TM2307.

Thanks,
Milos

On Wed, Sep 30, 2026 at 3:51=E2=80=AFAM Anton Karasev <uselessfire@gmail.co=
m> wrote:
>
> Hi,
>
> Data for the per-machine table from a Xiaomi Redmi Book Pro 16 2024
> (DMI: sys_vendor "XIAOMI", board_name "TM2309"; BIOS RMAMT6B0P0B0B,
> bios_release and ec_firmware_release 1.11), the same model as in
> Martiya's report. RMAMT6B0P0B0B (August 2025) is the latest BIOS Xiaomi
> publishes for this model, so this is what an entry would be written
> against. Its values match neither the Bitland defaults nor the Redmi map
> proposed in v5 6/6. The full acpidump is attached to bugzilla 222062:
> https://bugzilla.kernel.org/attachment.cgi?id=3D310971
> The WMI method is \_SB.PC00.WMID.WMAA in the SSDT with OEM Table ID
> XMCC1806; QFAN and NTDP are in the DSDT.
>
> Mode values
> -----------
>
> WMAA stores the value written with WMI_FN_SYSTEM_PER_MODE in the EC
> register QFAN as is (5 and 7 go to a separate register, SMMD, instead),
> and NTDP in the DSDT maps QFAN to the DPTF variable \_SB.ODV1 (odvp1 in
> sysfs) that thermald --adaptive uses to pick the policy from the GDDV:
>
>   QFAN   meaning                          ODV1
>   0, 1   balanced (Fn+K sets 1)           0
>   2      quiet                            2
>   3      performance ("Turbo")            1
>   4      full speed ("Geek")              4
>
> GET returns QFAN for 1..4 and 0 otherwise (so 0 after a SET of 0).
> Fn+K on this model cycles 1 -> 3 -> 2.
>
> I tested this with a local build that maps low-power/balanced/
> performance to 2/1/3: power-profiles-daemon power-saver, balanced and
> performance give odvp1 2, 0 and 1, and thermald loads the matching GDDV
> targets (PL1 limits, TCC offset), both on AC and on battery.
>
> On the DMI match: the v5 6/6 match on sys_vendor "Redmi"/"TIMI" would
> not cover this machine, and performance =3D 0 from that map is balanced
> here. The REDMI Book Pro 16 2025 in Aleksey's report also has
> sys_vendor "XIAOMI" but uses different values, so an entry for this
> model has to match board_name "TM2309". The Pro 14 2024 (TM2307) is
> built on the same platform (Xiaomi's downloads for both, the BIOS
> included, are filed under one platform name, N56N57) and may behave the
> same; I cannot verify that.
>
> Capability checks
> -----------------
>
> a) Performance on AC and on battery. WMI_FN_SYSTEM_AC_TYPE is not
>    implemented on this BIOS, so with Armin's "Treat
>    WMI_FN_SYSTEM_AC_TYPE as optional" the capability check passes on
>    AC. The write itself is still reported as failed here, though:
>    WMAA's SET branches set only the return code and leave the function
>    id at 0 (only the GET branches fill it in), so "Detect failed
>    function calls" (23cc56f6dea6 in for-next) returns -ENOMSG for every
>    SET on this BIOS, although the firmware applies it -- the same as
>    Chris reported for the Book Pro 14. I checked it with the for-next
>    version of the driver built for 7.2.7: every write of low-power,
>    balanced and performance failed with -ENOMSG while QFAN changed to
>    2, 0 and 3; with Chris's "Only check the function id of GET
>    responses" on top, all of them succeed.
>    On battery, power_supply_is_system_supplied() still refuses
>    performance, although the firmware supports Turbo on DC: Fn+K
>    reaches it on battery, the GDDV has a DC Turbo target, and writing 3
>    on battery works (odvp1 1, thermald applies the DC Turbo limits).
>
> b) Full speed. The firmware does not validate the mode at all. Writing
>    4 was accepted and applied (odvp1 4, thermald loads the Geek targets;
>    on AC the PL1 ramped towards the 90 W Geek maximum) both on battery
>    and on a 100 W USB-C PD charger, while Fn+K never offers full speed
>    in either case. It is not a charger thing either: with the stock
>    140 W USB-C charger (the EC register ADPW then reads 140, and GET of
>    command 0x10, subcommand 3, would report the adapter as not below
>    140 W) Fn+K still cycles only 1 -> 3 -> 2. So on this model full
>    speed is never offered by the vendor's own key, and whether it is
>    exposed has to be decided by the driver; the firmware will not stop
>    it.
>
> Commands that are not implemented, and one that is dangerous
> ------------------------------------------------------------
>
> On this BIOS WMAA implements only command 0x08 (GET and SET), 0x0a
> subcommand 5, and 0x10 (GET subcommands 1-3, SET subcommand 2 only).
> Other command IDs answer 0xE000, among them everything else the driver
> uses: 0x09 (gpu_mode), 0x0d (fan speeds), 0x12 (keyboard brightness),
> 0x13 (AC type), 0x14 (fan_boost) and 0x16 (CPU temperature).
> Unhandled subcommands of 0x0a and 0x10 mostly return status 0, and a
> GET of 0x0a answers 0x8000 whatever the subcommand. The hwmon device,
> the kbd_backlight LED, gpu_mode and fan_boost therefore have nothing
> behind them on this machine; probing support at probe time would avoid
> exposing them.
>
> kb_mode is worse than unsupported. kb_mode_store() sends command 0x10
> (WMI_FN_RGB_KB_MODE) with the mode in the first payload byte. On this
> firmware command 0x10 is the battery interface, and subcommand 2 is the
> charge protection (bit 0 of the EC register LONL, 80 % limit; reportedly
> what Xiaomi's Windows tools toggle): WMAA sets the bit only for the
> value 1 and clears it for anything else. "echo fixed > kb_mode" is
> therefore 0x10/2 with value 0. I verified on this machine that it
> silently turns off charge protection -- LONL goes from 0x31 to 0x00, the
> charge limit in the EC goes from 80 back to 100 and the battery, which
> had been held at 80 %, starts charging again -- while the firmware
> reports success (0x8000). That was on 7.2.7, whose driver does not check
> the reply; with 23cc56f6dea6 the write returns -ENOMSG instead, but
> protection is off all the same. I think kb_mode must not be exposed on
> these machines.
>
> Once the generic profile table has settled I can send a patch with the
> entry for this model and the kb_mode fix on top of it, and I am happy to
> test patches in the meantime.
>
> Thanks,
> Anton Karasev

--000000000000da9bfa065cd0799a
Content-Type: text/csv; charset="US-ASCII"; name="qfan-tm2307-mode0-vs-mode1.csv"
Content-Disposition: attachment; filename="qfan-tm2307-mode0-vs-mode1.csv"
Content-Transfer-Encoding: base64
Content-ID: <f_muq7rg070>
X-Attachment-Id: f_muq7rg070

ZHJvcF9jLGhlYXRfcyxtb2RlLHBlYWtfYyxwaGFzZSxzZWNvbmRzX3RvX2NvbGQsc2tpbl9UU1Iz
LHNraW5fVFNSNCxza2luX1RTUjcsc2tpbl9UU1JBLHRfZW5kX2MsdF9zdGFydF9jLHdpbmRvd19z
DQozMC4wMCwyMC4yLDEsODEuMCxjb29sZG93biwxLjAzLDQ2LDQyLDQ1LDM5LDUxLjAsODEuMCwx
NTANCjI5LjAwLDE1LjMsMSw4MC4wLGNvb2xkb3duLDEuMDMsNDUsNDEsNDQsMzgsNTEuMCw4MC4w
LDE1MA0KMTYuMDAsMTkuMywwLDgwLjAsY29vbGRvd24sMy4wOSw1Miw1MSw1MCw0OCw2NC4wLDgw
LjAsMTUwDQoxNS4wMCwxLjAsMCw4MC4wLGNvb2xkb3duLDEuMDQsNTIsNTIsNTAsNDgsNjUuMCw4
MC4wLDE1MA0KMTMuMDAsMS4wLDAsODAuMCxjb29sZG93biwxLjA0LDUyLDUyLDUwLDQ5LDY3LjAs
ODAuMCwxNTANCjI4LjAwLDEuMCwxLDgwLjAsY29vbGRvd24sMS4wMyw0Niw0Miw0NCw0MCw1Mi4w
LDgwLjAsMTUwDQozMS4wMCwyNy43LDEsODEuMCxjb29sZG93biwxLjAzLDQ0LDQxLDQyLDM4LDUw
LjAsODEuMCwxNTANCjE3LjAwLDIwLjYsMCw4MC4wLGNvb2xkb3duLDMuMTEsNDksNTAsNDgsNDcs
NjMuMCw4MC4wLDE1MA0K
--000000000000da9bfa065cd0799a--
