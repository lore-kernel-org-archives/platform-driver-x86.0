From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/4] fujitsu-laptop: acpi_fujitsu_hotkey_notify() cleanup
Date: Wed, 11 Jan 2017 22:28:20 +1030
Message-ID: <20170111115820.GF17476@marvin.atrad.com.au>
References: <20170111085933.2486-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170111085933.2486-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 11, 2017 at 09:59:29AM +0100, Micha?? K??pie?? wrote:
> I am currently preparing a patch series which makes fujitsu-laptop use a
> sparse keymap for hotkey handling.  Before that will happen, though,
> acpi_fujitsu_hotkey_notify() could use a revamp because it is pretty
> hard to read as it is.  To avoid posting everything at once, here are a
> few patches which IMHO make that function easier to read.  Some of these
> changes might be a matter of taste, so feel free to NACK them or suggest
> a preferred alternative.

This patch series provides a significant clean up to the functions it
focuses on.  As such I have no real objections to them.  However, because my
Fujitsu laptop doesn't have any of the hotkeys of later models I am unable
to test these patches with real hardware.  Have you been able to do so?  If
they have been verified I have no problem acking these.  Otherwise I will
have to do as much as I can (given no access to relevant hardware) to ensure
the overall behaviour isn't changed.

Regards
  jonathan
