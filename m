From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Fri, 15 Jan 2016 18:53:25 +0100
Message-ID: <1452880405.4941.0.camel@chaos.site>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
	 <CALCETrVZ23t8u34VtgC+VVQC4PQ0JAw2u27+W_MQiwS=BgMAXQ@mail.gmail.com>
	 <20160112142538.GB11560@pali>
	 <CALCETrWUJ+5DowyLFDp7N_iNLsday4uKX3iO3NMC8Pfqma=O7w@mail.gmail.com>
	 <20160115142719.36eea015@endymion.delvare>
	 <CALCETrWXVxYLP0yTg4hS7JFjccjskvAF79ec6iSZsKJbLYi9GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALCETrWXVxYLP0yTg4hS7JFjccjskvAF79ec6iSZsKJbLYi9GQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@amacapital.net>
Cc: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,

Le Friday 15 January 2016 =C3=A0 08:27 -0800, Andy Lutomirski a =C3=A9c=
rit :
> FWIW, especially if we consider mapping it persistently, maybe we
> should use ioremap_prot and map it both cached and ro.
>=20
> Actually, switching to a cached mapping regardless of persistence
> could noticeably help boot times.  UC accesses are very, very slow.

Sorry if it is obvious for everybody else, but what does "UC accesses"
mean?

--=20
Jean Delvare
SUSE L3 Support
