From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Date: Tue, 9 Jun 2020 17:49:38 +0200
Message-ID: <20200609154938.udo7mn7ka7z7pr6c@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
 <83fe431cacbc4708962767668ac8f06f@AUSX13MPC105.AMER.DELL.COM>
 <79bd59ee-dd37-bdc5-f6b4-00f2c33fdcff@paritcher.com>
 <7f9f0410696141cfabb0237d33b7b529@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7f9f0410696141cfabb0237d33b7b529@AUSX13MPC105.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com, Sebastian Reichel <sre@kernel.org>
Cc: y.linux@paritcher.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

On Monday 08 June 2020 20:36:58 Mario.Limonciello@dell.com wrote:
> Can you please comment here how you would like to see events like this should come
> through to userspace?
> 
> * Wrong power adapter (you have X and should have Y)
> * You have plugged a dock into the wrong port
> * Fn-lock mode

In my opinion, Fn-lock mode is related to input subsystem and should be
probably reported via input device. For a user, fn-lock is similar like
caps-lock, scroll-lock or num-lock. Also fn-lock is provided by other
laptops and therefore I would expect that kernel provide fn-lock state
for all laptops (thinkpad / latitude / ...) via same interface. And not
via dell-specific interface or general-vendor-message interface.

Wrong power adapter sounds like something related to power subsystem.
Adding Sebastian to the loop, maybe he can provide some useful ideas
about it.

And plugged dock into wrong port. This is probably dell-specific event
and some interface for "vendor" messages from kernel to userspace would
be needed to deliver such things.
