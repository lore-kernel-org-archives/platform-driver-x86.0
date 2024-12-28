Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF42382;
	Sat, 28 Dec 2024 01:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735348206; cv=none; b=malDEakGbGPq447fSk89VrWxioY4zsSwj83fikp54dq9NnFayMYkqGY5FeQsQWB8BPN8W0AlcwWt4wsQfcRYMrQJeCGB2B6oIy84kJ7WTnDm73fthk5J5tqnTnQiPWuqDmMLjPaRKixyCWzh+5fwubxsbMZcclkgmZiYG08HlwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735348206; c=relaxed/simple;
	bh=pf9ixIovXS8rpDeU21iFsVudVqEhNwe9aWRs4sPwPQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6Z927wrlOPSFHGg/BgnazG1Kv0S/XpQxxXLCoX4DBg3+AyBSNmdED4gfslnwIIICinccP3H2oQHNyRf2yrg9T764T7JSjvBZh2P55eHunHp+cQ+69wkDucD6BgdxtcUvejcvRlQV5EGLOPrnubH3mfLgy/c6q03+HrPI7O+xXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=d5u2bN4I; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="d5u2bN4I"
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id A158D2E0383A;
	Sat, 28 Dec 2024 03:09:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1735348199;
	bh=pf9ixIovXS8rpDeU21iFsVudVqEhNwe9aWRs4sPwPQ4=;
	h=Received:From:Subject:To;
	b=d5u2bN4IcGRbHKGZyCUmet/2QY35uKgB6GcXpN0PT4dIk9dHWyI8HDoJJ5vARJvNS
	 Lk4LK3DT9gFcbbQNnf+a+Z7X1JwCq9bOUGPT0auAAzrx2JyA2yO057fziiL3w7llsH
	 XukaLGMB5eNkl/eHUPyEYJrxe4w7nwJdfO6IPMQ4=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3047818ac17so55316941fa.3;
        Fri, 27 Dec 2024 17:09:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1ib6yJckY8rbV4uhxu3xx1tp93/X2C/FwGOWFvVBrP+HwRqFUDPNMRnGmSrCLBdW6o3sYWz+3aTA=@vger.kernel.org,
 AJvYcCX7gyNUfrLJNx06zRyfCdHY8GqsIPUL58e7oUx2/vzBc94Ep1Iv1ESONl0l1HGXBM/wJh0/rgAbF5ASL4QkPV4vkoiGOw==@vger.kernel.org,
 AJvYcCXDuiJaRMFqS4a0pv995MH40lT//V7otSgQP8XKa/sIRB9bfPT6iywgT/WNjqmI4qzkv1pZ53t/qnF0/jDJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwxePjw9lwE5gmdGg2ohTULI7EJsfpyz6YbJueXW0UyF6IrY62h
	fA4iq8I0nsfHjeNTewOKFhOWsbw3SOXb3UmVNjKhe7dFfpMVGoQawpZUoSxLbvebA+66Q0aV+T+
	x0cAtnGisozgru7mN5e8vBkOzNBc=
X-Google-Smtp-Source: 
 AGHT+IHRmV8e62wQFT8EJeE3CSl/NvNHOMOEpGf+VEo1+CLYmojzlMb1Wwe/7chtHI7of36xUjoO16YE3eQ4SSTpPi4=
X-Received: by 2002:a2e:a588:0:b0:300:3de4:ff72 with SMTP id
 38308e7fff4ca-304685c205bmr95456251fa.27.1735348197786; Fri, 27 Dec 2024
 17:09:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217230645.15027-2-derekjohn.clark@gmail.com>
 <20241227184825.415286-1-lkml@antheas.dev>
 <CAFqHKT=Y66KNo-e+o+n76tmPEcqL4EBSUQNDXJcoP8B9NXguew@mail.gmail.com>
In-Reply-To: 
 <CAFqHKT=Y66KNo-e+o+n76tmPEcqL4EBSUQNDXJcoP8B9NXguew@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 28 Dec 2024 02:09:46 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGpEWVQwEAFfWWkTx4G90uhqdfbF85E4F_2w6c6G6P2Sg@mail.gmail.com>
Message-ID: 
 <CAGwozwGpEWVQwEAFfWWkTx4G90uhqdfbF85E4F_2w6c6G6P2Sg@mail.gmail.com>
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: corbet@lwn.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, luke@ljones.dev,
	mpearson-lenovo@squebb.ca, nijs1@lenovo.com, pgriffais@valvesoftware.com,
	platform-driver-x86@vger.kernel.org, shaohz1@lenovo.com, superm1@kernel.org,
	zhangzx36@lenovo.com, johnfanv2@gmail.com, codyit@gmail.com, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <173534819911.25181.6753337912171691775@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sat, 28 Dec 2024 at 00:22, Derek John Clark
