From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: X450LCP lost abillity to turn the screen off
Date: Mon, 11 Feb 2019 01:45:04 +0200
Message-ID: <CAHp75Vc_0tLLSeVjiBLFXZXJSw7Evf=vmBrgbtsj11_SWS_rOg@mail.gmail.com>
References: <20190210192408.GA81989@bebop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190210192408.GA81989@bebop>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Feb 10, 2019 at 9:24 PM Marcos Paulo de Souza
<marcos.souza.org@gmail.com> wrote:
>
> Hi,
>
> Since 5.0.0-rc4 I vefiried that my ASUS laptop

Can you be more specific, what model, BIOS version, etc (also would be
nice to have dmi strings from it, I guess dmidecode tool would help).
> cannot turn the screen of
> anymore. There were several commits in 5.0 merge window touching this
> functionality like:
>
>   71b12beaf12f platform/x86: asus-nb-wmi: Drop mapping of 0x33 and 0x34 scan codes
>   b3f2f3799a97 platform/x86: asus-nb-wmi: Map 0x35 to KEY_SCREENLOCK
>   78f3ac76d9e5 platform/x86: asus-wmi: Tell the EC the OS will handle the display off hotkey
>

Can you bisect or just try to revert one-by-one from above and see
which one is a culprit?


> I didn't have time to track it down, and my previous working kernel was 4.12
> (default in openSUSE Leap 15), but I hope I will be able to test older kernels this week.
>
> --
> Thanks,
> Marcos



-- 
With Best Regards,
Andy Shevchenko
