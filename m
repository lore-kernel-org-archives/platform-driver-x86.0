Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65F43F164C
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 06:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355495; cv=none; b=E9b9Ps0xEvsLg/0gwKr4nAJaj1CvybJt1OsjlN08aPvDMMjQp3uJi32Ugz7dhPiwpe5Bk2Bxmnhmp2J9GD0ZR94RUkU0xG25Hao4Aqtp5qEM9zNQoHcE1t/EcRXVXmefjUtG50G6+O/81aT7lYk0Cr6PZA2vvZUVpqtuzt77BPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355495; c=relaxed/simple;
	bh=WeqBLEkoA7ic0QP39xClZl6mzvfIR+z7rqJpeThOhCw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ULTCzKjkUgK1n8hRQf+341f4n5oJOtqQCzI1L3y+8mb7vrIOjqdkINJ0aeMQL+iIi6V0sHo32bY1a6R3AcxM/BamrYn6TIFcNhfhc1/9JmR4G/qb9kxhPJQZ+cPMEcI6QZ3zeSWyRWnKBezstARB3ddtlzVR0xwEjrdFX5DUYTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEJXxed9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEJXxed9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5558BC2BCB9
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 06:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791355495;
	bh=WeqBLEkoA7ic0QP39xClZl6mzvfIR+z7rqJpeThOhCw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eEJXxed9/jyC0uTXDmAqBLzPJy576kFHOh9RthIizCIIyju9NujqgTHiM4z9RsoSu
	 dlx45Tya/7WKBv4d8xUb2suX+qKoB3VrgJ4UkzZzyzBa/eoocima9HIgP1p0gTJS4i
	 FOSJRXG3YvzuhVIQipwK4kuzigCEaEwvN5tn1FCCzcxlNlbFXaTGq9s6ni7E7Zvppr
	 cEfFPrbKx5YfnhAuN6ewyNiZhfBEipAC16w/uDwc3rWQqYhB3UHLQ6/UpV1OnrH2Hg
	 zBXEyh9EX7tHgWl8JXXUBWTIQA+sg3ilFFBQ1JNatTcUVNN96TNYxdNOYsT9YYWBYz
	 x6D+t2LeJ3ocg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 32B44C433E1; Wed,  7 Oct 2026 06:44:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Wed, 07 Oct 2026 06:44:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aryanbabupiyushbabu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222044-215701-92cVsQbC2h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

--- Comment #5 from Piyush (aryanbabupiyushbabu@gmail.com) ---
Update on kernel fixup implementation and testing:

I built and tested a custom patch against sound/hda/codecs/realtek/alc269.c
incorporating both identified controls.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1. CODE IMPLEMENTATION
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Added fixup function:
---------------------
static void alc236_fixup_hp_15_fc0xxx_led(struct hda_codec *codec,
                                         const struct hda_fixup *fix, int
action)
{
        struct alc_spec *spec =3D codec->spec;

        if (action =3D=3D HDA_FIXUP_ACT_PRE_PROBE) {
                /* F5 Speaker Mute LED: Node 0x20, COEF 0x07, Bit 0 */
                spec->mute_led_polarity =3D 0;
                spec->mute_led_coef.idx =3D 0x07;
                spec->mute_led_coef.mask =3D 0x01;
                spec->mute_led_coef.on =3D 0x01;
                spec->mute_led_coef.off =3D 0x00;
                snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);

                /* F8 Mic Mute LED: Node 0x01, GPIO 0, Active-Low */
                spec->micmute_led_polarity =3D 1;
        }

        /* Wire GPIO 0 for mic mute LED */
        alc_fixup_hp_gpio_led(codec, action, 0x00, 0x01);
}

Fixup table chaining and quirk:
-------------------------------
[ALC236_FIXUP_HP_DMIC] =3D {
        .type =3D HDA_FIXUP_PINS,
        .v.pins =3D (const struct hda_pintbl[]) {
                { 0x12, 0x90a60160 }, /* use as internal mic */
                { }
        },
        .chained =3D true,
        .chain_id =3D ALC236_FIXUP_HP_MUTE_LED,
},
[ALC236_FIXUP_HP_MUTE_LED] =3D {
        .type =3D HDA_FIXUP_FUNC,
        .v.func =3D alc236_fixup_hp_15_fc0xxx_led,
},

/* Quirk table entry */
SND_PCI_QUIRK(0x103c, 0x8dc9, "HP Laptop 15-fc0xxx", ALC236_FIXUP_HP_DMIC),


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2. HARDWARE VERIFICATION
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Speaker Mute LED (F5):
  Works as expected across environments, synchronizing with master playback
mute.

- Mic Mute LED (F8):
  Hardware wiring is verified working via ALSA:
    amixer -c 1 sset Capture toggle
  Directly toggling this switch flips /sys/class/leds/hda::micmute/brightne=
ss=20
  between 0 and 1, and the physical amber LED turns on and off accordingly.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
3. PARTITION & USERSPACE TESTING OBSERVATIONS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I tested this exact kernel build across two different partitions:

- Partition 1:
  Worked as intended out of the box, with the LED tracking mic state cleanl=
y.

- Partition 2 (Primary, running KDE Plasma / PipeWire with ALSA UCM HiFi
profile):
  An unexpected quirk appeared:
  * The machine requires the internal digital microphone fixup at pin 0x12
(ALC236_FIXUP_HP_DMIC: 0x90a60160).
  * ALSA registers both the legacy analog Capture switch (numid=3D7) and th=
e DMIC
endpoint. On this setup, the analog 'Capture Switch' (numid=3D7) initialize=
d to
[off] (muted).
  * KDE / WirePlumber manages and mutes the DMIC stream
(alsa_input.*.HiFi__Mic1__source) without touching numid=3D7.
  * Because the kernel's generic audio-micmute trigger in hda_generic.c
monitors all registered capture switches and sees numid=3D7 permanently mut=
ed,
the F8 LED remained locked ON (brightness 1) at startup regardless of softw=
are
mute toggles.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
4. FEEDBACK REQUEST
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Could you advise on the preferred upstream approach to structure or chain t=
he
micmute LED fixup when ALC236_FIXUP_HP_DMIC is active so the LED remains
synchronized with the DMIC stream state regardless of userspace mixer defau=
lts?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
