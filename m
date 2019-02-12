From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: X450LCP lost abillity to turn the screen off
Date: Tue, 12 Feb 2019 12:30:13 +0200
Message-ID: <CAHp75Vdbtou6Y0+He9f70kTRYyDiXR=jBATgTS8LK+SWXwTeUg@mail.gmail.com>
References: <20190210192408.GA81989@bebop> <CAHp75Vc_0tLLSeVjiBLFXZXJSw7Evf=vmBrgbtsj11_SWS_rOg@mail.gmail.com>
 <691cc9a7-e126-a7cf-b3b2-ce5a77eadbeb@gmail.com> <CAOcMMieCjobcM_d-ojuL88cOWFCFZbo=z5X=QWyqi_q7LZ5xHw@mail.gmail.com>
 <e1be4724-38df-ac86-551c-7cfaf8e50b19@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e1be4724-38df-ac86-551c-7cfaf8e50b19@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Cc: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 12, 2019 at 4:31 AM Marcos Paulo de Souza
<marcos.souza.org@gmail.com> wrote:
> On 2/11/19 5:14 PM, Jo=C3=A3o Paulo Rechi Vita wrote:
> > Hello Marcos,
> > On Sun, Feb 10, 2019 at 5:05 PM Marcos Paulo de Souza
> > <marcos.souza.org@gmail.com> wrote:

> > You can check what is being sent by the kernel with evtest, and what
> > is being sent by X with "xinput test <device id>" (and you can find
> > the device id with "xinput list"). And you can re-map it without
> > having to rebuild the kernel using udev's hwdb. But simply re-mapping
> > should not change anything, since userspace does not act on
> > KEY_DISPLAYTOGGLE / KEY_DISPLAY_OFF. If you want to switch back to the
> > old behavior you need to revert "78f3ac76d9e5 platform/x86: asus-wmi:
> > Tell the EC the OS will handle the display off hotkey".
>
> I tried reverting the patch and only recompiling/reinstalling the
> platform/x86 modules, but the problem still happens. My next step will
> be testing agains't 4.20, since my machine was working with 4.12, so I
> might try the major releases first.

When you are going to try older releases, it would be nice to see if
LTS kernels (v4.14.y, v4.19.y from Linux stable tree [1]) behave
differently

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/

--=20
With Best Regards,
Andy Shevchenko
