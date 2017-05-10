From: Andy Lutomirski <luto@kernel.org>
Subject: Re: WMI and Kernel:User interface
Date: Wed, 10 May 2017 15:50:44 -0700
Message-ID: <CALCETrWDRSScOFMaC+fKFEryUjd3i4t=wsxmjSS+PAiwi6onww@mail.gmail.com>
References: <20170509231639.GB11404@fury> <20170510051341.GA17835@kroah.com>
 <20170510061026.GA6232@fury> <e346b0f0c5684102aa571b166e21a47e@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e346b0f0c5684102aa571b166e21a47e@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: Darren Hart <dvhart@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 10, 2017 at 3:02 PM,  <Mario.Limonciello@dell.com> wrote:
> So here's a "more" realistic scenario:
>
> OEM has support through a WMI function to control keyboard backlight timeouts
> and intensity.  That same WMI function also can support turning on/off an individual
> USB port.  Backlight timeouts are done by setting the first argument to "1" and USB
> port control is done by setting first argument to "2".
>
> Some userspace app is developed that can control both of these functions through
> the chardev.  Later an enterprising young kernel developer realizes that backlight
> control should be done through a platform driver instead.
>
> They write a platform driver to do it, and add a filter to block "1" arguments from
> userspace.  Now if the userspace app tries to call the chardev with the "1" argument
> some error code is returned indicating this request is not supported.
>
> The result is the userspace app broke, but it broke because the kernel is supporting
> the method in a much smarter and more scalable way.

There's another possibility: the filter could intercept the "1"
argument and change the brightness.

FWIW, I think that almost anything the kernel did with a real WMI API
would be better than the ugly things that drivers like dcdbas allow.

--Andy
