From: Darren Hart <dvhart@infradead.org>
Subject: Re: [ibm-acpi-devel] [PATCH v2] thinkpad_acpi: Add support for HKEY
 version 0x200
Date: Thu, 9 Jun 2016 12:57:49 -0700
Message-ID: <20160609195749.GN28348@f23x64.localdomain>
References: <20160607235338.GA3147@khazad-dum.debian.net>
 <1465397665-9343-1-git-send-email-cpaul@redhat.com>
 <CAALaSckmmACY6ZxBOKFumT0tJe1Yo24S7-5jsUuREw7SFrde-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAALaSckmmACY6ZxBOKFumT0tJe1Yo24S7-5jsUuREw7SFrde-w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Trevisan =?iso-8859-1?B?KFRyZXZp8W8p?= <mail@3v1n0.net>
Cc: Lyude <cpaul@redhat.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Dennis Wassenberg <dennis.wassenberg@secunet.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, open list <linux-kernel@vger.kernel.org>, "open list:THINKPAD ACPI EXTRAS DRIVER" <platform-driver-x86@vger.kernel.org>, "open list:THINKPAD ACPI EXTRAS DRIVER" <ibm-acpi-devel@lists.sourceforge.net>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jun 09, 2016 at 01:05:12AM -0400, Marco Trevisan (Trevi=F1o) wr=
ote:
> 2016-06-08 10:54 GMT-04:00 Lyude <cpaul@redhat.com>:
> > From: Dennis Wassenberg <dennis.wassenberg@secunet.com>
> >
> > Lenovo Thinkpad devices T460, T460s, T460p, T560, X260 use
> > HKEY version 0x200 without adaptive keyboard.
> >
> > HKEY version 0x200 has method MHKA with one parameter value.
> > Passing parameter value 1 will get hotkey_all_mask (the same like
> > HKEY version 0x100 without parameter). Passing parameter value 2 to
> > MHKA method will retrieve hotkey_all_adaptive_mask. If 0 is returne=
d in
> > that case there is no adaptive keyboard available.
> >
> > Signed-off-by: Dennis Wassenberg <dennis.wassenberg@secunet.com>
> > Signed-off-by: Lyude <cpaul@redhat.com>
> > Tested-by: Lyude <cpaul@redhat.com>
> > Tested-by: Marco Trevisan <marco@ubuntu.com>
> > Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
>=20
> Can you also Cc: stable@vger.kernel.org so that it can be imported
> there once merged?

It doesn't meet stable kernel rules unfortunately, with 143 lines diff.

Henrique, do you want to weigh in on whether this goes back to stable?

One thing I could do is include this in my 4.7-rc fixes branch instead =
of
waiting for 4.8.

--=20
Darren Hart
Intel Open Source Technology Center
