From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Sun, 13 Mar 2011 12:03:20 +0200
Message-ID: <4D7C9668.3000902@gmail.com>
References: <20110310171940.GA24972@kroah.com> <4D790A20.3050105@gmail.com> <20110310180959.GA26927@kroah.com> <4D793D05.3070908@gmail.com> <20110310211519.GA11862@kroah.com> <4D79CB47.2030405@gmail.com> <20110311170313.GA10202@kroah.com> <4D7A72E3.1050407@gmail.com> <20110311193433.GB14204@kroah.com> <4D7A8419.6080107@gmail.com> <20110311203032.GA14384@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110311203032.GA14384@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Greg,

On 03/11/2011 10:30 PM, Greg KH wrote:
> You can also go into the /sys/class/backlight/samsung/ directory and
> mess with the backlight values in the files to see if it gets brighter
> and dimmer.  If that works, then the driver is working properly.
Thanks :)
I see some strange behavior, though.

Every time I execute this in the /sys/class/backlight/samsung directory:
sudo bash -c 'echo 1 > brightness'
brightness is reduced a little until it reaches the minimum.

After that, every time I execute this:
sudo bash -c 'echo 8 > brightness'
it increases a little until it reaches the maximum.

And each time a message appears in dmesg: "ACPI: Failed to switch the
brightness", until the brightness stops changing.

At the same time, the little Gnome brightness adjustment window appears,
showing the percentage of the brightness, which drops/raises to
minimum/maximum in only four executions of these commands. After that, while
brightness drops/raises with each execution, the percentage stays at
minimum/maximum.

Is this all normal?

Also, brightness buttons seem to invoke the Gnome brightness percentage
window, which shows it changing, but the brightness itself doesn't change.
Is it also normal? If so, is it solved in the newer Gnome and is it what you
tried to tell me before?

Sometime ago I've found this hack on some forum, which I use currently
to set the brightness:

setpci -s 00:02.0 f4.b="$HEX_BYTE"

It allows finer control of the brightness, but it seems it operates directly
on the video card PCI register. I assume there is no sane way to use
this interface from the platform driver, right?

Then, does the wireless on/off button require gnome support too?

Thank you very much :)

Sincerely,
Nick
