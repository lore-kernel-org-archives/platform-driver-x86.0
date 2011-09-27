From: Manuel Lauss <manuel.lauss@googlemail.com>
Subject: Re: [PATCH] topstar-latop: ignore 0x82 event
Date: Tue, 27 Sep 2011 09:08:12 +0200
Message-ID: <CAOLZvyHBA=Vb9aRbSG5FHpJrdRivp4KRLAdBcF_zp4aPNkZzTg@mail.gmail.com>
References: <1317042294-18251-1-git-send-email-manuel.lauss@googlemail.com> <20110926132849.GB2634@herton-IdeaPad-Y430>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:54494 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751327Ab1I0HIc convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Sep 2011 03:08:32 -0400
Received: by gyg10 with SMTP id 10so4874792gyg.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2011 00:08:32 -0700 (PDT)
In-Reply-To: <20110926132849.GB2634@herton-IdeaPad-Y430>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Herton R. Krzesinski" <herton.krzesinski@canonical.com>
Cc: Herton Ronaldo Krzesinski <herton@canonical.com>, platform-driver-x86@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>

On Mon, Sep 26, 2011 at 3:28 PM, Herton R. Krzesinski
<herton.krzesinski@canonical.com> wrote:
> On Mon, Sep 26, 2011 at 03:04:54PM +0200, Manuel Lauss wrote:
>> Event 0x82 is emitted whenever a backlight event happens (brightness
>> change, backlight on/off). =A0For instance, when display is switched
>> off after a timeout, event 0x82 is emitted, and along with it a keyp=
ress
>> which switches the display back on again.
>
> Oh interesting side effect since 170531ba, really sparse_keymap_repor=
t_event
> when not finding the key now generates a KEY_UNKNOWN press.

This is a problem with known hotkeys as well, I usually get "@^" printe=
d on
the current console with every hotkey event.


> The fix is ok, I think the best approach is just ignoring it:

Yes, the annoying "topstar-laptop: unknown event 0x82" message is at le=
ast
gone.


> Acked-by: Herton R. Krzesinski <herton.krzesinski@canonical.com>

Thank you.


        Manuel Lauss
