From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
Subject: Re: X450LCP lost abillity to turn the screen off
Date: Mon, 11 Feb 2019 11:14:23 -0800
Message-ID: <CAOcMMieCjobcM_d-ojuL88cOWFCFZbo=z5X=QWyqi_q7LZ5xHw@mail.gmail.com>
References: <20190210192408.GA81989@bebop> <CAHp75Vc_0tLLSeVjiBLFXZXJSw7Evf=vmBrgbtsj11_SWS_rOg@mail.gmail.com>
 <691cc9a7-e126-a7cf-b3b2-ce5a77eadbeb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <691cc9a7-e126-a7cf-b3b2-ce5a77eadbeb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Hello Marcos,

On Sun, Feb 10, 2019 at 5:05 PM Marcos Paulo de Souza
<marcos.souza.org@gmail.com> wrote:
>
>
>
> On 2/10/19 9:45 PM, Andy Shevchenko wrote:
> > On Sun, Feb 10, 2019 at 9:24 PM Marcos Paulo de Souza
> > <marcos.souza.org@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> Since 5.0.0-rc4 I vefiried that my ASUS laptop
> >
> > Can you be more specific, what model, BIOS version, etc (also would be
> > nice to have dmi strings from it, I guess dmidecode tool would help).
>
> dmidecode attached.
>
> >> cannot turn the screen of
> >> anymore. There were several commits in 5.0 merge window touching this
> >> functionality like:
> >>
> >>   71b12beaf12f platform/x86: asus-nb-wmi: Drop mapping of 0x33 and 0x3=
4 scan codes
> >>   b3f2f3799a97 platform/x86: asus-nb-wmi: Map 0x35 to KEY_SCREENLOCK
> >>   78f3ac76d9e5 platform/x86: asus-wmi: Tell the EC the OS will handle =
the display off hotkey
> >>
> >
> > Can you bisect or just try to revert one-by-one from above and see
> > which one is a culprit?
>
> I already did some primary analysis, and it seems the commit 3f2f3799a97
> maps the x035 (which is Alt+f7 in my laptop) to SCREENLOCK, which is
> wrong because alt+f7 should be Screen Toggle. I will try to revert this
> commit, or remap to KEY_DISPLAYTOGGLE or KEY_DISPLAY_OFF, and test if it
> works.
>

User-space does not act on KEY_DISPLAYTOGGLE / KEY_DISPLAY_OFF, these
values should be used when the hardware is turning the screen
back-light ON and OFF. According to Asus BIOS engineers, the
back-light used to be driven by the hardware, but they have changed to
the this new approach of telling the OS to drive the back-light for a
while now (no specific dates or BIOS / windows driver versions were
shared). They we actually surprised when we told the that some
machines still have a working implementation (and selected by default
unless told otherwise) of the old behavior, which sounds like it is
the case for the machine you have at hand.

The new behavior, as defined in their spec is to only notify the OS of
the keypress with 0x35, and have the OS "close" the screen, with the
screen being "opened" on mouse or keyboard activity. This closely
matches the screen lock behavior on Linux platforms, so we are mapping
it to KEY_SCREENLOCK in the kernel, and it then gets mapped to
XF86ScreenSaver by xkeyboard-config, and finally gnome-settings-daemon
uses it as a lock screen shortcut (look for "screensaver" in
plugins/media-keys/shortcuts-list.h on the gnome-settings-daemon
repository).

> But yes, I'll do my best to track the problem ASAP at my side. Please
> let me know if I can provide any additional information.
>

You can check what is being sent by the kernel with evtest, and what
is being sent by X with "xinput test <device id>" (and you can find
the device id with "xinput list"). And you can re-map it without
having to rebuild the kernel using udev's hwdb. But simply re-mapping
should not change anything, since userspace does not act on
KEY_DISPLAYTOGGLE / KEY_DISPLAY_OFF. If you want to switch back to the
old behavior you need to revert "78f3ac76d9e5 platform/x86: asus-wmi:
Tell the EC the OS will handle the display off hotkey".

That being said, I believe it would be more productive to figure out
why your userspace stack is not reacting to 0x35 / XF86ScreenSaver and
fix that. Which window manager / graphical desktop environment are you
using?

As a final note, from your dmidecode output I see you are on BIOS
version X450LCP.207, and there is version 208 available for download
on Asus website. I'm curious to know if it changes the old behavior
(with the patches you listed reverted), but I'm not responsible if a
BIOS update breaks your machine in any way, so just do it if you this
is something you are comfortable with and understand and assume all
the risks yourself. We have been reporting machines with the old
behavior back to Asus, but I don't know what they are doing with that
information, if anything. I'm adding your machine with the old BIOS
version to the list, so if you test the new BIOS let me know so I can
add that as well. But please don't feel any pressure to update the
BIOS if this is something you would not do otherwise.

Best regards,

--
Jo=C3=A3o Paulo Rechi Vita
