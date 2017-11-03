From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/4] platform/x86: topstar-laptop: non-functional changes
Date: Fri, 3 Nov 2017 14:40:51 +0200
Message-ID: <CAHp75VdCjnroP7KjYXPMhPS8gi=m4g2Bh75wTcggDxFE69p-rw@mail.gmail.com>
References: <cover.1509229280.git.gdouezangrard@gmail.com> <1833ebbff3c3e84853e668e7e4b8f2a2da432df1.1509229280.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1833ebbff3c3e84853e668e7e4b8f2a2da432df1.1509229280.git.gdouezangrard@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Guillaume_Dou=C3=A9zan=2DGrard?= <gdouezangrard@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Oct 29, 2017 at 1:50 AM, Guillaume Dou=C3=A9zan-Grard
<gdouezangrard@gmail.com> wrote:
> Minor consistency changes to prepare further addition of platform device
> and LED.
>
> More precisely:
>
> * more consistent naming (module description, header text, devices names
> and programming constructs),
>
> * clear separation between systems (ACPI events and input handling),
>
> * copyright and module authors update.

So, since I would anticipated a new version of the patch series, I
would suggest to split this one to few patches:

1. Only renaming
2. Only moving functions around (separation part?)
3. Only indentation / style fixes + your author ship (should be last
in the entire series)


--=20
With Best Regards,
Andy Shevchenko
