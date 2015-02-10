From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH resend 3/6] toshiba_acpi: Add support for Keyboard
 functions mode
Date: Mon, 9 Feb 2015 20:08:09 -0800
Message-ID: <20150210040809.GB37927@fury.dvhart.com>
References: <1423539294-2941-1-git-send-email-coproscefalo@gmail.com>
 <1423539294-2941-4-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1423539294-2941-4-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 09, 2015 at 08:34:51PM -0700, Azael Avalos wrote:
> Recent Toshiba laptops that come with the new keyboard layout have
> the Special Functions (hotkeys) enabled by default, which, in order to
> access the F{1-12} keys, you need to press the FN-F{1-12} key to
> access such key.
> 
> This patch adds support to toggle the Keyboard Functions operation
> mode by creating the sysfs entry "kbd_functions_keys", accepting only
> two parameters, 0 to set the "Normal Operation" mode and 1 to set the
> "Special Functions" mode, however, everytime the mode is toggled, a
> restart is needed.

Erm... that's kinda horrible :-/

A couple of questions then.

1) Does the system BIOS offer a way to select one mode or the other? If so, no
point in adding it here if a reboot is required.

2) Where Toshiba supports this (Windows?) is a reboot required?

Rather than having to reboot, would a userspace mapping possibly be preferable?
Could be done without a reboot.

Finally, if we keep this, we need to print something to the system log
indicating success - and that a reboot is required to take effect.

-- 
Darren Hart
Intel Open Source Technology Center
