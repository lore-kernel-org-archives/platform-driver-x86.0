From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [ibm-acpi-devel] [RFC] Controlling the ThinkPad battery charger
Date: Mon, 9 May 2011 11:10:55 -0400
Message-ID: <BANLkTikB2TFF12vdwLqV9NRw4meEyDjvdA@mail.gmail.com>
References: <BANLkTinWna2sDDjbNC5xyGX3ELROs=Wd0w@mail.gmail.com> <20110509144546.GB13275@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:47008 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751030Ab1EIPLP convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 May 2011 11:11:15 -0400
In-Reply-To: <20110509144546.GB13275@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Anton Vorontsov <cbou@mail.ru>, David Woodhouse <dwmw2@infradead.org>

On Mon, May 9, 2011 at 10:45 AM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Sun, 08 May 2011, Andrew Lutomirski wrote:
>> I've figured out how the ThinkPad SMAPI charge control works (at lea=
st
>> well enough to program thresholds on some models), and I'd like to g=
et
>
> Yeah, there's a little protocol to talk to the EC, otherwise it simpl=
y
> ignores writes to the battery threshold registers. =A0I think you had=
 to set
> bit 7 before you write the threshold to the relevant EC register, or
> something. =A0Found it by trial-and-error a long time ago, I document=
ed it
> somewhere but never took it forward. =A0I never bothered to hunt down=
 the
> force-drain/battery-select commands, though.
>
> Anyway, since SMAPI works, and is *stable* (the fact that it works fr=
om the
> A21 to the latest Lenovos tells you just how stable), which is a lot =
more
> than what I can say about the ACPI stuff, I didn't see any reason to =
mess
> with this.

I must have been unclear.  I'm using SMAPI -- I've reverse-engineered
it from a combination of tp_smapi, the mwave driver, the ancient PDF
on Lenovo's site, and trial-and-error on my X220.  (The X220 fails
requests for the start threshold that work on on the X200s.)

>> 2. Integrate it with power_supply.
>
> Only if we can make it generic enough, but yes, THIS is the better wa=
y.
>
> However, I'd prefer if you went all the way and actually hooked to th=
e SBS
> subsystem and exposed all the battery information. =A0There is a way =
to do
> that through the ACPI DSDT (but you will have to do the rev. engineer=
ing
> yourself, as I said, smapi works just fine across so many models, tha=
t I
> never bothered with it -- it is far better supported than ACPI).
>
> It is not even difficult, just look at the methods used to expose the
> standard ACPI battery interface, then read the Smart Battery System (=
SBS)
> standard, and you will find out by fast trial-and-error how to map on=
e to
> the other. =A0Or you can look at tp_smapi to speed things up (only, t=
p_smapi
> talks directly to the EC instead of doing it over ACPI).
>
> The SBS interface exposes more data about the battery, including
> per-cell-group voltage and pack microcontroller aging counters, alarm=
s, and
> the "needs to get through the fuel-gaugue reset procedure" semasphore=
=2E

If I'm feeling really motivated, I'll look at that.  I'm currently
more interested in the charging thresholds, though, which I think is
independent of the choice of SBS vs ACPI to access the battery state.
(From a quick glance at the SBS spec, you can inhibit charging
entirely but you can't ask for thresholds.  I assume that the EC takes
care of that.  If I'm wrong, please tell me, but SMAPI seems like a
fine way to access the thresholds.)

--Andy
