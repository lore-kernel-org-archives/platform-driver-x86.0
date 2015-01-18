From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/1] fujitsu-laptop: use FB_BLANK_* constants
Date: Sun, 18 Jan 2015 14:22:32 -0800
Message-ID: <20150118222232.GA64157@vmdeb7>
References: <0150118191421.GJ56582@vmdeb7>
 <1421609326-3610-1-git-send-email-kernel@mkarcher.dialup.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1421609326-3610-1-git-send-email-kernel@mkarcher.dialup.fu-berlin.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jan 18, 2015 at 08:28:46PM +0100, Michael Karcher wrote:
> Replace the magic numbers in fujitsu-laptop.c by the appropriate FB_BLANK
> constants, as indicated by the comment for backlight_properties.power in
> include/linux/backlight.h.
> 
> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>

Thanks Michael, queued for 3.20.

-- 
Darren Hart
Intel Open Source Technology Center
