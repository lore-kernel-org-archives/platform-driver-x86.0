From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Fix bogus keyboard backlight
 sysfs interface
Date: Fri, 16 Jun 2017 12:03:48 +0200
Message-ID: <20170616100348.GA5248@pali>
References: <20170616073539.1185-1-kai.heng.feng@canonical.com>
 <20170616075220.GV5248@pali>
 <CAAd53p4xZw9vxrTf5wr86cG6apf61wB=+8cQ74cPghuBmj_b+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:36649 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753243AbdFPKDw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jun 2017 06:03:52 -0400
Content-Disposition: inline
In-Reply-To: <CAAd53p4xZw9vxrTf5wr86cG6apf61wB=+8cQ74cPghuBmj_b+A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Friday 16 June 2017 17:46:58 Kai-Heng Feng wrote:
> On Fri, Jun 16, 2017 at 3:52 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > Should not this check to be rather:
> >
> > (kbd_token_bits != 0 && (kbd_token_bits & BIT(KBD_LED_OFF_TOKEN)) != BIT(KBD_LED_OFF_TOKEN))
> >
> > To express that we have at least one token at it is different from
> > KBD_LED_OFF_TOKEN token?
> 
> Yes, this expresses the intention more clearly. I'll use it instead.

Err... second part of condition is wrong. It should be:

(kbd_token_bits & ~BIT(KBD_LED_OFF_TOKEN))

(Remove off token bit and check that there is some other bit set too)

> >
> >>               kbd_led_present = true;
> >>  }
> >>
> >
> > And more important, there are three ways how to control keyboard
> > backlight level:
> >
> > 1) Via SMBIOS token
> > 2) Via SMBIOS call 4/11/0x2 (arg2, byte0)
> > 3) Via SMBIOS call 4/11/0x2 (arg3, byte2)
> >
> > You are adding special case when only one SMBIOS toekn OFF is present
> > which belongs to 1).
> >
> > Therefore there should be same check for 2) and 3) that there are more
> > the one option to set...
> 
> I am not familiar with SMBIOS call.
> Can you point out where 2) and 3) functions are?

See function kbd_led_level_set() (which calls kbd_set_level()). Also see
comment above function kbd_get_info().

For 2) there is kbd_mode_levels_count and for 3) there is
kbd_info.levels.

-- 
Pali Rohár
pali.rohar@gmail.com
