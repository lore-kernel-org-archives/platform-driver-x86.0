Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0228C8DF;
	Fri, 27 Dec 2024 23:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735341769; cv=none; b=l1S8IZekbbNubsEZEfM3MeRpMIopwKrC8c//ytuGQZr8cSZt3jw45c/FR2sTm3Ye/XOGrev3cFeQPX2MdtvNvrnE4UFsZyOsDQVyoO8pxxYLJ2Mt7qZl4LQQQK3bu3gUUrH0dXu3jKb8faNujxWYLCRNgqDd0Zykg/LE+3kctDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735341769; c=relaxed/simple;
	bh=HxiEh349zwvMEX/AoASYci860kECiKDSox5pfkASylc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NV8Gbg3+85GKCPMjsMv2GUuqAtvolXPkdx0BzBJnrTa64BnegqbDIpMmTx2zWICmJG6QR52dkVOpoydUWG2knNUXMUbvbHYJ1Ct3cZmKyRhZ74XTPXQI1/BJTJwqV2pOMrHgcFpdMFzyjGbZck9NqRasc0S6RPZp3NVMwaiQSi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2JCWYcB; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2JCWYcB"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b8618be68bso594029785a.3;
        Fri, 27 Dec 2024 15:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735341766; x=1735946566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxiEh349zwvMEX/AoASYci860kECiKDSox5pfkASylc=;
        b=Y2JCWYcBXT7BH2gEY63SvBbhlaLdBs28++3ALYeJlDnCd9KczJAmxVx1j8SlB7fq4V
         ZMp56fDr0mNNYK5IgOKtCv4mtRsiW0l4wMGLwBqO1iE/JvHkC70T0Oz7tgNzhi3YDzAd
         WPBbxj/DbP7ZkdlXU/g8fOmz9W8oaAN7Lh8e3XC4AWOG7zXJqc/rCjBjvJmwL88wDtJC
         hV8qfbdoLvQIHH0ETlNCx2Svocj8kZOdWQAGi1ETUs1lkSe1TV/qiM4Qe4s/l8ebOvA2
         /T5TrDCJZbhcvfe/6X+HqySqWHsWvnYr/M6XifPK6HqAI1U0dzxzGmHza9M+G7soLdFX
         7NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735341766; x=1735946566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxiEh349zwvMEX/AoASYci860kECiKDSox5pfkASylc=;
        b=v/vIDt5nU13wdj4c+sUufJxQeRvKkaRmYC544yEtVfuBe5P/RQ4saQl7RhGp8LLnSZ
         NZ1tCKVuB9E8c7+sliPWQacmzR908qGmcX83KqF6sL1o5IbDQDoyrk6YgQC3lP6gBsCg
         KUKJX31X0XvtCy570CQJ80ezZahmfJmHJLIN94L2hUXEap4oQYQVtLDStrKZhgbn+BCt
         y9W31g/3nM5rwwZvgGsk3fgKXHkFCIe66wlyvaMuuNnARkf+t7o13IwKZwCQeApsnxzi
         lOZteA34ivy6RRyhaJscNq+0tImGlmIxiy7+9qzsSk8EIWMNFLdB0V2G7oRxDzo0HWLC
         BJbw==
X-Forwarded-Encrypted: i=1; AJvYcCUU8oXpsfoqJS0cvTIGm0oBQzkxKatk97i09F/lyxB6UZuSgbTrycaehnHs8sTSWoJr++aDZLN5xhc=@vger.kernel.org, AJvYcCUg3guDtq+TETusqtH3TAWu8cIxg0+E89CIETP8skbJrVdrLFy7WHzr+a921HplRlIy/Bt75kjYw9fGImeBea7vQVfFgQ==@vger.kernel.org, AJvYcCX9+NMqbb0kjY2f9OI4VWV6iyPrNjh/cJMkVfpl+BgX6DQwTcJBi5F+OxfHk790+pdHj6o+QIIiM1IjtG/N@vger.kernel.org
X-Gm-Message-State: AOJu0YwPhNryk6FLZbDrvLip/t52BD4cPiGiI/1c8Zrwo7AYxs0Ughjf
	BHMPPxr+07FtBYeXy6i7PcavXd1zdiAqQB5tOJRTugbRzFjZ33Om8SZR713WwGZb2kKvDdrQuM+
	NCxIfp7MRDybd1Zkis0NBSwFUaSk=
