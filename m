From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] thinkpad-acpi: fn-f4 issues
Date: Thu, 27 Jan 2011 11:55:40 -0200
Message-ID: <20110127135540.GA18579@khazad-dum.debian.net>
References: <Pine.LNX.4.64.1101251740380.3737@boston.corp.fedex.com>
 <20110125151346.GB14803@khazad-dum.debian.net>
 <4D3F3AFF.7020407@kabelfunk.de>
 <20110125231651.GB25953@khazad-dum.debian.net>
 <4D409953.7020205@kabelfunk.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D409953.7020205@kabelfunk.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Dominik Kopp <my@kabelfunk.de>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jeff Chua <jeff.chua.linux@gmail.com>, ibm-acpi-devel@lists.sourceforge.net
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 26 Jan 2011, Dominik Kopp wrote:
> Am 26.01.2011 00:16, schrieb Henrique de Moraes Holschuh:
> >The driver IS asking for Fn+F4 events. Please send me the output of
> >acpidump, gzipped.
> acpidump attached.
> >In the meanwhile, check if the input device is producing events when
> >you're pressing Fn+f4.  It could well be sending KEY_SUSPEND, but if
> >there's nobody listening...
> >
> do you mean xev?
> if yes: they are producing KeyPress and KeyRelease events (but nothing else)

So, not a driver bug.  Take it up with your userspace distro...

>     state 0x0, keycode 150 (keysym 0x1008ff2f, XF86Sleep), same_screen YES,

It is even mapped to the correct X keysim...

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
