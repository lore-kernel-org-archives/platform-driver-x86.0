Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756315;
	b=Nvd0GqGT35oXATcRuko/MfyVunUHhJDf35qgCXByldMUA5gnUvvZnQfZ0O2qQruUJJU0
	 ER/UidE4ThO5Xl00hQNAwH3zMVryvAyjst1RglmukEIJmdFO685kC0MlqjwbBltk7fsQz
	 7hoWYdXwLACQ+VdhNcHkCed8oAiu9d4W3upU8G7W7e2RfL6IGtR19l1q+Oy48lq4XuzVD
	 5T3jU0H/r2C9LFg8K2bcjhfM9WghFrcUdgFlYJzoA1l7vqq8JwHktgWIndDkmOetICr3E
	 fe2eLr832EON68xNplNWSFEraYlnjLGUymIQvL8GLiuh75uNcPFVkFOAmJ0LooXfAgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756315;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ayJIFzSqD2mTi71/46SkH3U4ZS4yL5e9ZrqBNzAW+NE=;
	b=ZW9eLsLcLafMm341qBzRJ2ReQDPEsUrmT0ice9HtAozDZY/YILM/BEiW/KfFkgN9C0pb
	 hWWqE7bHM30cOq0rXI9EmxQlyidht9gsVHQAbnAsP5zlb4fOcXNSCPToNLjNDlQKPI17S
	 pvO/VVJMuUm2z0I3cFhXYV5hr2/LEMGvOd8KdzznLA6gEE0djqNl3VAz7rOo1XYx5XUNd
	 KNjgQOLwIPA86qNEUi1TTjni4pVkeRgH5T3q35adikQamvCG+fPj0kTtsufpo2VgQ8Znh
	 1vtc0ig6WBr4PTCj1DsBy+POEWURfeTFtwpUkTU81hLqip2RtkLgP/pFIDvz+22sNGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=nbwbcS6z;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBBE606A31A
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 11:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DBBE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=nbwbcS6z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792756311; x=1793015511;
	bh=ayJIFzSqD2mTi71/46SkH3U4ZS4yL5e9ZrqBNzAW+NE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nbwbcS6zfp2gP+PSe5Z5/az7zTYmEHVrbdBl0Iegdw3beXw1Tk2u1Tv3OdRqqYA05
	 oWiEsZyS0p/RFVnUdg+ygYB33i4Ra/YQh06g5leoGJbfbi9gmWj99VHa/GTqsO0nLV
	 IRDHV/cs75nnS8PPj+qaeeCj9KfOitdDnn6jOU6hNTK4GGVrctQZHIrf79vAsToYjg
	 4yVSQ5qyiJ/GRw5TKT1LahniMBV4FWD3j/2cCrpOcRc/99gPKS3g8WMdaLF5F62T7T
	 0r9jI/t0FLIx/kkYGGskgCqC2XPQNrew0Mgf4BcmjvPVJQfwbzpyc8XhOsNlSJPoZN
	 9PzYLfsi3LE+w==
Date: Fri, 23 Oct 2026 11:51:46 +0000
To: Armin Wolf <W_Armin@gmx.de>, Mingyou Chen <qby140326@gmail.com>
From: 7z0423arsenova <7z0423arsenova@proton.me>
Cc: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: [BUG] bitland-mifs-wmi: platform_profile broken on Redmi G 2022 (TM2135)
Message-ID: <OT2JfRLDi6yHShYvywRZoFBYdW-TUgdKqKtahRM5b0cZxNo6eGZHnO5dKf4oYFaEtZhEsqU-Q-2OFe0D-qToJMVUrS5_d2aa2Q5LD50ISIc=@proton.me>
Feedback-ID: 227066774:user:proton
X-Pm-Message-ID: 726bffc88b5fcaad169362fdc2e6c59e1f332c49
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Armin, Mingyou,

