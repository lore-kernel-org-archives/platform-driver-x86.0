From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [ibm-acpi-devel] [RFC] Controlling the ThinkPad battery charger
Date: Mon, 9 May 2011 11:47:40 -0400
Message-ID: <BANLkTi=Cmhvhnq-dNda8q0AvUBarpyEjyQ@mail.gmail.com>
References: <BANLkTinWna2sDDjbNC5xyGX3ELROs=Wd0w@mail.gmail.com>
 <20110509144546.GB13275@khazad-dum.debian.net> <BANLkTikB2TFF12vdwLqV9NRw4meEyDjvdA@mail.gmail.com>
 <20110509152941.GD13275@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110509152941.GD13275@khazad-dum.debian.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: ibm-acpi-devel@lists.sourceforge.net, Anton Vorontsov <cbou@mail.ru>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 9, 2011 at 11:29 AM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Mon, 09 May 2011, Andrew Lutomirski wrote:
>> > The SBS interface exposes more data about the battery, including
>> > per-cell-group voltage and pack microcontroller aging counters, al=
arms, and
>> > the "needs to get through the fuel-gaugue reset procedure" semasph=
ore.
>>
>> If I'm feeling really motivated, I'll look at that. =A0I'm currently
>> more interested in the charging thresholds, though, which I think is
>> independent of the choice of SBS vs ACPI to access the battery state=
=2E
>> (From a quick glance at the SBS spec, you can inhibit charging
>> entirely but you can't ask for thresholds. =A0I assume that the EC t=
akes
>> care of that. =A0If I'm wrong, please tell me, but SMAPI seems like =
a
>> fine way to access the thresholds.)
>
> Yeah, SMAPI is the safest way to deal with all this. =A0It is an inte=
rface
> layer that Lenovo is not fond of breaking (or touches very rarely. =A0=
Amounts
> to the same in the end).
>
> SBS does not take care of thresholds, indeed. =A0The EC does (and I k=
now how
> to program the threshold in a few models, if you do want to test it i=
n your
> X220, I can send you the information. =A0It is safe to test if you us=
e it
> together with SMAPI to cross-check).

That would be great.  I think it's EC register 0x24 for the BAT0 stop
threshold and EC register 0x25 for the BAT1 stop threshold.  If you
have any hints about the start threshold I can test them, but I
suspect that, in the X220, the EC figures out the start threshold on
its own.

>
> The SBS ACPI interface would be useful to provide a single driver tha=
t can
> replace the ACPI battery one to deliver full functionality in one pla=
ce.
>

I'll save that for later :)

--Andy

> --
> =A0"One disk to rule them all, One disk to find them. One disk to bri=
ng
> =A0them all and in the darkness grind them. In the Land of Redmond
> =A0where the shadows lie." -- The Silicon Valley Tarot
> =A0Henrique Holschuh
>