X-Gm-Gg: ASbGncu6j2V6MsJw6ZDu7FSXR3dkknJAVCtKMLbQyWYgzFSvJcFpE3EMKWdH5W0g3Pq
	/an7WYLB7NguipUHgKxzrJjvgk9gALM902ofCszs=
X-Google-Smtp-Source: AGHT+IFSqGY6u8RnjwomTJKonVuUTkw6u6FBBNh8UmesxEyucAvUsEOcaPNx9AsrqZnsFf/3suVNAJ17K4nX4+zqqfk=
X-Received: by 2002:a05:620a:2986:b0:7b6:efd0:3d1e with SMTP id
 af79cd13be357-7b9ba810fc1mr4108783585a.53.1735341766531; Fri, 27 Dec 2024
 15:22:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217230645.15027-2-derekjohn.clark@gmail.com> <20241227184825.415286-1-lkml@antheas.dev>
In-Reply-To: <20241227184825.415286-1-lkml@antheas.dev>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 27 Dec 2024 15:22:35 -0800
Message-ID: <CAFqHKT=Y66KNo-e+o+n76tmPEcqL4EBSUQNDXJcoP8B9NXguew@mail.gmail.com>
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: corbet@lwn.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, luke@ljones.dev, 
	mpearson-lenovo@squebb.ca, nijs1@lenovo.com, pgriffais@valvesoftware.com, 
	platform-driver-x86@vger.kernel.org, shaohz1@lenovo.com, superm1@kernel.org, 
	zhangzx36@lenovo.com, johnfanv2@gmail.com, codyit@gmail.com, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 10:48=E2=80=AFAM Antheas Kapenekakis <lkml@antheas.=
dev> wrote:
Subject: Re: [PATCH 1/1] platform/x86: Add lenovo-legion-wmi drivers

>Hi Derek,

Seasons Greetings, Antheas.

>Good job on the driver. I spent a bit of time reviewing it today, and I
>have a few thoughts. Hopefully you can go through them fast, and we can
>have a solid base of understanding moving forward so that I can e.g.,
>merge your driver on Bazzite ahead of the kernel, so you can get some
>valuable testing.
>
>// Firmware Attributes
>Right now, I have one major concern I'd like to be addressed before
>moving into the details of the driver. This is mirrored in the Asus
>driver you referenced [1] as well and I do not think I have seen solid
>argumentation for it yet.
>
>Essentially, you are using the firmware attributes interface for the
>ephemeral attributes SPL, SPPT, and FPPT which is also a concern mirrored
>in the thread with Armin (+cc) and John (+cc) [2]. The question here
>becomes, if exposing fan curve attributes via the firmware interface is
>fickle, why is it correct for SPL, SPPT, and FPPT?

See [1] and [2] below. Hans de Goede and Ilpo J=C3=A4rvinen signed off on u=
sing it
this way for the asus-armoury driver, as proposed by Mario. This class is t=
he
"most" correct one currently present in the kernel. If you think an alterna=
tive
solution would make more sense then I would encourage you to create that
interface and submit it. In the meantime I am going to move forward with wh=
at
has already been discussed and, if you manage to get in in before this seri=
es
is approved, then I will adjust. Otherwise, please CC me on the patch that
changes this driver to include it.

