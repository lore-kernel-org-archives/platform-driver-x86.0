From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: never 'select DMI' from a driver
Date: Mon, 29 Feb 2016 15:07:11 -0800
Message-ID: <20160229230711.GH7499@dvhart-mobl5.amr.corp.intel.com>
References: <1456748014-358588-1-git-send-email-arnd@arndb.de>
 <CALCETrVxj0rt=5k7-tfTqwWOfshkkQkajQdhF6OE1we1h_2trw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrVxj0rt=5k7-tfTqwWOfshkkQkajQdhF6OE1we1h_2trw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@amacapital.net>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Andy Lutomirski <luto@kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 29, 2016 at 07:46:58AM -0800, Andy Lutomirski wrote:
> On Mon, Feb 29, 2016 at 4:13 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > CONFIG_DMI is a user-selectable Kconfig symbol that some drivers
> > depend on. As part of a recent patch, other drivers started
> > adding a 'select' for the same symbol, which now causes
> > a recursive dependency:
>=20
> Darren, it may make sense for you to fold the DELL_LAPTOP change in.

Andy, I didn't quite follow you. Are you referring to this patch from A=
rnd, or
from the dell-smbios series from Micha=C5=82?

I'm planning on merging both (Micha=C5=82's is pending a v5).

--=20
Darren Hart
Intel Open Source Technology Center
