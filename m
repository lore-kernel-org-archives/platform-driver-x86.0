From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3] Add driver to force WMI Thunderbolt controller power
 status
Date: Sat, 9 Sep 2017 10:09:29 +0300
Message-ID: <20170909070929.GH2477@lahna.fi.intel.com>
References: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Richard Hughes <hughsient@gmail.com>, Yehezkel Bernat <yehezkelshb@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Sep 08, 2017 at 10:23:11AM -0500, Mario Limonciello wrote:
> Current implementations of Intel Thunderbolt controllers will go
> into a low power mode when not in use.
> 
> Many machines containing these controllers also have a GPIO wired up
> that can force the controller awake.  This is offered via a ACPI-WMI
> interface intended to be manipulated by a userspace utility.
> 
> This mechanism is provided by Intel to OEMs to include in BIOS.
> It uses an industry wide GUID that is populated in a separate _WDG
> entry with no binary MOF.
> 
> This interface allows software such as fwupd to wake up thunderbolt
> controllers to query the firmware version or flash new firmware.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