>For context, when it comes to Asus (see [1]), these tunables reset during
>reboots, after sleep, and when changing the TDP mode. Specifically, TDP
>mode, SPL, SPPT, and FPPT, and the fan curve are not preserved between
>reboots, with only TDP mode being preserved between sleep. Following,
>setting TDP mode resets SPL, SPP, and FPPT, and setting any one of those
>resets the fan curve.
>
>For Lenovo and the Legion Go (1st Gen) it actually depends on the BIOS
>version. In early BIOSes, the custom tunings used to be preserved until
>you reset the BIOS. However, I suspect that this caused used confusion, as
>if you uninstalled Legion Space, the tunings to custom mode would still be
>applied which would be unintuitive. In new BIOS versions, the tunings rese=
t
>when changing TDP modes, which can be done with the combination Legion
>L + Y. I am unsure if they are still preserved between reboots if you
>remain in custom mode. Fan curve resets as well. But the point is that the=
y
>are not persisted, at least to the extent expected by the firmware
>attributes class and writing to them in other modes is undefined.
>
>Lastly, if another driver were to be developed e.g., for AMD out-of-tree
>to control devices without a vendor interface, we'd have the same
>issue. As this driver or [1] merging would set a precedent for using
>firmware attributes for these tunings, I think it is important to reach
>agreement before moving forward. For AMD w/o vendor, more details can
>be found in [3]. In [3], Mario makes an RFC for an alt interface for SPL,
>SPPT, and FPPT, through amd_pmf which does not have this peculiar issue.
>
>There are settings where it does make sense however, such as VRAM, boot
>sound (Asus), and the suspend light/barrel plug RGB (Legion). These
>settings are typically persisted in BIOS and there is no ambiguity for
>fitness in those.
>

>// Driver Details
>Ok, as for the rest of the driver, I have (i) some stylistic comments and
>(ii) will mirror similar concerns to John in unnecessary accesses.
>
>(i) Stylistic Comments
>I would personally be a fan of adding WMI support to the kernel, such that
>userspace can access WMI attributes without the use of a driver, as it is
>done in Windows. However, as I have discussed with Mario, such a thing is
>not an easy task, as it would require adding a BMOF parser to the kernel
>which is a monumental effort. In any case, the current kernel requires
>us custom write drivers for the WMI interface.
>
>The reason for this preface is that I think that your driver style is a bi=
t
>"too close" to what such a thing would look. E.g., in the driver I can see
>snippets such as `LENOVO_CAPABILITY_DATA_01 WMI data block driver.` and
>`MODULE_IMPORT_NS("CAPDATA_WMI");`. Since you are going through the effort
>of writing a custom driver, I would be more opinionated in how I'd design
>the driver, so that it's more intuitive from a user's perspective. I think
>John's driver (which has its own issues) and the asus-wmi drivers strike a
>bit better balance, where they "translate" the WMI calls into an ABI that
>can be documented and then parsed by a developer.

I'm not sure what you are talking about exactly. Can you provide some sort =
of
example? The scope is quite specific as it is, and will be even more specif=
ic
once I include the requested changes. There is no ambiguity for the user on
what /sys/firmware/acpi/platform_profile or /sys/class/firmware-attributes/
lenovo-wmi-gamezone/attributes/ppt_pl1_spl are. As Armin suggested and I ac=
k'd,
capdata01 and Other Method drivers will be linked as components in v2.

>Such a design process would then also allow to claim the name legion, as
>you could make sure the legion driver only loads on Legion laptops, where
>now it would randomly load in other laptops as well. Sidenote here is
>that this is something I also found confusing, as the Legion Go does not
>have a keyboard so that driver should definitely not load.

This is a consequence of the WMI design in the kernel as is. WMI GUID table=
s
only load on devices that implement them. If a device erroneously reports a=
n
unimplemented GUID that is a problem with the BIOS and it needs (preferred)=
 a
BIOS update and/or a DMI quirk to block it if loading it creates an issue. =
This
will be device specific.

>E.g., you could only load when you detect the Gamezone interface and then
>access the other two as well. The Gamezone interface is only used in
>Legion laptops AFAIK. I think Lenovo also kind of implements all three
>as stubs even if some are not used, to allow extending them with BIOS
>updates, so blindly loading drivers based on the interface might not be
>the best idea in any case. When the Legion Go released, I think only one
>of the three interfaces was used, for example, but all three were present.

If we run into a situation where that check passes on a device because the
interface produces a valid ACPI object that says it is supported even thoug=
h
the interface isn't fully implemented then we can quirk it. Also, this is
contradictory to your point (ii) where you insist these calls are unnecessa=
ry.

