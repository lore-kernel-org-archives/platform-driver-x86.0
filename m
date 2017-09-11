From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] Add driver to force WMI Thunderbolt controller power
 status
Date: Mon, 11 Sep 2017 23:44:58 +0200
Message-ID: <20170911214458.GB128849@localhost.localdomain>
References: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Richard Hughes <hughsient@gmail.com>, Yehezkel Bernat <yehezkelshb@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
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

Queued for testing, thanks everyone.

-- 
Darren Hart
VMware Open Source Technology Center
