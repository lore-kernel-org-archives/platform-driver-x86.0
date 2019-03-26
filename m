From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 25/27] debugfs: Restrict debugfs when the kernel is
 locked down
Date: Tue, 26 Mar 2019 09:31:37 +0900
Message-ID: <20190326003137.GB5112@kroah.com>
References: <20190325220954.29054-1-matthewgarrett@google.com>
 <20190325220954.29054-26-matthewgarrett@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190325220954.29054-26-matthewgarrett@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <matthewgarrett@google.com>
Cc: jmorris@namei.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com, Andy Shevchenko <andy.shevchenko@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 25, 2019 at 03:09:52PM -0700, Matthew Garrett wrote:
> From: David Howells <dhowells@redhat.com>
> 
> Disallow opening of debugfs files that might be used to muck around when
> the kernel is locked down as various drivers give raw access to hardware
> through debugfs.  Given the effort of auditing all 2000 or so files and
> manually fixing each one as necessary, I've chosen to apply a heuristic
> instead.  The following changes are made:
> 
>  (1) chmod and chown are disallowed on debugfs objects (though the root dir
>      can be modified by mount and remount, but I'm not worried about that).
> 
>  (2) When the kernel is locked down, only files with the following criteria
>      are permitted to be opened:
> 
> 	- The file must have mode 00444
> 	- The file must not have ioctl methods
> 	- The file must not have mmap
> 
>  (3) When the kernel is locked down, files may only be opened for reading.
> 
> Normal device interaction should be done through configfs, sysfs or a
> miscdev, not debugfs.

Then why not just not allow debugfs at all if it is such a "big
problem"?

Actually, it is a big problem, and I am pushing for systems to not mount
debugfs at all these days, but that's a different story...

Just "disabling" it entirely for this crazy dream of a "locked down"
kernel is fine for me.

thanks,

greg k-h