<derekjohn.clark@gmail.com> wrote:
>
> On Fri, Dec 27, 2024 at 10:48=E2=80=AFAM Antheas Kapenekakis <lkml@anthea=
s.dev> wrote:
> Subject: Re: [PATCH 1/1] platform/x86: Add lenovo-legion-wmi drivers
>
> >Hi Derek,
>
> Seasons Greetings, Antheas.
>
> >Good job on the driver. I spent a bit of time reviewing it today, and I
> >have a few thoughts. Hopefully you can go through them fast, and we can
> >have a solid base of understanding moving forward so that I can e.g.,
> >merge your driver on Bazzite ahead of the kernel, so you can get some
> >valuable testing.
> >
> >// Firmware Attributes
> >Right now, I have one major concern I'd like to be addressed before
> >moving into the details of the driver. This is mirrored in the Asus
> >driver you referenced [1] as well and I do not think I have seen solid
> >argumentation for it yet.
> >
> >Essentially, you are using the firmware attributes interface for the
> >ephemeral attributes SPL, SPPT, and FPPT which is also a concern mirrore=
d
> >in the thread with Armin (+cc) and John (+cc) [2]. The question here
> >becomes, if exposing fan curve attributes via the firmware interface is
> >fickle, why is it correct for SPL, SPPT, and FPPT?
>
> See [1] and [2] below. Hans de Goede and Ilpo J=C3=A4rvinen signed off on=
 using it
> this way for the asus-armoury driver, as proposed by Mario. This class is=
 the
> "most" correct one currently present in the kernel. If you think an alter=
native
> solution would make more sense then I would encourage you to create that
> interface and submit it. In the meantime I am going to move forward with =
what
> has already been discussed and, if you manage to get in in before this se=
ries
> is approved, then I will adjust. Otherwise, please CC me on the patch tha=
t
> changes this driver to include it.

They need to re-agree given the context below. It is one thing for
them to agree on it theoretically for settings that they might imagine
are persistent and another thing when in reality they are not.

You did not address this in your comment here.

The problem I am raising is that SPL, SPPT, and FPPT specifically are
not persistent enough to meet the guidelines of that interface.

[1] and [2] do not address this either.

I do not have an alternative planned, just noting that I'd like
everyone to be on the same page before we go ahead with this ABI.

> >For context, when it comes to Asus (see [1]), these tunables reset durin=
g
> >reboots, after sleep, and when changing the TDP mode. Specifically, TDP
> >mode, SPL, SPPT, and FPPT, and the fan curve are not preserved between
> >reboots, with only TDP mode being preserved between sleep. Following,
> >setting TDP mode resets SPL, SPP, and FPPT, and setting any one of those
> >resets the fan curve.
> >
> >For Lenovo and the Legion Go (1st Gen) it actually depends on the BIOS
> >version. In early BIOSes, the custom tunings used to be preserved until
> >you reset the BIOS. However, I suspect that this caused used confusion, =
as
> >if you uninstalled Legion Space, the tunings to custom mode would still =
be
> >applied which would be unintuitive. In new BIOS versions, the tunings re=
set
> >when changing TDP modes, which can be done with the combination Legion
> >L + Y. I am unsure if they are still preserved between reboots if you
> >remain in custom mode. Fan curve resets as well. But the point is that t=
hey
> >are not persisted, at least to the extent expected by the firmware
> >attributes class and writing to them in other modes is undefined.
> >
> >Lastly, if another driver were to be developed e.g., for AMD out-of-tree
> >to control devices without a vendor interface, we'd have the same
> >issue. As this driver or [1] merging would set a precedent for using
> >firmware attributes for these tunings, I think it is important to reach
> >agreement before moving forward. For AMD w/o vendor, more details can
> >be found in [3]. In [3], Mario makes an RFC for an alt interface for SPL=
,
> >SPPT, and FPPT, through amd_pmf which does not have this peculiar issue.
> >
> >There are settings where it does make sense however, such as VRAM, boot
> >sound (Asus), and the suspend light/barrel plug RGB (Legion). These
> >settings are typically persisted in BIOS and there is no ambiguity for
> >fitness in those.
> >
>
> >// Driver Details
> >Ok, as for the rest of the driver, I have (i) some stylistic comments an=
d
> >(ii) will mirror similar concerns to John in unnecessary accesses.
> >
> >(i) Stylistic Comments
> >I would personally be a fan of adding WMI support to the kernel, such th=
at
> >userspace can access WMI attributes without the use of a driver, as it i=
s
> >done in Windows. However, as I have discussed with Mario, such a thing i=
s
> >not an easy task, as it would require adding a BMOF parser to the kernel
> >which is a monumental effort. In any case, the current kernel requires
> >us custom write drivers for the WMI interface.
> >
> >The reason for this preface is that I think that your driver style is a =
bit
> >"too close" to what such a thing would look. E.g., in the driver I can s=
ee
> >snippets such as `LENOVO_CAPABILITY_DATA_01 WMI data block driver.` and
> >`MODULE_IMPORT_NS("CAPDATA_WMI");`. Since you are going through the effo=
rt
> >of writing a custom driver, I would be more opinionated in how I'd desig=
n
> >the driver, so that it's more intuitive from a user's perspective. I thi=
nk
> >John's driver (which has its own issues) and the asus-wmi drivers strike=
 a