On a Redmi G 2022 (board TM2135) the MICommonInterface firmware
(B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B) does not match what
bitland-mifs-wmi expects. On 7.2, "performance" cannot be selected
and "balanced" selects the firmware's performance mode. The two
patches now in pdx86 for-next (23cc56f6dea6 "Detect failed function
calls" and 4cfc3631d4ca "Treat WMI_FN_SYSTEM_AC_TYPE as optional") do
not fix the first problem, and with them the remaining profile writes
fail with -ENOMSG even though the mode does change. I tested this,
see 4.

DMI:    TIMI Redmi G 2022/TM2135, BIOS RMGAD6T0P1313 09/25/2025
Kernel: 7.2.11-arch1-1, power-profiles-daemon 0.30, on AC (barrel)

1. performance and balanced-performance fail with -ENODATA

   $ powerprofilesctl set performance
   ... Error writing '/sys/firmware/acpi/platform_profile':
   No data available

   bitland_check_performance_capability() reads command 0x1300
   (SystemAcType). The firmware implements only Get commands
   0x0800-0x0B00. For any other Get command WMAA returns a bare
   Integer 0xE000 instead of the 32-byte buffer. The WMI core
   marshals the Integer as 4 bytes, which is below min_size, so
   wmidev_invoke_method() returns -ENODATA. The other unimplemented
   Get commands the driver uses fail the same way (see the list at
   the end).

2. "balanced" selects the performance mode

   $ powerprofilesctl set balanced
   $ cat /sys/firmware/acpi/platform_profile
   performance
   $ powerprofilesctl get
   performance

   The firmware's values for command 0x0800 are 1-4, not 0-3. Set
   translates 3 to EC register ITSM 0 (and 4 to ITSM 3 where allowed)
   and writes anything else, including 0, unchanged. Get reports
   ITSM 0 as 3. The mode hotkey (EC query _Q0D) cycles ITSM
   2 -> 1 -> 0 [-> 3] -> 2, and on battery the firmware uses only
   ITSM 1 and 2. That gives:

     value  ITSM  mode
     1      1     balanced
     2      2     quiet
     3      0     performance
     4      3     higher mode, only GPUT 1/3 with a >=3D 330 W adapter
     0      0     not handled, ends up as performance

   On this machine the mode hotkey cycles platform_profile through
   low-power -> balanced-performance -> performance, and the event
   values (see 3) go 2 -> 1 -> 3, which matches the table.

   So the driver's "balanced" (0) selects performance, and the
   firmware's balanced (1) is reachable only as "balanced-performance",
   which problem 1 blocks. power-profiles-daemon reads back
   "performance" and switches its own profile to it, which also sets
   EPP to performance on all CPUs.

3. Mode change events are dropped

   THMD runs after every Set of 0x0800 and from _Q0D. It sends event
   0x16 with the new mode (same 1-4 values) in byte 2. The driver
   handles only 0x0F (WMI_EVENT_PERFORMANCE_PLAN), which this
   firmware never sends, so platform_profile_notify() is never
   called. With dynamic debug on, each hotkey press logs (device
   prefix trimmed):

     WMI event: id=3D0x16 value_low=3D0x02 value_high=3D0x00
     Unknown event: id=3D0x16 value=3D0x02

   0x16 is WMI_EVENT_FN_4 in the driver's table, so it cannot simply
   be remapped for all models.

4. The for-next series on this machine (tested)

   I built bitland-mifs-wmi.c from pdx86 for-next (v7.2 +
   23cc56f6dea6 + 4cfc3631d4ca) as a module for 7.2.11-arch1-1 and
   loaded it in place of the in-tree one, with power-profiles-daemon
   stopped:

   $ echo low-power | sudo tee /sys/firmware/acpi/platform_profile
   tee: /sys/firmware/acpi/platform_profile: No message of desired type
   $ cat /sys/firmware/acpi/platform_profile
   low-power
   $ echo balanced | sudo tee /sys/firmware/acpi/platform_profile
   tee: /sys/firmware/acpi/platform_profile: No message of desired type
   $ cat /sys/firmware/acpi/platform_profile
   performance
   $ echo performance | sudo tee /sys/firmware/acpi/platform_profile
   tee: /sys/firmware/acpi/platform_profile: No data available

   - Problem 1 stays. The 4-byte Integer fails the min_size check
     before return_code is looked at, so 4cfc3631 never sees
     -EOPNOTSUPP.
   - bitland_mifs_wmi_call() now also checks the function echo for
     Set. This firmware fills FUTR (bytes 2-3) only in the Get path,
     so Set replies carry function 0 and the write fails with -ENOMSG
     although the EC has already switched, as the read-backs show.
     On 7.2 these writes succeed, so this is a regression on this
     model.
   - Unknown Set commands do come back as the 32-byte buffer with
     0xE000. When I unloaded the for-next module, the LED core's off
     write (Set 0x1200, not implemented here) logged (prefix
     trimmed):

       kbd_backlight: Setting an LED's brightness failed (-95)

     Only unknown Get commands come back as the bare Integer.

As far as I can tell, the profiles on this model need all of:

   - a bare Integer 0xE000 reply treated as "not supported", so that
     4cfc3631 lets performance through (Set does its own adapter
     checks),
   - no function echo check for Set replies, or one that accepts 0,
   - mode values 1 =3D balanced, 2 =3D quiet, 3 =3D performance,
   - event 0x16 handled as a mode change.

Together with the different meaning of 0x0900 (below), this looks
like it needs per-model handling.

Other differences, seen on 7.2:

   - gpu_mode reads give "Protocol error". Get 0x0900 returns two fan
     speeds and EC fields TSR6/TSR7 here, not the GPU mode.
   - kb_mode, hwmon fan1_input and temp1_input give "No data
     available" (0x1000, 0x0D00 and 0x1600 are not implemented).
   - kbd_backlight brightness reads 4294967235: laptop_kbd_led_get()
     returns -ENODATA through enum led_brightness.
   - 0x0A00 holds the touchpad, Fn lock and Win key lock states
     (sub-command in byte 4), and 0x0B00 looks like the GPU switch.

Relevant ASL from SSDT "XMCC1806", \_SB.PC00.WMID.WMAA (trimmed, EC
paths shortened):

    Name (RETS, Buffer (0x20) { 0x00 })
    CreateWordField (RETS, Zero, SGER)
    CreateWordField (RETS, 0x02, FUTR)
    CreateWordField (RETS, 0x04, FRD0)
    ...
    Case (0xFA00)                          // Get
    {
        Switch (FUN2)
        {
            Case (0x0800)
            {
                If (ECRD (ITSM) =3D=3D Zero) { FRD0 =3D 0x03 }
                Else { FRD0 =3D ECRD (ITSM) }
            }
            ...                            // 0x0900, 0x0A00, 0x0B00
            Default
            {
                Local5 =3D 0xE000
                Return (Local5)            // Integer
            }
        }
        SGER =3D 0x8000
        FUTR =3D FUN2
        Return (RETS)
    }
    Case (0xFB00)                          // Set
    {
        Switch (FUN2)
        {
            Case (0x0800)
            {
                SGER =3D 0x8000
                ...                        // adapter wattage checks
                If (FUN3 =3D=3D 0x03) { ECWT (Zero, ITSM) }
                Else { ECWT (FUN3, ITSM) }
                THMD ()
                Break
            }
            ...
        }
        Return (RETS)                      // FUTR stays 0
    }

I can send the full acpidump and test patches.

Thanks,
Arsenova

