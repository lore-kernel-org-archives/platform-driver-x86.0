From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH] platform/x86: intel-wmi-thunderbolt: Add dynamic
 debugging
Date: Wed, 26 Sep 2018 21:34:29 +0300
Message-ID: <20180926183429.GP2664@lahna.fi.intel.com>
References: <1537978258-2907-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1537978258-2907-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 26, 2018 at 11:10:58AM -0500, Mario Limonciello wrote:
> Some users have been reporting issues with thunderbolt being turned off
> before fully initialized.  This is suspected to be caused by userspace
> turning off the Thunderbolt controller using intel-wmi-thunderbolt
> prematurely.
> 
> Details are available here:
> https://bugzilla.kernel.org/show_bug.cgi?id=201227
> https://bugzilla.kernel.org/show_bug.cgi?id=199631
> 
> Userspace has already made some mitigiations for this situation:
                                  ^^^^^^^^^^^^
mitigations?

> https://github.com/hughsie/fwupd/commit/ef6f1d76983c9b66
> https://github.com/hughsie/fwupd/commit/c07ce5b4889a5384
> 
> To allow easier debugging of this situation add output that can be turned
> on with dynamic debugging to better root cause this problem.
> 
> Suggested-by: Mika Westerberg <mika.westerberg@intel.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
