From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [PATCH v5] thinkpad-acpi: Improve hardware volume controls
Date: Wed, 3 Aug 2011 09:37:15 -0400
Message-ID: <CAObL_7HrW137JURXAnfQfkkOE-Zp53x5J2MbcOzp0PV+FHT4+Q@mail.gmail.com>
References: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
 <20110614015808.GB27997@khazad-dum.debian.net> <BANLkTimwQavNth_+hemY8F6D0_feUTEqGg@mail.gmail.com>
 <20110723194024.GA29866@khazad-dum.debian.net> <20110803033040.GA17685@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:48927 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750849Ab1HCNhf convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 3 Aug 2011 09:37:35 -0400
Received: by pzk37 with SMTP id 37so83719pzk.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Aug 2011 06:37:35 -0700 (PDT)
In-Reply-To: <20110803033040.GA17685@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Thanks!

Before the patch or something like it hits mainline, it might pay to
make THINKPAD_ACPI_ALSA_SUPPORT non-optional or to tweak the volume
setup a bit.  It currently doesn't work if
THINKPAD_ACPI_ALSA_SUPPORT=3Dn, even if ALSA is really present.

--Andy

On Tue, Aug 2, 2011 at 11:30 PM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> The patch breaks the driver on IBM thinkpads. =A0I have updated it fo=
r the
> pr_foo macros, and I will fix it to do the right thing on older think=
pads so
> that it won't cause the driver to abort probing :-)
>
> Then, I will test it further.
>
> --
> =A0"One disk to rule them all, One disk to find them. One disk to bri=
ng
> =A0them all and in the darkness grind them. In the Land of Redmond
> =A0where the shadows lie." -- The Silicon Valley Tarot
> =A0Henrique Holschuh
>
