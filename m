From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 3/3] platform/x86: dell-wmi: add keys to
 bios_to_linux_keycode
Date: Tue, 9 Jun 2020 10:27:30 +0200
Message-ID: <20200609082730.ncs3lbdtzfxb4fma@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <13951508596a3f654c6d47f5380ddb4f38e2f6b5.1591584631.git.y.linux@paritcher.com>
 <20200608090017.4qgtbosz7oullex2@pali>
 <8baab72e3d2e407792c3ffa1d9fffba8@AUSX13MPC105.AMER.DELL.COM>
 <20200608204826.kb7x5mh6hzj2hxcz@pali>
 <f7ab352f27954bbb88bafb41d6b17fe1@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f7ab352f27954bbb88bafb41d6b17fe1@AUSX13MPC105.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: y.linux@paritcher.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

On Monday 08 June 2020 20:58:38 Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
> > owner@vger.kernel.org> On Behalf Of Pali Rohár
> > Sent: Monday, June 8, 2020 3:48 PM
> > To: Limonciello, Mario
> > Cc: y.linux@paritcher.com; linux-kernel@vger.kernel.org; platform-driver-
> > x86@vger.kernel.org; mjg59@srcf.ucam.org
> > Subject: Re: [PATCH 3/3] platform/x86: dell-wmi: add keys to
> > bios_to_linux_keycode
> > 
> > 
> > [EXTERNAL EMAIL]
> > 
> > On Monday 08 June 2020 15:46:44 Mario.Limonciello@dell.com wrote:
> > > I would actually question if there is value to lines in dell-wmi.c like
> > this:
> > >
> > > pr_info("Unknown WMI event type 0x%x\n", (int)buffer_entry[1]);
> > >
> > > and
> > >
> > > pr_info("Unknown key with type 0x%04x and code 0x%04x pressed\n", type,
> > code);
> > >
> > > In both of those cases the information doesn't actually help the user, by
> > default it's
> > > ignored by the driver anyway.  It just notifies the user it's something
> > the driver doesn't
> > > comprehend.  I would think these are better suited to downgrade to debug.
> > And if
> > > a key combination isn't doing something expected the user can use dyndbg
> > to turn it
> > > back on and can be debugged what should be populated or "explicitly"
> > ignored.
> > 
> > My motivation for these messages was to provide information to user that
> > kernel received event, but was not able to process it as it do not
> > understand it.
> > 
> > It could help in situation when user press special key and nothing is
> > delivered to userspace. But he could see that something happened in log.
> > 
> 
> But does a user know what to do with this information?  From time to time
> coming to kernel mailing list, but that's it.

That is a good question. I'm really not sure if user can do anything
with it. But also users do not care about these kind of logs. So
probably even do not know about them.

What is nice in this solution that if you want to try "debug" such
problem you just need to ask user for logs. Nothing is needed to enabled
/ disable.

> I think same person who would know to come to kernel mailing list for a key
> not working can likely also hand turning on dyndbg to get the info.

You are probably right.

In past I did one thing thanks to these logs. I searched for these log
messages on interned. More results were on forum discussions. I tried to
contact users of those posts and I think 3-4 people wrote me back with
details which allowed me to extend dell-wmi driver to handle additional
key codes.

So I see two benefits from these logs: 1) no special setup is needed to
gather these logs (useful for non-power users) and 2) ability to search
on internet if we have laptops which generates such unknown key codes
and users are "complaining" or posting their logs for investigation on
places where are no kernel developers available.

So question is if these two points are reason why to stick with these
logs or turn them off by default.

I still think it can be useful.

> > Similar message is also printed by PS/2 keyboard driver atkbd.c:
> > 
> > 	case ATKBD_KEY_UNKNOWN:
> > 		dev_warn(&serio->dev,
> > 			 "Unknown key %s (%s set %d, code %#x on %s).\n",
> > 			 atkbd->release ? "released" : "pressed",
> > 			 atkbd->translated ? "translated" : "raw",
> > 			 atkbd->set, code, serio->phys);
> > 		dev_warn(&serio->dev,
> > 			 "Use 'setkeycodes %s%02x <keycode>' to make it known.\n",
> > 			 code & 0x80 ? "e0" : "", code & 0x7f);
> > 		input_sync(dev);
> > 		break;
> 
> I think the difference here is that user can actually do something from userland
> to do with `setkeycodes` for PS2.

Of course, I agree.