> >bit better balance, where they "translate" the WMI calls into an ABI tha=
t
> >can be documented and then parsed by a developer.
>
> I'm not sure what you are talking about exactly. Can you provide some sor=
t of
> example? The scope is quite specific as it is, and will be even more spec=
ific
> once I include the requested changes. There is no ambiguity for the user =
on
> what /sys/firmware/acpi/platform_profile or /sys/class/firmware-attribute=
s/
> lenovo-wmi-gamezone/attributes/ppt_pl1_spl are. As Armin suggested and I =
ack'd,
> capdata01 and Other Method drivers will be linked as components in v2.

To rephrase, your ABI style is not intuitive, because it contains
implementation details such as "gamezone", "capdata01", and "Other
Method", in addition to the ABI being hardcoded to the WMI structure
lenovo uses. The documentation uses those keywords as well.

I just brought up that you could have taken different design choices
to have a cleaner API, and at the same time avoided comments such as
the IdeaPad one or using the Legion name.

If I understand correctly your last sentence, Armin suggested much of
the same (ie combine and merge).

> >Such a design process would then also allow to claim the name legion, as
> >you could make sure the legion driver only loads on Legion laptops, wher=
e
> >now it would randomly load in other laptops as well. Sidenote here is
> >that this is something I also found confusing, as the Legion Go does not
> >have a keyboard so that driver should definitely not load.
>
> This is a consequence of the WMI design in the kernel as is. WMI GUID tab=
les
> only load on devices that implement them. If a device erroneously reports=
 an
> unimplemented GUID that is a problem with the BIOS and it needs (preferre=
d) a
> BIOS update and/or a DMI quirk to block it if loading it creates an issue=
. This
> will be device specific.

An industry practice cannot be a BIOS bug. If Lenovo has a practice of
using those interfaces in all of their BIOSes to allow for future
extension you'd need to take account of that.

Since there are Lenovo reps here they are more equipped to comment on
it than I am.

GUID tables loading !=3D drivers loading also, I would not pin that on
the kernel. You could bail on a stub implementation or require
multiple interfaces be present.

> >E.g., you could only load when you detect the Gamezone interface and the=
n
> >access the other two as well. The Gamezone interface is only used in
> >Legion laptops AFAIK. I think Lenovo also kind of implements all three
> >as stubs even if some are not used, to allow extending them with BIOS
> >updates, so blindly loading drivers based on the interface might not be
> >the best idea in any case. When the Legion Go released, I think only one
> >of the three interfaces was used, for example, but all three were presen=
t.
>
> If we run into a situation where that check passes on a device because th=
e
> interface produces a valid ACPI object that says it is supported even tho=
ugh
> the interface isn't fully implemented then we can quirk it. Also, this is
> contradictory to your point (ii) where you insist these calls are unneces=
sary.

For the first part, see above. As for (ii) I only said they are
unnecessary during writing, not during probe or deriving _min, _max
which would be done once by userspace software.