>(ii) Unnecessary Accesses
>Even though you went hands off on your design of the driver, at the same
>time you held back when it comes to userspace accesses by globally forcing
>the Other function hints as limits. This creates two issues.
>
>The first one is that those limits might be wrong for certain devices or
>certain users might want to go a bit above them, which would mean that if
>you enforce them you'd need to provide a way to quirk them and a module
>parameter override (I know they are correct for the Legion Go as I have
>looked through them as well). But if it is not necessary in Windows,
>why would we add additional roadblocks in the kernel? If Lenovo feels the
>need to enforce them, they can do so in their firmware and extend that
>protection to Windows as well. Asus does when it comes to their fan curve
>firmware, for example.

Unless you have some concrete examples of this actually occuring I'm inclin=
ed
to assume that Lenovo knows how to implement their interface. If we do find=
 a
device that has a broken CAPDATA interface, again we can quirk it.
Notwithstanding that, the data exists and it ensures that the interface isn=
't
abused to the point that hardware is pushed beyond its design limitations.
Mario or Xino can correct me here, but I expect AMD and Lenovo have an inte=
rest
in ensuring the kernel doesn't permit settings that can lead to additional
RMAs. For users who wish to disregard that there are solutions to modify th=
is
data which void the warranty, as you are well aware. I'll also point out th=
at
Lenovo controls the userspace software in Windows and never intended to sup=
port
Linux originally, so it is reasonable to assume this was just an oversight =
in
the design and they didn't expect anyone else would implement another WMI d=
river
or software when it was designed. In any case, My primary concern is that t=
he
interface is safe and reliable.

>The second is that you are making a lot of necessary calls, which may harm
>performance or potentially cause instability. My workflow for setting TDP
>on the Go is that I first respect the TDP mode the user has set using
>Legion L + Y. If the user wants to change that, then I do the following:
>set TDP mode to custom, set the TDP, set the SPL, SPPT, and FPPT, and then
>set the fan curve. I also add a small delay in-between each of these calls
>as a further precaution. In your current driver, each of these calls would
>make two additional calls to the WMI interface (one for the limits and
>one for the TDP mode), which would more than double the number of calls
>made in a typical scenario (from 5 to 12), where each triplet is made
>back to back.
>
>There is also the issue mentioned by John, where you do cross-interface
>interactions etc. To fix this, you'd have to retrieve the limits from
>firmware on probing and then cache them in the driver after quirking. It
>would be much easier just to skip all of this for now and just use them to
>prepopulate _min and _max values as hints instead, which you already do.

I had already planned on making this change for other reasons, but I want t=
o
dispel some misinformation you have presented here. First, I highly doubt
anyone is making enough calls to this interface that the extra 4ns are goin=
g
to even be noticed. I would say they are certainly using the interface
incorrectly if they do. Second, LENOVO_CAPABILITY_DATA_01 is a separate
interface, and it is (currently) only called once per attribute change. For
some background, this was originally added when I was permitting the curren=
t
fan profile to determine which capability data page was presented and set. =
In
the submitted version I hard code the page to custom as testing under quiet=
,
balanced, and performance showed no change. Technically it is an assumption
that this will be universally true for all Legion hardware, but the change =
was
made as the final approved version of Mario's patches which added the neces=
sary
custom profile to platform_profile explicitly states in the documentation t=
hat
"custom" mode is not user selectable. As Armin pointed out, this only appli=
es to
the legacy interface in /sys/firmware. In any case, you need not worry abou=
t
this as v2 will not need this call more than once during probe, and gamezon=
e
will not be called by Other Method ever.

>Those were my comments. You mentioned that you are travelling and might no=
t
>have access to your PC so take your time with the replies.
>
>Happy holidays,
>Antheas


[1] https://lore.kernel.org/all/e9f4fb37-5277-a7f0-2bec-8a6909b4e674@linux.=
intel.com/
[2] https://lore.kernel.org/all/07fe1bf8-f470-4e40-86ba-0f8d2e61a3e6@amd.co=
m/

Cheers,
Derek
