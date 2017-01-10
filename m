From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] platform/x86: shut up unused-function warning
Date: Tue, 10 Jan 2017 22:39:04 +0100
Message-ID: <6301921.5KldR71luq@wuerfel>
References: <20170110152857.3140948-1-arnd@arndb.de> <20170110204117.GB4371@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110204117.GB4371@f23x64.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday, January 10, 2017 12:41:17 PM CET Darren Hart wrote:
> 
> Thanks Arnd,
> 
> This appears to be the preferred approach from coding-style.rst 20) Conditional
> Compilation - we have some cleanup to do in this area I guess.
> 
> Queued to next, thanks.

Thanks!

No need to do mass-conversions to __maybe_unused though, 
Kirtika Ruchandani has started working on a way for the suspend/resume
functions to automatically get silently discarded when they are
unused, without having an #ifdef or __maybe_unused annotation.

For new code, using __maybe_unused helps avoid this bug though,
and the conversion to the future macros would be easy enough.

	Arnd
