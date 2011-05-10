From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [RFC PATCH] thinkpad-acpi: Improve hardware volume controls
Date: Mon, 9 May 2011 20:38:33 -0400
Message-ID: <BANLkTim-gCEZQCCm7HGQp=MmKM4krpmLGg@mail.gmail.com>
References: <bf402af225e7005f052a8ccf92962efa48cbe703.1304979290.git.luto@mit.edu>
 <20110509235332.GA27107@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:60997 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753625Ab1EJAix convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 May 2011 20:38:53 -0400
Received: by pwi15 with SMTP id 15so2593961pwi.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 May 2011 17:38:53 -0700 (PDT)
In-Reply-To: <20110509235332.GA27107@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, May 9, 2011 at 7:53 PM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> Interesting. =A0Let me test it on my T43, it has hardware volume and =
seems to
> cover a class of box you couldn't test.
>
> I like the idea, but I might have some questions to ask you about it.=
 =A0More
> on this after I test the patch in the next few days.

=46WIW, this patch (other than having the wrong default on X220) makes
Linux better than Windows :)

Do you know how to read a field from the EC by name?  I think I can
pull out the default value from the HAUM field, but I don't know how
to access it through acpica and installing a custom method just to
read a register seems like a bad idea.  (The register's in the same
place on X200 and X220, though, so maybe it's stable enough to just
read.  But using the field listing in the DSDT would make me happy.)

Also, do you know how to ask the kernel what the most recent acpi
interrupt was?  I'd like to find a better way to detect the mute
button than watching for the keyboard event.

--Andy

>
> --
> =A0"One disk to rule them all, One disk to find them. One disk to bri=
ng
> =A0them all and in the darkness grind them. In the Land of Redmond
> =A0where the shadows lie." -- The Silicon Valley Tarot
> =A0Henrique Holschuh
>
