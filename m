From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [ibm-acpi-devel] [RFC PATCH] thinkpad-acpi: Improve hardware
 volume controls
Date: Mon, 9 May 2011 23:41:06 -0400
Message-ID: <BANLkTinPrPT6YFYtVSyQEj0Nk7E614BYTw@mail.gmail.com>
References: <bf402af225e7005f052a8ccf92962efa48cbe703.1304979290.git.luto@mit.edu>
 <20110509235332.GA27107@khazad-dum.debian.net> <BANLkTim-gCEZQCCm7HGQp=MmKM4krpmLGg@mail.gmail.com>
 <20110510010423.GB27107@khazad-dum.debian.net> <BANLkTi=123OuDKOx=pt=zm3EnVNFV0+FuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f173.google.com ([209.85.212.173]:61592 "EHLO
	mail-px0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752717Ab1EJDl0 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 May 2011 23:41:26 -0400
Received: by pxi16 with SMTP id 16so3994325pxi.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 May 2011 20:41:26 -0700 (PDT)
In-Reply-To: <BANLkTi=123OuDKOx=pt=zm3EnVNFV0+FuQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, May 9, 2011 at 10:36 PM, Andrew Lutomirski <luto@mit.edu> wrote=
:
> On Mon, May 9, 2011 at 9:04 PM, Henrique de Moraes Holschuh
> <hmh@hmh.eng.br> wrote:
>> On Mon, 09 May 2011, Andrew Lutomirski wrote:
>>> FWIW, this patch (other than having the wrong default on X220) make=
s
>>> Linux better than Windows :)
>>
>> Please expand on that, especially the "wrong default on X220"...
>>
>>> Do you know how to read a field from the EC by name? =A0I think I c=
an
>>
>> If it is in the DSDT as a field of a "EmbeddedController" area, you =
just
>> evaluate it. =A0There are several examples in the driver (e.g. the T=
MP* evals
>> in the thermal monitor subdriver).
>
> Indeed :) =A0I'll send an updated patch tomorrow.
>
>>
>>> Also, do you know how to ask the kernel what the most recent acpi
>>> interrupt was? =A0I'd like to find a better way to detect the mute
>>> button than watching for the keyboard event.
>>
>> No, and I'd never ACK it if there was one. =A0ACPI serves GPEs (inte=
rrupts)
>> like crazy for random reasons, =A0Never ever play racy games like th=
at.
>>
>> Don't we get an HKEY notification for mute presses in the X220?
>
> I just meant to figure out what's going on. =A0We're not getting an H=
KEY
> event, I think, but something's happening and a bit of acpi debug
> fiddling says that _Q43 is getting called. =A0I have no idea what tha=
t
> means, though.

I read some more of the spec.  It looks like the EC sends query 43
when the mute status changes.

The problem is that _Q43 just calls _UCMS, which issues an SMI but
does nothing else.  So we don't get notified.  And unless we change
acpi_ec_sync_query to allow more than one handler for the same query,
we can't even get notified without breaking _Q43.  So we're screwed.

I guess relying on the keyboard event isn't *that* bad.

--Andy
