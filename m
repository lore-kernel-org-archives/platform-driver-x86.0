From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH v2 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Date: Tue, 9 Jun 2020 10:50:38 +0200
Message-ID: <20200609085038.vte777tltyeojjxs@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <cover.1591656154.git.y.linux@paritcher.com>
 <74fdb288757cf5970a558f920f531b3bd1c51b47.1591656154.git.y.linux@paritcher.com>
 <20200608233303.57ubv4rxo4tnaaxa@pali>
 <295ad85ecc464a57bffd5b783d4170a1@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <295ad85ecc464a57bffd5b783d4170a1@AUSX13MPC105.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: y.linux@paritcher.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 09 June 2020 00:26:45 Mario.Limonciello@dell.com wrote:
> > Mario, are you able to get some official documentation for these 0x0012
> > event types? I think it could be really useful for community so they can
> > understand and add easily new type of code and events. Because currently
> > we are just guessing what it could be. (It is sequence? Or single event?
> > Or single event with extended data? It is generic event? Or it is real
> > keypress? etc...)
> 
> It's a single event with more data in the subsequent words.  It is definitely
> not a real keypress.  It's supposed to be data that a user application would show.
> 
> Remember the way WMI works on Linux and Windows is different.  On Windows
> userland applications get the events directly.  On Linux kernel drivers get the
> events and either use it internally, pass to another kernel driver or pass to
> userland in the form of a translated event.
> 
> So on Windows the whole buffer gets looked at directly by the application and the
> application will decode it to show a translated string.
> 
> I can certainly discuss internally about our team releasing a patch to export
> all these other events.  I would like to know what interface to recommend it pass
> to userspace though, because as I said this is more than just a keycode that
> comes through in the event.  It's not useful to just do dev_info, it really should
> be something that userspace can act on and show a translated message.
> I don't think we want to add another 15 Dell specific keycodes to the kernel for the
> various events and add another 4 more when a laptop introduces another set of keys.

Which interface to use for events? That is a good question and probably
this should be bring to the linux-input mailinglist. I think that
linux-input maintainers could have idea how to do it properly. We need
some interface which would be general enough and usable also by other
drivers / components and I'm sure that ACPI/WMI is not the only
subsystem which needs to send events from kernel to userspace.
