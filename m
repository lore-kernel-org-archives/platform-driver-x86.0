From: Richard Hughes <hughsient@gmail.com>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI chip
Date: Thu, 7 May 2020 20:49:05 +0100
Message-ID: <CAD2FfiGweUHNJGdj7OUQFxEhQBYvMCbuWM-+ez=SpN=HbcaS4Q@mail.gmail.com>
References: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
 <aa217de398584fa7846cf4ac0c872036@AUSX13MPC101.AMER.DELL.COM>
 <CAD2FfiEk8Fq3=i_3NHvtuwip=-v_cGfnYSowdPi86U_BcgP2gQ@mail.gmail.com> <61c7782cd2e64bb9ab2aaf6a016bbb6c@AUSX13MPC101.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <61c7782cd2e64bb9ab2aaf6a016bbb6c@AUSX13MPC101.AMER.DELL.COM>
Sender: owner-linux-security-module@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, mika.westerberg@linux.intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 7 May 2020 at 20:22, <Mario.Limonciello@dell.com> wrote:
> By default the driver exposes SPI serial flash contents as read-only but =
it can
> be changed from kernel command line, passing =E2=80=9Cintel-spi.writeable=
=3D1=E2=80=9D.

Ahh, that was the bit I didn't know; having the SPI as readonly by
default is certainly a good idea, and probably sane enough to enable
for Fedora/RHEL as you still need to "do" something manual to enable
SPI writing. I guess I can add my securityfs additions to
intel-spi-pci.c with Mikas approval.

Richard