> >(ii) Unnecessary Accesses
> >Even though you went hands off on your design of the driver, at the same
> >time you held back when it comes to userspace accesses by globally forci=
ng
> >the Other function hints as limits. This creates two issues.
> >
> >The first one is that those limits might be wrong for certain devices or
> >certain users might want to go a bit above them, which would mean that i=
f
> >you enforce them you'd need to provide a way to quirk them and a module
> >parameter override (I know they are correct for the Legion Go as I have
> >looked through them as well). But if it is not necessary in Windows,
> >why would we add additional roadblocks in the kernel? If Lenovo feels th=
e
> >need to enforce them, they can do so in their firmware and extend that
> >protection to Windows as well. Asus does when it comes to their fan curv=
e
> >firmware, for example.
>
> Unless you have some concrete examples of this actually occuring I'm incl=
ined
> to assume that Lenovo knows how to implement their interface. If we do fi=
nd a
> device that has a broken CAPDATA interface, again we can quirk it.
> Notwithstanding that, the data exists and it ensures that the interface i=
sn't
> abused to the point that hardware is pushed beyond its design limitations=
.
> Mario or Xino can correct me here, but I expect AMD and Lenovo have an in=
terest
> in ensuring the kernel doesn't permit settings that can lead to additiona=
l
> RMAs. For users who wish to disregard that there are solutions to modify =
this
> data which void the warranty, as you are well aware. I'll also point out =
that
> Lenovo controls the userspace software in Windows and never intended to s=
upport
> Linux originally, so it is reasonable to assume this was just an oversigh=
t in
> the design and they didn't expect anyone else would implement another WMI=
 driver
> or software when it was designed. In any case, My primary concern is that=
 the
> interface is safe and reliable.

WMI functions are accessible to all software in WIndows without any
limits and there are multiple WIndows software for Legion and Asus
devices that use those interfaces without limits.

So if it is a problem it is in the interest of Lenovo to fix this in
their BIOS, so that they remove that liability from both OSs. Here I
have to say that the max TDP of the device is limited by AMD CBS and
Lenovo has implemented overheating protection so it is actually quite
safe already.

So it is your choice to take on that overhead. If you do take it on,
make sure you dont do extra WMI calls and introduce a quirk system.

> >The second is that you are making a lot of necessary calls, which may ha=
rm
> >performance or potentially cause instability. My workflow for setting TD=
P
> >on the Go is that I first respect the TDP mode the user has set using
> >Legion L + Y. If the user wants to change that, then I do the following:
> >set TDP mode to custom, set the TDP, set the SPL, SPPT, and FPPT, and th=
en
> >set the fan curve. I also add a small delay in-between each of these cal=
ls
> >as a further precaution. In your current driver, each of these calls wou=
ld
> >make two additional calls to the WMI interface (one for the limits and
> >one for the TDP mode), which would more than double the number of calls
> >made in a typical scenario (from 5 to 12), where each triplet is made
> >back to back.
> >
> >There is also the issue mentioned by John, where you do cross-interface
> >interactions etc. To fix this, you'd have to retrieve the limits from
> >firmware on probing and then cache them in the driver after quirking. It
> >would be much easier just to skip all of this for now and just use them =
to
> >prepopulate _min and _max values as hints instead, which you already do.
>
> I had already planned on making this change for other reasons, but I want=
 to
> dispel some misinformation you have presented here. First, I highly doubt
> anyone is making enough calls to this interface that the extra 4ns are go=
ing
> to even be noticed. I would say they are certainly using the interface

That's hardly an argument for making unnecessary calls unfortunately.

> incorrectly if they do. Second, LENOVO_CAPABILITY_DATA_01 is a separate
> interface, and it is (currently) only called once per attribute change. F=
or
> some background, this was originally added when I was permitting the curr=
ent
> fan profile to determine which capability data page was presented and set=
. In
> the submitted version I hard code the page to custom as testing under qui=
et,
> balanced, and performance showed no change.

I do not understand what "I hard code the page to custom" means.

If you mean the capability data does not change you are right, they
are hardcoded in the decompiled ACPI I am pretty sure (it has been
close to a year now so I might be forgetting).

> Technically it is an assumption
> that this will be universally true for all Legion hardware, but the chang=
e was
> made as the final approved version of Mario's patches which added the nec=
essary
> custom profile to platform_profile explicitly states in the documentation=
 that
> "custom" mode is not user selectable. As Armin pointed out, this only app=
lies to
> the legacy interface in /sys/firmware. In any case, you need not worry ab=
out
> this as v2 will not need this call more than once during probe, and gamez=
one
> will not be called by Other Method ever.

When reviewing your code, I saw that it does two checks: one for
checking whether in custom mode and bailing, and one for checking caps
and then bailing. Which equals 3 calls.

It's good that you will be fixing that/I hope you will be fixing that.
It is not clear from your comment. Please try to skip the capability
call too.

If I missed anything lmk

Antheas

> >Those were my comments. You mentioned that you are travelling and might =
not
> >have access to your PC so take your time with the replies.
> >
> >Happy holidays,
> >Antheas
>
>
> [1] https://lore.kernel.org/all/e9f4fb37-5277-a7f0-2bec-8a6909b4e674@linu=
x.intel.com/
> [2] https://lore.kernel.org/all/07fe1bf8-f470-4e40-86ba-0f8d2e61a3e6@amd.=
com/
>
> Cheers,
> Derek
