From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Date: Tue, 9 Jun 2020 10:04:28 +0200
Message-ID: <20200609080428.bjlimc2mfhn6hjbs@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
 <83fe431cacbc4708962767668ac8f06f@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <83fe431cacbc4708962767668ac8f06f@AUSX13MPC105.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: y.linux@paritcher.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

On Monday 08 June 2020 15:40:53 Mario.Limonciello@dell.com wrote:
> > dell_wmi: Unknown WMI event type 0x12
> > dell_wmi: Unknown key with type 0x0012 and code 0xe035 pressed
> 
> Event type 0x12 is for "System Events".  This is the type of events that
> you typically would see come in for things "like" the wrong power adapter
> being plugged in on Windows or stuff about plugging a Thunderbolt dock into
> a port that doesn't support Thunderbolt.
> 
> A message might look something like (paraphrased)
> "Your system requires a 180W power adapter to charge effectively, but you
> plugged in a 60W adapter."
> 
> There often is extended data with these events.  As such I don't believe all
> information in event type 0x0012 should be treated like scan codes like those in
> 0x10 or 0x11.
> 
> I would guess that Fn-lock on this machine probably has extended data in the next
> showing whether it was turned on and off.  If it does, perhaps it makes sense to
> send this information to userspace as an evdev switch instead.

Thank you for information!

Interesting is that I got this email only now, after all other emails in
this thread. But seems that you have wrote it prior I asked question
about documentation for these events. So probably some email delivery
problem / delay.
