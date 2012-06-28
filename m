From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] apple-gmux: Correctly depend on apple_bl for building
Date: Thu, 28 Jun 2012 08:20:58 -0500
Message-ID: <20120628132058.GA15308@thinkpad-t410>
References: <1340879796-30262-1-git-send-email-arun.raghavan@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1340879796-30262-1-git-send-email-arun.raghavan@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Raghavan <arun.raghavan@collabora.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jun 28, 2012 at 04:06:36PM +0530, Arun Raghavan wrote:
> apple_bl_register/unregister() are unconditionally used now, so we need
> to make sure that apple_bl is selected appropriately (built-in/module)
> if apple-gmux is being built.

apple_bl.h provides stubs for these functions when apple_bl is not
built, so this shouldn't be necessary. Are you encoutering a situation
that causes build problems?

Seth
