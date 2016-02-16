From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v3 3/5] dell-wmi: enable receiving WMI events on Dell
 Vostro V131
Date: Tue, 16 Feb 2016 22:53:54 +0100
Message-ID: <20160216215354.GA2741@eudyptula.hq.kempniu.pl>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-4-git-send-email-kernel@kempniu.pl>
 <20160216151739.GK1476@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160216151739.GK1476@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> >  static void __exit dell_wmi_exit(void)
> >  {
> > +	struct calling_interface_buffer *buffer;
> > +
> > +	if (wmi_requires_smbios_request) {
> > +		buffer =3D dell_smbios_get_buffer();
> > +		buffer->input[0] =3D 0x10000;
> > +		buffer->input[1] =3D 0x51534554;
> > +		dell_smbios_send_request(17, 3);
> > +		dell_smbios_release_buffer();
> > +	}
> > +
> >  	wmi_remove_notify_handler(DELL_EVENT_GUID);
> >  	dell_wmi_input_destroy();
> >  }
>=20
> Hi! I would propose moving this get_buffer, send, release code into o=
wn
> function with boolean argument on/off. This de-duplicate same code pl=
us
> decrease level of indentation in _init function. And maybe adding asc=
ii
> string comment representation for that 0x5153... number can be useful=
=2E

Ah, yes, sure.  I will do that in v4.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
