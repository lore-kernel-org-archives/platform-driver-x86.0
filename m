Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF864A3F34
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419816; cv=none; b=DwtISR+eoLOf4VLsm51CTfiEZ+8fgpZZT2RqXf1O2skHqsEBXJTDLHYb140qgTc3ppj7alN1ZR4UsdKU9vAODH6CmxeMlUeJUiimDHlh3NiGsguaOEhvRNgWevhzGSONOMaAAcWhAhJHqk1T3yAGrOroGHcPbiKDd3ta3sWi68A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419816; c=relaxed/simple;
	bh=qDSERsCNQSFnHcVNhtUWBKFx6lf6cL7WoenLEdoTiA0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jVET/FyynUqdhtbserLXi6oX2t93afSeLQsaeO7OqeraMSNoi5aTQwVkWioP2EznYoc/m3o2kGx6F598+uwuT83gcy53ZQGUiolV+1LNphN0T9TimEUN33n3yKMNaYldG3tBNCKCmYf2G9M43MprcGPZeHxsLSZFTy3x5Z+GESk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mRvj8o0J; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mRvj8o0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792419801; x=1792679001;
	bh=qDSERsCNQSFnHcVNhtUWBKFx6lf6cL7WoenLEdoTiA0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mRvj8o0JWdNz1VPaEHsP8Kw08WlOJVfKNcXS64tb/arL2BDzPZrGGWoIaIuN5Ms0H
	 e/YZkyGRNLeYd41lJHs2dZX4uCK2rw8EpbOM5Q18erDeknHoFjfACltP47Wm6i+5pf
	 2FG1L4hXipxCr/WwfSAO2kDSIkXSwBuXBY2afqK9ebNvvI0vqBE728/0cqcqCauqdA
	 iXV1PJnVAJY0OACmGuX+/vlretBeSoRm/F/n0nifIWV/OzGkCA1STEZ5Qb9TAGwtZo
	 iceLl7T8/UVV1+ONba80t/ovlCQgvp+bM2C6b5N3TgZvnvbIhKJ2nUa3GzqicLeWqE
	 FtoDvWPpDnbHw==
Date: Mon, 19 Oct 2026 14:23:18 +0000
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
From: Jona Sadjak <jona.sadjak@proton.me>
Cc: platform-driver-x86@vger.kernel.org
Subject: [BUG] platform/x86: hp-wmi: OMEN board 8603 gets no platform profile, and a 0x1B event loop once it does
Message-ID: <69aafae4-acbe-4e69-91ec-204f1f7aa310@proton.me>
In-Reply-To: <26460fe0-b8c6-42fc-847d-3cbeea8d3721@proton.me>
References: <26460fe0-b8c6-42fc-847d-3cbeea8d3721@proton.me>
Feedback-ID: 174706356:user:proton
X-Pm-Message-ID: 70eabe0b6cea251a1dca5854edb37c64ae770bbb
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Hans, hi Ilpo,

On my HP OMEN laptop with DMI board name 8603, hp-wmi never registers
a platform profile, although 8603 is listed in
omen_thermal_profile_boards. Without the OMEN performance mode, the EC
holds the CPU to about 45 W under sustained load. I found two separate
problems in the driver. With a local workaround for both, performance
mode works and removes that limit.

System
------
=C2=A0 Product:=C2=A0 OMEN by HP Laptop 17-cb0xxx (cb0905ng specifically)
=C2=A0 Board:=C2=A0 =C2=A0 8603
=C2=A0 BIOS:=C2=A0 =C2=A0 =C2=A0F.53 (04/24/2024)
=C2=A0 CPU:=C2=A0 =C2=A0 =C2=A0 Intel Core i7-9750H
=C2=A0 GPU:=C2=A0 =C2=A0 =C2=A0 NVIDIA GeForce RTX 2060 Mobile (nvidia-open=
 kernel modules)
=C2=A0 Kernel:=C2=A0 =C2=A07.2.11-arch1-1 (Arch Linux), tainted 12292 (S O =
E).
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O and E come from out-of-tree mod=
ules (nvidia-open, and the
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hp-wmi copy used for testing), S =
from MSR writes by
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 throttled, which I used to raise =
the RAPL limits. The code
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 paths below look unchanged in v7.=
3.

Problem 1: the EC profile read fails, so setup gives up silently
----------------------------------------------------------------
thermal_profile_setup() calls platform_profile_omen_get_ec(), which
reads EC offset 0x95. On this machine that byte reads 0x37, and it
stays 0x37 after switching modes:

=C2=A0 # modprobe ec_sys
=C2=A0 # od -An -tx1 -j 0x95 -N1 /sys/kernel/debug/ec/ec0/io
=C2=A0 =C2=A037

0x37 is not one of the known v0/v1 values, so the function returns
-EINVAL. hp_wmi_bios_setup() ignores the return value of
thermal_profile_setup(), so nothing is logged, there is no
/sys/firmware/acpi/platform_profile, and power-profiles-daemon falls
back to its placeholder driver.

The rest of the path works on this board.
omen_get_thermal_policy_version() returns 0, and
HPWMI_SET_PERFORMANCE_MODE accepts all three modes (it returns the
requested mode). Logged with a debug print I added after
omen_thermal_profile_set():

