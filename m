From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Date: Mon, 8 Jun 2020 22:30:47 +0200
Message-ID: <20200608203047.u4ewb3tyfmatyrsz@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
 <83fe431cacbc4708962767668ac8f06f@AUSX13MPC105.AMER.DELL.COM>
 <79bd59ee-dd37-bdc5-f6b4-00f2c33fdcff@paritcher.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <79bd59ee-dd37-bdc5-f6b4-00f2c33fdcff@paritcher.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Y Paritcher <y.linux@paritcher.com>
Cc: Mario.Limonciello@dell.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

Hello!

On Monday 08 June 2020 16:12:52 Y Paritcher wrote:
> You are right.
> I had assumed (incorrectly) the were the same.
> I turned on dyndbg and got the events with the extended data.
> 
> Fn lock key switched to multimedia keys
> dell_wmi: Received WMI event (02 00 12 00 35 e0 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00)
> the extended data is e0 01
> 
> Fn-lock switched to function keys
> dell_wmi: Received WMI event (02 00 12 00 35 e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00)
> the extended data is e0 00

That is why I asked if buffer is really sequence of events. From your
log can be seen that it is not a sequence, but rather just one event.

> Therefore i agree this should have it's own case in `dell_wmi_process_key` but i am
> not sure yet how to deal with it. any suggestion are helpful.

I guess you could handle it like for event type 0x0000 which also
process one event where can be additional information in buffer.
See relevant code for 0x0000:

		case 0x0000: /* One key pressed or event occurred */
			if (len > 2)
				dell_wmi_process_key(wdev, 0x0000,
						     buffer_entry[2]);
			/* Other entries could contain additional information */
			break;

Just processing of additional information from buffer is not implemented
yet, probably nobody needed it yet.

> About sending it to userspace, I just followed what was already done, if that is not
> desired we should change it for all the models.

Main question if we need to send this event to userspace. Or if we
should drop this event as it is duplicate which was already processed by
other layer. This is something which we do not know and it needs to be
investigated and documented/explained. So in future when will do some
changes in that code, we would know how to handle it without breaking
existing systems.

I would suggest to not describe changes in commit message, but rather
describe explanation of those changes in commit message. E.g. what was
decision and why you are doing it in that way.

It would help in future to know why such code is needed.

E.g. "event XYZ needs to be ignored as kernel receive its duplicate also
via keyboard controller". Or e.g. "event needs to be processed by wmi
driver because notebook's embedded controller sends it only via wmi".
