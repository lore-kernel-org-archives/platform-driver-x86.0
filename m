From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: add support for thinkpad x100e
Date: Mon, 10 May 2010 09:10:34 -0300
Message-ID: <20100510121034.GA7164@khazad-dum.debian.net>
References: <4BE70795.6060403@udo.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4BE70795.6060403@udo.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrej Gelenberg <andrej.gelenberg@udo.edu>
Cc: borislav@users.sf.net, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, 09 May 2010, Andrej Gelenberg wrote:
> Embedded controller path is "\\_SB.PCI0.LPC0.EC" on Lenovo Thinkpad X100e.

Yeah, and I have a proper fix queued already, that locates the EC by
HID, so NACK.

However, even that is not enough.  The vid_handle needs to be fixed as
well, and there are a few bugs in that area that make it somewhat
not-a-good-idea to just fix the EC detection.

This is why I didn't push the simple fix yet.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