=C2=A0 hp_wmi: Omen thermal policy version 0, set mode 0x00, result 0
=C2=A0 hp_wmi: Omen thermal policy version 0, set mode 0x01, result 1
=C2=A0 hp_wmi: Omen thermal policy version 0, set mode 0x02, result 2

Problem 2: event 0x1B after every mode change makes the profile cycle
---------------------------------------------------------------------
After working around problem 1, the firmware sends WMI event 0x1B
(HPWMI_FN_P_HOTKEY) each time the thermal mode is set: once at module
load and again on every switch. hp_wmi_notify() handles it as the Fn+P
key and calls platform_profile_cycle(). That sets the next mode, which
triggers another 0x1B, so the profile cycles performance -> cool ->
balanced -> performance without end. kacpi_notify workers use
noticeable CPU, and the fans stay low, presumably because the EC
restarts its fan adjustment on every switch. As far as I can tell,
this laptop has no Fn+P key.

With the event ignored on this board, the log shows it arriving
together with each mode change:

=C2=A0 hp_wmi: ignoring Fn+P event (0x1b) on Omen
=C2=A0 hp_wmi: Omen thermal policy version 0, set mode 0x00, result 0
=C2=A0 hp_wmi: Registered as platform profile handler
=C2=A0 hp_wmi: ignoring Fn+P event (0x1b) on Omen
=C2=A0 hp_wmi: Omen thermal policy version 0, set mode 0x01, result 1

Effect on CPU power
-------------------
Default mode (no platform profile), sustained CPU load:
=C2=A0 - package power settles at 44.5-45 W, sometimes drifting down to
=C2=A0 =C2=A0 about 40 W, at 2.9-3.3 GHz all-core and 67-79 C
=C2=A0 - MSR_CORE_PERF_LIMIT_REASONS (0x64F) shows PL1 as the active limit
=C2=A0 - MSR_PKG_POWER_LIMIT already reads PL1 =3D PL2 =3D 90 W from firmwa=
re,
=C2=A0 =C2=A0 and the limit stays at 45 W even with both the MSR and the MC=
HBAR
=C2=A0 =C2=A0 copy set to 90 W. MSR_PLATFORM_POWER_LIMIT (0x65C) is disable=
d.
=C2=A0 =C2=A0 So the 45 W limit comes from outside the registers the OS can
=C2=A0 =C2=A0 see, presumably the EC.

Performance mode, via the workaround:
=C2=A0 - under full load the CPU holds 3.9-4.0 GHz all-core at 65-75 W
=C2=A0 =C2=A0 package power, at 85-97 C, and the fans ramp up properly
=C2=A0 - this matches what OMEN Gaming Hub's performance mode did on
=C2=A0 =C2=A0 Windows on the same machine

Switching back to performance at runtime
----------------------------------------
After switching to balanced and then back to performance at runtime,
the call succeeds ("set mode 0x01, result 1") and platform_profile
reads performance, but package power stays limited to 40-45 W.
Sending performance again or unplugging and replugging AC does not
help. A suspend/resume cycle (deep) does restore the full power, and
so does a reboot, where balanced and then performance are set during
startup.
So the EC seems to apply the higher limit only at boot or on resume.

Local workaround (not a proposed fix)
-------------------------------------
Shown against v7.3 for readability. I tested the same two changes
(plus debug prints) on an out-of-tree copy of hp-wmi.c that is synced
with v7.0.12, not on a mainline build.

--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -1391,6 +1391,9 @@
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info("Unknown key code -=
 0x%x\n", key_code);
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
=C2=A0 =C2=A0 =C2=A0case HPWMI_FN_P_HOTKEY:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* board 8603 sends this after every thermal m=
ode change */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_omen_thermal_profile())
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_profile_cycle();
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
=C2=A0 =C2=A0 =C2=A0case HPWMI_OMEN_KEY:
@@ -1722,7 +1725,13 @@
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*profile =3D PLATFORM_PROFILE_COOL;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
=C2=A0 =C2=A0 =C2=A0default:
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* EC reports 0x37 on board 8603: trust the la=
st set profile */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (active_platform_profile =3D=3D PLATFORM_PR=
OFILE_COOL ||
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 active_platform_profile =3D=3D P=
LATFORM_PROFILE_PERFORMANCE)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *profile =3D active_platform_pro=
file;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *profile =3D PLATFORM_PROFILE_BA=
LANCED;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
=C2=A0 =C2=A0 =C2=A0}

=C2=A0 =C2=A0 =C2=A0return 0;

Trusting the last set profile also matters for
omen_powersource_event(). When the EC value was simply mapped to
"balanced", that handler kept re-sending the user's profile on AC
events. Ignoring 0x1B for every Omen board is obviously too broad;
a per-board flag (skip the EC read, ignore 0x1B) may be the right
shape, but you know the other boards far better than I do.

I'm happy to test patches and to send acpidump output or more logs.

Note on how this report was made: I used an AI assistant (Claude,
claude-opus-5-5) to help read the driver source, interpret my
measurements and draft this mail. All logs and measurements come from
my laptop, I applied and tested the workaround myself, and I have
checked the text.

Thanks,
Jona


