From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] toshiba_acpi: Fix keyboard backight sysfs entries not
 being updated
Date: Mon, 23 Nov 2015 10:58:08 -0800
Message-ID: <20151123185808.GT7413@malice.jf.intel.com>
References: <1448301090-5545-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448301090-5545-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 23, 2015 at 10:51:30AM -0700, Azael Avalos wrote:
> Certain Toshiba models with the second generation keyboard backlight
> (type 2) do not generate the keyboard backlight changed event (0x92),
> and thus, the sysfs entries are never being updated.
> 
> This patch adds a workquee and a global boolean variable to address
> the issue.
> 
> For those models that do generate the event, the sysfs entries are
> being updated via the *notify function and the boolean is set to
> true to avoid a second call to update the entries.
> 
> For those models that do not generate the event, the workquee is
> used to update the sysfs entries and also to emulate the event via
> netlink, to make userspace aware of such change.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Queued to testing, thanks!

-- 
Darren Hart
Intel Open Source Technology Center
