From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v3 1/1] platform/x86: move module mlx-platform from
 arch/x86 to drivers/platform/x86
Date: Tue, 8 Nov 2016 06:19:24 +0000
Message-ID: <AM5PR0501MB20971C6FB6089705CC130C8FA2A60@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1477898553-61392-1-git-send-email-vadimp@mellanox.com>
 <alpine.DEB.2.20.1610310930430.5481@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1610310930430.5481@nanos>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

Could this patch be merged to for-next for 4.10?
When it's merged I'd like to submit another small patch on top of it.

Thanks,
Vadim.

> -----Original Message-----
> From: Thomas Gleixner [mailto:tglx@linutronix.de]
> Sent: Monday, October 31, 2016 5:31 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: dvhart@infradead.org; platform-driver-x86@vger.kernel.org;
> x86@kernel.org; linux-kernel@vger.kernel.org; jiri@resnulli.us;
> andriy.shevchenko@linux.intel.com
> Subject: Re: [patch v3 1/1] platform/x86: move module mlx-platform from
> arch/x86 to drivers/platform/x86
>=20
> On Mon, 31 Oct 2016, Vadim Pasternak wrote:
>=20
> > Since mlx-platform is not an architectural driver, it is moved out of
> > arch/x86/platform to drivers/platform/x86.
> > Relevant Makefile and Kconfig are updated.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>=20
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
