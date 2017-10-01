From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 4/8] platform/x86: wmi: create character devices when
 requested by drivers
Date: Sun, 1 Oct 2017 15:23:36 +0200
Message-ID: <20171001132336.GA26295@kroah.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <17fcf9748e83ede2751a00d8248cb32cbdc610d6.1506571188.git.mario.limonciello@dell.com>
 <20170930015228.GC13307@fury>
 <20170930081205.GA22980@kroah.com>
 <81ddaac76f15420b800db365d694e156@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <81ddaac76f15420b800db365d694e156@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 30, 2017 at 07:26:57PM +0000, Mario.Limonciello@dell.com wrote:
> I think what's Darren's most interested in is the that conceptually this is
> an approach you can agree with.
> 
> "A WMI vendor driver binds to the WMI bus and requests the WMI bus to create
> a character device.  The WMI bus creates a character device /dev/wmi/$driver
> which the WMI vendor driver will process all various file operations."

We've been over this before, let's see that actual implementation which
defines the "will process all..." implementation to see if that is
actually an acceptable thing.

thanks,

greg k-h
